#!/bin/bash
# GitHub kullanıcı adını tüm dosyalara yazar.
# Kullanım: ./setup.sh KULLANICI_ADI
#
# Örnek: ./setup.sh kursat

set -e

if [ -z "$1" ]; then
  echo "Kullanım: ./setup.sh <github-kullanıcı-adı>"
  echo "Örnek:   ./setup.sh kursat"
  exit 1
fi

USER="$1"
REPO="ehliyet-sinavi"
URL="https://${USER}.github.io/${REPO}"
GH="https://github.com/${USER}/${REPO}"

echo "GitHub kullanıcı adı: ${USER}"
echo "Site adresi: ${URL}"
echo

FILES=$(grep -rl "USERNAME" . 2>/dev/null | grep -v "^./setup.sh$" || true)

for f in $FILES; do
  sed -i '' "s|USERNAME|${USER}|g" "$f"
  echo "  ✓ ${f}"
done

echo
echo "Tamamlandı. Şimdi:"
echo "  1. git remote add origin ${GH}.git"
echo "  2. git push -u origin main"
echo "  3. GitHub'da Settings → Pages → Source: GitHub Actions"
echo "  4. Repo açıklaması ve topics'i ayarla (aşağıda)"