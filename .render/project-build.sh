#!/usr/bin/env bash
# Script de build para Render (modificado)
set -o errexit

echo "🔧 Habilitando Corepack..."
corepack enable

echo "📦 Instalando dependencias Ruby (bundle install)..."
bundle install --jobs 4 --retry 3

echo "📦 Instalando dependencias Node (pnpm install)..."
pnpm install --no-frozen-lockfile

echo "🛠️ Compilando SDK..."
cd app/javascript
pnpm run build:sdk
cd ../../

echo "🎨 Precompilando assets..."
RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Build terminado correctamente"
