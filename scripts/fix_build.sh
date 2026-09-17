#!/usr/bin/env bash

set -eux

find _build/pydata_sphinx_theme/ -name "*.html" -exec sed -i '/fontawesome/d' {} +
find _build/pydata_sphinx_theme/ -name "*.html" -exec sed -i 's/script src="searchindex.js"/script defer src="searchindex.js"/' {} +

rm _build/pydata_sphinx_theme/_static/scripts/fontawesome.js*
