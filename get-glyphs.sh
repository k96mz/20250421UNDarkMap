#!/bin/bash

TOKEN=""
BASE_URL="https://pro-ags2.dfs.un.org/arcgis/rest/services/Hosted/Unite_StreetMapDarkVT_CVW_V01/VectorTileServer/resources/fonts"

# フォント名（表示用）と URLエンコードされた名前（URL用）をセットで定義
fonts=(
  "Noto Sans Bold|Noto%20Sans%20Bold"
  "Noto Sans Display Bold|Noto%20Sans%20Display%20Bold"
  "Noto Sans Display Italic|Noto%20Sans%20Display%20Italic"
  "Noto Sans Display Medium Italic|Noto%20Sans%20Display%20Medium%20Italic"
  "Noto Sans Display Medium|Noto%20Sans%20Display%20Medium"
  "Noto Sans Display Regular|Noto%20Sans%20Display%20Regular"
  "Noto Sans Display SemiBold Italic|Noto%20Sans%20Display%20SemiBold%20Italic"
  "Noto Sans Display SemiBold|Noto%20Sans%20Display%20SemiBold"
  "Noto Sans Regular|Noto%20Sans%20Regular"
  "Open Sans Bold|Open%20Sans%20Bold"
  "Open Sans Regular|Open%20Sans%20Regular"
  "Open Sans Semibold|Open%20Sans%20Semibold"
  "Open Sans SemiBold|Open%20Sans%20SemiBold"
)

ranges=(
  0-255
  256-511
)

for font_pair in "${fonts[@]}"; do
  # 分割してローカル用（スペースあり）とURL用（%20）に分ける
  IFS="|" read -r font_dir font_url <<< "$font_pair"

  mkdir -p "glyphs/$font_dir"

  for range in "${ranges[@]}"; do
    echo "Downloading $font_dir $range..."
    curl -s -o "glyphs/$font_dir/$range.pbf" \
      "$BASE_URL/$font_url/$range.pbf?token=$TOKEN"
  done
done