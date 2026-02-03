#!/bin/bash

# Arguments passed from GitHub Actions
TASK_NAME="$1"
TASK_DESC="${2:-No description provided.}"
CATEGORY="${3:-General}" 
SUBCATEGORY="${4:-}" 

# 1. Prepare Paths
# Convert Category to lowercase to match the _templates folder names (e.g., Terraform -> terraform)
TEMPLATE_FOLDER=$(echo "$CATEGORY" | tr '[:upper:]' '[:lower:]')

# --- Name Sanitization ---

# A. SAFE_NAME (For Folders & Links): Replace spaces and slashes with hyphens
SAFE_TASK_NAME=$(echo "$TASK_NAME" | tr ' /' '-')
SAFE_SUBCAT=$(echo "$SUBCATEGORY" | tr ' /' '-')

# B. DISPLAY_NAME (For Table & README Title): Replace hyphens with spaces for better readability
# This ensures that even if the Issue Title is "My-Task-Name", the Table shows "My Task Name"
DISPLAY_NAME=$(echo "$TASK_NAME" | tr '-' ' ')

# --------------------------

# Define Target Directory Logic
if [ -n "$SUBCATEGORY" ]; then
    # Structure: Category/SubCategory/Task-Name
    TARGET_DIR="$CATEGORY/$SUBCATEGORY/$SAFE_TASK_NAME"
    # Relative link for the README table
    RELATIVE_LINK="./$SUBCATEGORY/$SAFE_TASK_NAME/"
else
    # Structure: Category/Task-Name
    TARGET_DIR="$CATEGORY/$SAFE_TASK_NAME"
    RELATIVE_LINK="./$SAFE_TASK_NAME/"
fi

TEMPLATE_SOURCE="_templates/$TEMPLATE_FOLDER"

echo "🚀 Starting Task Generation..."
echo "📂 Category: $CATEGORY"
echo "📂 Sub-Category: $SUBCATEGORY"
echo "📝 Display Name: $DISPLAY_NAME"
echo "🎯 Target Directory: $TARGET_DIR"

# 2. Create Task Directory (mkdir -p creates nested folders automatically)
mkdir -p "$TARGET_DIR"

# 3. Copy Template Files
if [ -d "$TEMPLATE_SOURCE" ]; then
    echo "✅ Template found! Copying files..."
    cp -r "$TEMPLATE_SOURCE/"* "$TARGET_DIR/"
else
    echo "⚠️ Template '$TEMPLATE_FOLDER' not found in _templates/. Creating default README."
    echo "# $DISPLAY_NAME" > "$TARGET_DIR/README.md"
fi

# 4. Templating (Replace placeholders in the new README.md)
TARGET_README="$TARGET_DIR/README.md"

if [ -f "$TARGET_README" ]; then
    # Clean description (remove newlines to prevent sed/perl errors)
    CLEAN_DESC=$(echo "$TASK_DESC" | tr '\n' ' ')
    
    # Use DISPLAY_NAME (Clean Title) for the H1 Header
    perl -pi -e "s|\[Task Name\]|$DISPLAY_NAME|g" "$TARGET_README"
    perl -pi -e "s|\[Task Description\]|$CLEAN_DESC|g" "$TARGET_README"
fi

# 5. Update Parent README (Table of Contents)
PARENT_README="$CATEGORY/README.md"

if [ -f "$PARENT_README" ]; then
    echo "📝 Updating parent table in $PARENT_README..."
    
    # Prepare Description for the Table (remove pipes to avoid breaking Markdown table)
    TABLE_DESC=$(echo "$TASK_DESC" | tr '\n' ' ' | sed 's/|/-/g') 
    if [ -z "$TABLE_DESC" ] || [ "$TABLE_DESC" == "No description provided." ]; then 
        TABLE_DESC="📄 *See details inside*"
    fi

    # Determine what to show in the "Stack/Skills" column
    STACK_INFO="\`$TEMPLATE_FOLDER\`"
    if [ -n "$SUBCATEGORY" ]; then
        STACK_INFO="\`$SUBCATEGORY\`"
    fi

    # Construct the Table Row (5 Columns)
    # Column 1: Display Name (Spaces, bold)
    # Column 2: Description
    # Column 3: Status (Done)
    # Column 4: Stack (Subcategory or Template name)
    # Column 5: Link (Using Safe Name with hyphens)
    NEW_ROW="| **$DISPLAY_NAME** | $TABLE_DESC | ✅ Done | $STACK_INFO | [View Solution]($RELATIVE_LINK) |"
    
    # Insert row before the "---" separator
    if grep -q "^---" "$PARENT_README"; then
       sed -i "/^---/i $NEW_ROW" "$PARENT_README"
    else
       echo "$NEW_ROW" >> "$PARENT_README"
    fi
fi

echo "🎉 Done! Folder created at $TARGET_DIR"