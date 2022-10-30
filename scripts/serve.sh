#!/usr/bin/env bash

(cd ./site && python3 -m http.server) || echo "Failed to serve the site"
