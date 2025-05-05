#!/bin/bash

# トークンとベースURLを設定
TOKEN=""
BASE_URL="https://pro-ags2.dfs.un.org/arcgis/rest/services/Hosted/Unite_StreetMapDarkVT_CVW_V01/VectorTileServer/tile"

# タイルリスト（z/x/y 形式）
tiles=(
  "6/39/32"
  "7/78/65"
  "8/156/130"
  "9/312/261"
  "10/624/523"
)

# 保存ディレクトリを作成
mkdir -p tiles

# タイルを1つずつダウンロード
for tile in "${tiles[@]}"; do
  z=$(echo "$tile" | cut -d'/' -f1)
  x=$(echo "$tile" | cut -d'/' -f2)
  y=$(echo "$tile" | cut -d'/' -f3)

  # 保存パス
  mkdir -p "tiles/$z/$x"
  filepath="tiles/$z/$x/$y.pbf"

  # URLを構築して取得
  curl -s -o "$filepath" "$BASE_URL/$z/$x/$y.pbf?token=$TOKEN"

  echo "Downloaded: $filepath"
done