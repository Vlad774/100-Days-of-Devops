#!/bin/bash

# Check if the task name is provided
if [ -z "$1" ]; then
  echo "❌ Error: Please provide a task name."
  exit 1
fi

# Variables
FULL_PATH=$1
# Берём описание из аргумента. Если пусто — пишем дефолт.
TASK_DESCRIPTION="${2:-No description provided in Issue.}" 
CATEGORY=$(dirname "$FULL_PATH")
TASK_NAME=$(basename "$FULL_PATH")
README_PATH="$CATEGORY/README.md"

# 1. Создаем папку
mkdir -p "$FULL_PATH"

# 2. Генерируем ВНУТРЕННИЙ README (Полный)
# Тут мы убрали Mermaid и Requirements, оставили только суть.
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

# 3. Создаем файл для скрипта
touch "$FULL_PATH/solution.sh"
chmod +x "$FULL_PATH/solution.sh"

# 4. Обновляем РОДИТЕЛЬСКИЙ README (Краткий)
if [ -f "$README_PATH" ]; then
    echo "📝 Updating $README_PATH..."
    
    # В таблицу мы НЕ пишем описание. Мы пишем заглушку.
    # Так таблица всегда останется красивой и ровной.
    NEW_ROW="| **$TASK_NAME** | 📄 *See details inside* | \`TBD\` | [View Solution](./$TASK_NAME/) |"
    
    # Вставляем строку перед разделителем ---
    sed -i "/^---/i $NEW_ROW" "$README_PATH"
fi

echo "✅ Task '$TASK_NAME' initialized successfully!"