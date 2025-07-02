#!/usr/bin/env bash
set -e

echo "==> Instalando dependencias..."
pnpm install

echo "==> Step 1: Build SDK con 16GB RAM"
NODE_OPTIONS="--max-old-space-size=16384" pnpm run build:sdk

echo "==> Step 2: Build Vite frontend con 16GB RAM"
NODE_OPTIONS="--max-old-space-size=16384" pnpm exec vite build --force --emptyOutDir # Asegurate que "build" use Vite

echo "==> Step 3: Precompile assets"
NODE_OPTIONS="--max-old-space-size=8192" bundle exec rake assets:precompile

echo "==> Step 4: Migraciones"
bundle exec rake db:prepare

echo "==> ✅ Build finalizado correctamente"
