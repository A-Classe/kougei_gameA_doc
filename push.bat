#!/bin/bash

# リポジトリが存在するかどうかを確認する
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "エラー：Git リポジトリが見つかりませんでした。スクリプトを中断します。"
  exit 1
fi

# 変更があるファイルを表示する
git status --short

# ブランチ名をユーザーに入力してもらう
read -p "ブランチ名を入力してください: " branch_name

# checkout -b xxxx を実行する
git checkout -b "$branch_name"

# add --all を実行する
git add --all

# commit -m を実行する前に、コミットメッセージをユーザーに入力してもらう
read -p "コミットメッセージを入力してください: " commit_message

# commit -m を実行する
git commit -m "$commit_message"

# push --set-upstream xxx を実行する前に、リモート名とブランチ名をユーザーに入力してもらう
read -p "リモート名を入力してください: " remote_name
read -p "ブランチ名を入力してください: " remote_branch_name

# push --set-upstream xxx を実行する
git push --set-upstream "$remote_name" "$remote_branch_name"
