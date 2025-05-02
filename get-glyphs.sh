TOKEN="m8vAxaa8CBcxqomyNrQX_nlgwrKvQJC7ZNSekfdajaEXLA20YTyDyL166lOEMZQ6Ut4LTv52zuPNAwJRscC96I0SuMtR-c3EpoyKGc-H0dV8WmDKlNkm6Bg_vk2uHlRPl4Ssir7d_73KTZ7flfB_HFFSAC7ZVrxnIA6ktzn_zhUKVakFuS8_92ULk_f4eBlhuWV58caXoqzs3Ffqwqtb4-uIxnTh8XfBTpQHKJnLj1maNIXYAFH8MKPYW7_9arMxfWq1v7p78BJ4ofcXUdmd0tM76rTdJMbblpGEtfTkUR-jLI7YcpXDFUxVLGc4VtM"
BASE_URL="https://pro-ags2.dfs.un.org/arcgis/rest/services/Hosted/Unite_StreetMapDarkVT_CVW_V01/VectorTileServer/resources/fonts"

for font in \
  "Noto%20Sans%20Bold" \
  "Noto%20Sans%20Display%20Bold" \
  "Noto%20Sans%20Display%20Italic" \
  "Noto%20Sans%20Display%20Medium%20Italic" \
  "Noto%20Sans%20Display%20Medium" \
  "Noto%20Sans%20Display%20Regular" \
  "Noto%20Sans%20Display%20SemiBold%20Italic" \
  "Noto%20Sans%20Display%20SemiBold" \
  "Noto%20Sans%20Regular" \
  "Open%20Sans%20Bold" \
  "Open%20Sans%20Regular" \
  "Open%20Sans%20Semibold" \
  "Open%20Sans%20SemiBold"
do
  mkdir -p "glyphs/$font"
  for range in 0-255 256-511
  do
    curl -s -o "glyphs/$font/$range.pbf" "$BASE_URL/$font/$range.pbf?token=$TOKEN"
  done
done