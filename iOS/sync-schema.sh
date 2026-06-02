#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Copying schema from backend..."
cp "$SCRIPT_DIR/../backend/src/schema.gql" \
   "$SCRIPT_DIR/iOU/iOU/Core/Network/schema.graphqls"

echo "Running Apollo codegen..."
cd "$SCRIPT_DIR/iOU"
apollo-ios-cli generate --path ./apollo-codegen-config.json

echo "Done."
