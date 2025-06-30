#!/usr/bin/env bash
set -o errexit

echo "📦 Instalando dependencias Ruby..."
bundle install

echo "📦 Instalando dependencias Node..."
yarn install

echo "🚀 Precompilando assets..."
bundle exec rails assets:precompile

echo "✅ Build completo"
