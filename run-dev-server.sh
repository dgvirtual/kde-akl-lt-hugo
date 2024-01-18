#/bin/sh
# Runs Hugo server, accessible at http://localhost:1313
docker run -p 1313:1313 -u $(id -u):$(id -g) -v ${PWD}:/src hugomods/hugo:exts hugo server --bind 0.0.0.0
