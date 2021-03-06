#!/bin/bash


docker build --target node-export -f Dockerfile.proto -o type=local,dest=. .
docker build -f solana/Dockerfile.wasm -o type=local,dest=. solana
npm ci --prefix ethereum
npm ci --prefix sdk/js
npm run build --prefix sdk/js
