#!/usr/bin/env bash

corepack enable

pnpm install --no-frozen-lockfile

# ⚠ Omitimos build del SDK para evitar consumo excesivo de RAM
# cd app/javascript
# NODE_OPTIONS="--max-old-space-size=8192" pnpm run build:sdk
# cd ../../

# ✅ Instala las gems necesarias
bundle config set --local path 'vendor/bundle'
bundle install --jobs 4 --retry 3

# ✅ Precompila assets (esto sí es necesario)
RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Build terminado correctamente"
