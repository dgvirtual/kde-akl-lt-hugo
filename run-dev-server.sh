#!/bin/sh

if [ -z "$PORT" ]; then
    PORT=80
fi

# Runs Hugo server, accessible at http://localhost:$PORT (default to port 80)
docker run -p 127.0.0.1:${PORT}:${PORT} -u $(id -u):$(id -g) -v ${PWD}:/src hugomods/hugo:exts hugo server --bind 0.0.0.0 --port ${PORT}
