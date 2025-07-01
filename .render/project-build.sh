#!/usr/bin/env bash

corepack enable
pnpm install --no-frozen-lockfile

# 🧠 Aumenta la memoria disponible para Node.js (16 GB)
export NODE_OPTIONS="--max-old-space-size=16384"

# 👉 Primero compilamos el SDK (frontend)
cd app/javascript
pnpm run build:sdk
cd ../../

# ✅ Instalamos las gems de Ruby
bundle config set --local path 'vendor/bundle'
bundle install --jobs 4 --retry 3

# 👉 Después precompilamos los assets
RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Build terminado correctamente"
