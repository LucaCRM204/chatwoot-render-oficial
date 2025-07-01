#!/usr/bin/env bash

# ✅ Habilita Corepack y PNPM
corepack enable

# ✅ Instala dependencias JS
pnpm install --no-frozen-lockfile

# ✅ Instala dependencias Ruby
bundle config set --local path 'vendor/bundle'
bundle install --jobs 4 --retry 3

# ✅ Compila el SDK con más memoria
export NODE_OPTIONS="--max-old-space-size=16384"
cd app/javascript
pnpm run build:sdk
cd ../../

# ✅ Precompila los assets (esto ya no ejecuta build:sdk, solo empaqueta lo compilado)
RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Build completo sin errores"