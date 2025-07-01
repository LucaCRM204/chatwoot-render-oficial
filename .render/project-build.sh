#!/usr/bin/env bash
set -e

echo "==> Instalando dependencias Node..."
pnpm install

echo "==> Step 1: Build del SDK con Node 18 y 16 GB RAM"
NODE_OPTIONS="--max-old-space-size=16384" pnpm run build:sdk

echo "==> Step 2: Precompilando assets (Rails)"
NODE_OPTIONS="--max-old-space-size=8192" bundle exec rake assets:precompile

echo "==> Step 3: Migraciones de base de datos"
bundle exec rake db:prepare

echo "==> Build completo exitoso 🎉"
