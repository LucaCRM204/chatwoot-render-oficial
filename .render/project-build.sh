#!/usr/bin/env bash

corepack enable

pnpm install --no-frozen-lockfile

cd app/javascript

# Aumenta la memoria disponible para Node.js (20 GB)
export NODE_OPTIONS="--max-old-space-size=20144"
pnpm run build:sdk

cd ../../

# Instala las gems correctamente
bundle config set --local path 'vendor/bundle'
bundle install --jobs 4 --retry 3

# Precompila assets después de tener todo instalado
RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Build terminado correctamente"