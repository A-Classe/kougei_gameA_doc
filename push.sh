#!/bin/bash
# リポジトリが存在するかどうかを確認する
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "エラー：Git リポジトリが見つかりませんでした。スクリプトを中断します。"
  exit 1
fi

# 変更があるファイルを表示する
git status --short

# 現在のブランチを取得する
current_branch=$(git symbolic-ref --short HEAD)

# ブランチを切り替えるか、新しいブランチを作成するかをユーザーに尋ねる
read -p "now branch is [${current_branch}]  create new work branch？ (y/n): " is_create_branch
if [ "$is_create_branch" = "y" ] || [ "$is_create_branch" = "Y" ]; then
  # ブランチの一覧を表示する
  branches=$(git branch --list)
  read -p "changed found branch? (y/n)" switch_branch 
 
  git stash
  if [ "$switch_branch" = "y" ] || [ "$switch_branch" = "Y" ]; then

    # ブランチ名をユーザーに入力してもらう
    echo "${branches}"
    read -p "切り替えるブランチ名を入力してください:" branch_name

    # 既存のブランチに切り替える
    git checkout "$branch_name"
  else
    # checkout -b xxxx を実行する前に、ブランチ名をユーザーに入力してもらう
    read -p "新しいブランチ名を入力してください: " new_branch_name

    # checkout -b xxxx を実行する
    git checkout -b "$new_branch_name"
  fi
  git stash pop
fi

# add --all を実行する
git add --all

# commit -m を実行する前に、コミットメッセージをユーザーに入力してもらう
read -p "コミットメッセージを入力してください: " commit_message

# commit -m を実行する
git commit -m "$commit_message"

# push --set-upstream xxx を実行する前に、リモート名とブランチ名をユーザーに入力してもらう
#read -p "リモート名を入力してください: " remote_name
#read -p "ブランチ名を入力してください: " remote_branch_name

# push --set-upstream xxx を実行する
#git push --set-upstream "$remote_name" "$remote_branch_name"
git push --set-upstream origin "$branch_name"
