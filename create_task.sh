#!/bin/bash

# Validate input: Task name is required
if [ -z "$1" ]; then
  echo "❌ Error: Please provide a task name."
  exit 1
fi

# Set variables from arguments
TASK_NAME="$1"
TASK_DESC="${2:-No description provided.}"
TEMPLATE_TYPE=$(echo "$3" | tr '[:upper:]' '[:lower:]')

# Determine paths based on template type
if [[ "$TEMPLATE_TYPE" == *"terraform"* ]]; then
    BASE_DIR="Terraform"
    TEMPLATE_SOURCE="_templates/terraform"
elif [[ "$TEMPLATE_TYPE" == *"linux"* ]]; then
    BASE_DIR="Linux"
    TEMPLATE_SOURCE="_templates/linux"
else
    BASE_DIR="General"
    TEMPLATE_SOURCE="_templates/general"
fi

# Format directory name (replace spaces with hyphens)
SAFE_DIR_NAME=$(echo "$TASK_NAME" | tr ' /' '-')
FULL_PATH="$BASE_DIR/$SAFE_DIR_NAME"

echo "🚀 Creating Task: $TASK_NAME"
echo "📂 Path: $FULL_PATH"

# 1. Create target directory
mkdir -p "$FULL_PATH"

# 2. Copy template files (Scaffolding)
if [ -d "$TEMPLATE_SOURCE" ]; then
    cp -r "$TEMPLATE_SOURCE/"* "$FULL_PATH/"
    echo "✅ Template copied from $TEMPLATE_SOURCE"
else
    echo "⚠️ Template not found. Creating basic file."
    echo "# $TASK_NAME" > "$FULL_PATH/README.md"
fi

# 3. Replace placeholders in README (Templating)
TARGET_README="$FULL_PATH/README.md"
if [ -f "$TARGET_README" ]; then
    sed -i "s|\[Task Name\]|$TASK_NAME|g" "$TARGET_README"
    sed -i "s|\[Task Description\]|$TASK_DESC|g" "$TARGET_README"
fi

# 4. Update parent README table (Auto-documentation)
PARENT_README="$BASE_DIR/README.md"

if [ -f "$PARENT_README" ]; then
    echo "📝 Updating Table of Contents..."
    
    # Create new table row
    NEW_ROW="| **$TASK_NAME** | 🚧 *Pending* | \`XS\` | \`$TEMPLATE_TYPE\` | [View Solution](./$SAFE_DIR_NAME/) |"
    
    # Insert row before the table separator (---)
    if grep -q "^---" "$PARENT_README"; then
         sed -i "/^---/i $NEW_ROW" "$PARENT_README"
    else
         echo "$NEW_ROW" >> "$PARENT_README"
    fi
fi

echo "🎉 Task initialized successfully!"