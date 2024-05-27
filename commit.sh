#!/bin/bash

# check if the CSV file exists
if [ ! -f "bug_tasks.csv" ]; then
    echo "Error: bug_tasks.csv file not found."
    exit 1
fi

current_branch=$(git rev-parse --abbrev-ref HEAD)

task_info=$(grep -w "$current_branch" bug_tasks.csv)

if [ -z "$task_info" ]; then
    echo "Error: No task found for the current branch in bug_tasks.csv."
    exit 1
fi

# extract task information from the CSV
bug_id=$(echo $task_info | cut -d',' -f1)
dev_name=$(echo $task_info | cut -d',' -f4)
priority=$(echo $task_info | cut -d',' -f5)
excel_description=$(echo $task_info | cut -d',' -f2)
current_datetime=$(date +%Y%m%d_%H%M%S)

if [ $# -eq 1 ]; then
    dev_description=$1
else
    dev_description=""
fi

git add .
git commit -m "BugID:$bug_id:$current_datetime:$current_branch:$dev_name:$priority:$excel_description:$dev_description"
git push origin $current_branch

# check if the Git push was successful
if [ $? -ne 0 ]; then
    echo "Error: Git push failed."
    exit 1
fi


echo "Git commit and push completed successfully."