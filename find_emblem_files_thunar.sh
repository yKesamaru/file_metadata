#!/bin/bash

# 検索するディレクトリ（Thunarから渡される）
DIRECTORY="$1"

# 一時的なディレクトリを作成して、検索結果を保存
TEMP_DIR=$(mktemp -d)

# シンボルが付けられたファイルを検索し、結果を一時ディレクトリにシンボリックリンクとして保存
find "$DIRECTORY" -type f | while read -r file; do
    if gio info -a "metadata::emblems" "$file" | grep -q "metadata::emblems"; then
        ln -s "$file" "$TEMP_DIR/$(basename "$file")"
    fi
done

# Thunarで検索結果を表示
thunar "$TEMP_DIR"
