#!/bin/bash

# Check if the user provided a task name as an argument
if [ -z "$1" ]; then
  echo "❌ Error: Please provide a task name."
  echo "Usage: ./create_task.sh \"Category/Task-Name\""
  exit 1
fi

# Variables
FULL_PATH=$1
CATEGORY=$(dirname "$FULL_PATH")      # Example: Linux
TASK_NAME=$(basename "$FULL_PATH")    # Example: Permissions-and-ACL
README_PATH="$CATEGORY/README.md"

# 1. Create the directory
mkdir -p "$FULL_PATH"

# 2. Generate inner README.md (Task documentation)
cat <<EOF > "$FULL_PATH/README.md"
# 🛠️ $TASK_NAME

## 📄 Task Description
Write the task description here...

### Requirements:
1.  Requirement 1
2.  Requirement 2

---

## 🏗️ Architecture Diagram

\`\`\`mermaid
graph LR
    User((User)) -->|Action| System[System Component]
    System -->|Process| Output[/Output/]
    
    style System fill:#ccf,stroke:#333,stroke-width:2px
\`\`\`

## 🚀 Solution

### 1. Step One
Description of step one.

\`\`\`bash
# Command here
\`\`\`
EOF

# 3. Create empty solution file
touch "$FULL_PATH/solution.sh"
chmod +x "$FULL_PATH/solution.sh"

# 4. Update Parent README (Table of Contents)
# We check if the category README exists first
if [ -f "$README_PATH" ]; then
    echo "📝 Updating $README_PATH..."
    
    # Prepare the new row for the Markdown table
    # Format: | **Name** | 🚧 TODO... | `TBD` | [View](./Link) |
    NEW_ROW="| **$TASK_NAME** | 🚧 TODO: Add description | \`TBD\` | [View Solution](./$TASK_NAME/) |"
    
    # Use sed to insert the row BEFORE the line containing '---'
    # The command searches for '---' and 'i' (inserts) the line before it.
    sed -i "/^---/i $NEW_ROW" "$README_PATH"
else
    echo "⚠️ Warning: Parent README ($README_PATH) not found. Skipping table update."
fi

# Final Report
echo "✅ Task '$TASK_NAME' initialized successfully!"
echo "📂 Location: $(pwd)/$FULL_PATH"
echo "📄 Updated: $README_PATH"