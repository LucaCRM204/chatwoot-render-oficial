#!/usr/bin/env bash

corepack enable
pnpm install --no-frozen-lockfile

cd app/javascript

# ✅ Ahora el build:sdk usa la variable correctamente
NODE_OPTIONS=--max-old-space-size=16384 pnpm run build:sdk

cd ../../

bundle config set --local path 'vendor/bundle'
bundle install --jobs 4 --retry 3

RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Build terminado correctamente"
