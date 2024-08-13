#!/bin/bash

# 検索を開始するディレクトリを指定
DIRECTORY=${1:-.}

# ディレクトリを再帰的に検索し、metadata::emblemsが設定されているファイルを表示
find "$DIRECTORY" -type f | while read -r file; do
    if gio info -a "metadata::emblems" "$file" | grep -q "metadata::emblems"; then
        echo "$file"
    fi
done
