#!/bin/bash

BASE_URL="https://pro-ags2.dfs.un.org/arcgis/rest/services/Hosted/Unite_StreetMapDarkVT_CVW_V01/VectorTileServer/tile"
TOKEN=""

for z in {0..5}; do
  max=$((2 ** z - 1))
  for x in $(seq 0 $max); do
    for y in $(seq 0 $max); do
      DIR="tiles/$z/$x"
      FILE="$DIR/$y.pbf"
      mkdir -p "$DIR"
      echo "Downloading z=$z x=$x y=$y..."
      curl -s -o "$FILE" "${BASE_URL}/${z}/${y}/${x}.pbf?token=${TOKEN}"
    done
  done
done