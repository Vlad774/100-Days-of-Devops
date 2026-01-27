#!/bin/bash

# Arguments passed from GitHub Actions
TASK_NAME="$1"
TASK_DESC="${2:-No description provided.}"
CATEGORY="${3:-General}" 

# 1. Prepare Paths
# Convert Category to lowercase to match the _templates folder names (e.g., Terraform -> terraform)
TEMPLATE_FOLDER=$(echo "$CATEGORY" | tr '[:upper:]' '[:lower:]')

# Sanitize Task Name for directory creation (replace spaces/slashes with hyphens)
SAFE_TASK_NAME=$(echo "$TASK_NAME" | tr ' /' '-')

# Define paths
# TARGET_DIR keeps the original capitalization for the parent folder (e.g., Terraform/Task-Name)
TARGET_DIR="$CATEGORY/$SAFE_TASK_NAME"
TEMPLATE_SOURCE="_templates/$TEMPLATE_FOLDER"

echo "🚀 Starting Task Generation..."
echo "📂 Category: $CATEGORY"
echo "📄 Template Source: $TEMPLATE_SOURCE"
echo "🎯 Target Directory: $TARGET_DIR"

# 2. Create Task Directory
mkdir -p "$TARGET_DIR"

# 3. Copy Template Files
if [ -d "$TEMPLATE_SOURCE" ]; then
    echo "✅ Template found! Copying files..."
    cp -r "$TEMPLATE_SOURCE/"* "$TARGET_DIR/"
else
    echo "⚠️ Template '$TEMPLATE_FOLDER' not found in _templates/. Creating default README."
    echo "# $TASK_NAME" > "$TARGET_DIR/README.md"
fi

# 4. Templating (Replace placeholders in README.md)
TARGET_README="$TARGET_DIR/README.md"

if [ -f "$TARGET_README" ]; then
    # Clean description (remove newlines to prevent errors in replacement)
    CLEAN_DESC=$(echo "$TASK_DESC" | tr '\n' ' ')
    
    # Use perl for safe replacement of [Task Name] and [Task Description]
    perl -pi -e "s|\[Task Name\]|$TASK_NAME|g" "$TARGET_README"
    perl -pi -e "s|\[Task Description\]|$CLEAN_DESC|g" "$TARGET_README"
fi

# 5. Update Parent README (Table of Contents)
PARENT_README="$CATEGORY/README.md"

if [ -f "$PARENT_README" ]; then
    echo "📝 Updating parent table in $PARENT_README..."
    
    # Create the new table row
    NEW_ROW="| **$TASK_NAME** | 🚧 *In Progress* | \`$TEMPLATE_FOLDER\` | [Go to Solution](./$SAFE_TASK_NAME/) |"
    
    # Insert the row before the table separator (---) if it exists, otherwise append to end
    if grep -q "^---" "$PARENT_README"; then
       sed -i "/^---/i $NEW_ROW" "$PARENT_README"
    else
       echo "$NEW_ROW" >> "$PARENT_README"
    fi
fi

echo "🎉 Done! Folder created at $TARGET_DIR"