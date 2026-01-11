#!/bin/bash

# Check if the task name is provided as an argument
if [ -z "$1" ]; then
  echo "❌ Error: Please provide a task name."
  exit 1
fi

# Variables
FULL_PATH=$1
# Use the second argument as the description. If empty, use a default value.
TASK_DESCRIPTION="${2:-No description provided in Issue.}" 
CATEGORY=$(dirname "$FULL_PATH")
TASK_NAME=$(basename "$FULL_PATH")
README_PATH="$CATEGORY/README.md"

# 1. Create the directory
mkdir -p "$FULL_PATH"

# 2. Generate the inner README.md (Task documentation)
# We kept this clean: removed Mermaid diagrams and extra sections to focus on content.
cat <<EOF > "$FULL_PATH/README.md"
# 🛠️ $TASK_NAME

## 📄 Task Description
$TASK_DESCRIPTION

---

## 🚀 Solution

### 📝 Execution Steps:

\`\`\`bash
# Write your commands here...
\`\`\`
EOF

# 3. Create the solution script file
touch "$FULL_PATH/solution.sh"
chmod +x "$FULL_PATH/solution.sh"

# 4. Update the Parent README (Table of Contents)
if [ -f "$README_PATH" ]; then
    echo "📝 Updating $README_PATH..."
    
    # We do NOT write the full description in the table. We use a placeholder.
    # This keeps the table clean and prevents formatting issues (like broken tables).
    NEW_ROW="| **$TASK_NAME** | 📄 *See details inside* | \`TBD\` | [View Solution](./$TASK_NAME/) |"
    
    # Insert the new row before the '---' separator
    sed -i "/^---/i $NEW_ROW" "$README_PATH"
fi

echo "✅ Task '$TASK_NAME' initialized successfully!"