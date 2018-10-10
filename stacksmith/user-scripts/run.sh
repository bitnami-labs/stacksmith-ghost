#!/bin/bash

# Catch errors and undefined variables
set -euo pipefail

source "${UPLOADS_DIR}/env"

echo "=> Starting Ghost..."
cd "$APP_DIR"
NODE_ENV=production node index.js

