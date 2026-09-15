lychee --cache --insecure --accept 200,301,302,403,406 --max-redirects 0 -vv _build/pydata_sphinx_theme/  >&  _build.lychee
more _build.lychee | egrep -v '200|301|302|403|406|EXCLUDED|/en/|usnews' | sort -u
