#!/bin/sh

branch_name=$(git symbolic-ref -q HEAD)
branch_name=${branch_name##refs/heads/}
branch_name=${branch_name:-HEAD}

commit_type="$(cut -d'/' -f1 <<<"$branch_name")"
jira_id="$(cut -d'/' -f2 <<<"$branch_name")"
command="$commit_type"

if [ -z "$1" ]; then
  echo "Error : Please use format [./commit.sh <project name> <commit message>]"
  exit
else
  project_name=$(echo $1 | tr '[:lower:]' '[:upper:]')
  if [[ $jira_id == NO-JIRA* ]];
  then
    jira_id="NO-JIRA"
  fi
  
  command="$command($project_name#$jira_id):"
  echo "Commiting on $project_name#$jira_id"
  
  if [ "$2" ]; then
    command="$command $2"
  else
    echo "Commiting an automatic fix"
    command="$command fix"
  fi
fi

echo $(git commit -m "$command")
