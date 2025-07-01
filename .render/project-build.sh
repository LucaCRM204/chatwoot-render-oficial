#!/usr/bin/env bash

corepack enable

pnpm install --no-frozen-lockfile

cd app/javascript
pnpm run build:sdk
cd ../../

# ✅ Instala las gems correctamente
bundle config set --local path 'vendor/bundle'
bundle install --jobs 4 --retry 3

# ✅ Precompila assets después de tener todo instalado
RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Build terminado correctamente"
