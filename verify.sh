#!/bin/bash

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <dir1> [<dir2> ...]"
  exit 1
fi

OUTPUT_DIR="verify"

mkdir -p "$OUTPUT_DIR"

for TARGET_DIR in "$@"; do
  echo "Processing $TARGET_DIR"
  protoc  --go_out=$OUTPUT_DIR --go_opt=paths=source_relative \
          --go-grpc_out=$OUTPUT_DIR --go-grpc_opt=paths=source_relative \
          "$TARGET_DIR"/*.proto
done

rm -rf "$OUTPUT_DIR"

echo "Verify successful"