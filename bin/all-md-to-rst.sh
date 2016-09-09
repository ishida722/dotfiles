#!/bin/sh

# ディレクトリ内の md ファイルを全て rst に変換する
for f in *.md
do
    pandoc -o ${f%.*}.rst $f
    echo "$f convert"
done
