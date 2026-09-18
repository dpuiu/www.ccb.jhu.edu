#!/usr/bin/env bash

set -eux

find _build/pydata_sphinx_theme/ -name "*.html" -exec sed -i 's/script src="/script defer src="/' {} +
find _build/pydata_sphinx_theme/ -name "*.html" -exec sed -i '/<link rel="preload"/d' {} +
