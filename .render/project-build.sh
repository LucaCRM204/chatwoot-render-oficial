#!/usr/bin/env bash
set -ex

echo "==> Instalando dependencias..."
pnpm install

echo "==> Saltando build, usando archivos ya compilados"
bundle exec rake db:prepare

echo "==> ✅ Deploy completo sin compilar"
