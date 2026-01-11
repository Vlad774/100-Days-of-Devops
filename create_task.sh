#!/bin/bash

# Check if the task name is provided
if [ -z "$1" ]; then
  echo "❌ Error: Please provide a task name."
  exit 1
fi

# Variables
FULL_PATH=$1
# We use the second argument as description. If empty, use default text.
TASK_DESCRIPTION="${2:-Write the task description here...}" 
CATEGORY=$(dirname "$FULL_PATH")
TASK_NAME=$(basename "$FULL_PATH")
README_PATH="$CATEGORY/README.md"

# 1. Create directory
mkdir -p "$FULL_PATH"

# 2. Generate inner README.md
cat <<EOF > "$FULL_PATH/README.md"
# 🛠️ $TASK_NAME

## 📄 Task Description
$TASK_DESCRIPTION

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

# 3. Create solution file
touch "$FULL_PATH/solution.sh"
chmod +x "$FULL_PATH/solution.sh"

# 4. Update Parent README
if [ -f "$README_PATH" ]; then
    echo "📝 Updating $README_PATH..."
    NEW_ROW="| **$TASK_NAME** | 🚧 TODO: Summary | \`TBD\` | [View Solution](./$TASK_NAME/) |"
    sed -i "/^---/i $NEW_ROW" "$README_PATH"
fi

echo "✅ Task '$TASK_NAME' initialized successfully!"