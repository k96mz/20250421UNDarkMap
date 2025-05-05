#!/bin/bash

BASE_URL="https://pro-ags2.dfs.un.org/arcgis/rest/services/Hosted/Unite_StreetMapDarkVT_CVW_V01/VectorTileServer/tile"
TOKEN="m8vAxaa8CBcxqomyNrQX_nlgwrKvQJC7ZNSekfdajaEXLA20YTyDyL166lOEMZQ6Ut4LTv52zuPNAwJRscC96CAKdEdh6_Bg9SWcyN_JzJfgzV9QlV2TMpN7TwC0sAoucHsL-m44t4E0jMjr8JnRSxtQ80EhEhDVRv5D4NvzwA-VNM2mbrOpqUIgpKc5tc-jVc8PeWUTLL22Zo6WPKhcH4i6IlDkvttmo_h7hInwiwIW86LlhQJ69V5DCdnlLxGPRz8hGlwtjszrEgSEuA4gIfPsyB9yvPQfA9LRycDhdaRHdwcUK-1mhPPcCXcunGli"

START_ZOOM=10
END_ZOOM=15
START_X=624
START_Y=523

for z in $(seq $START_ZOOM $END_ZOOM); do
  scale=$((2 ** (z - START_ZOOM)))
  x_start=$((START_X * scale))
  y_start=$((START_Y * scale))
  x_end=$(((START_X + 1) * scale - 1))
  y_end=$(((START_Y + 1) * scale - 1))

  for x in $(seq $x_start $x_end); do
    for y in $(seq $y_start $y_end); do
      dir="tiles/$z/$x"
      mkdir -p "$dir"
      url="$BASE_URL/$z/$x/$y.pbf?token=$TOKEN"
      outfile="$dir/$y.pbf"
      echo "Downloading $z/$x/$y ..."
      curl -s -o "$outfile" "$url"
    done
  done
done