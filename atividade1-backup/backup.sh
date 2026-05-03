#!/bin/bash
ORIGEM=$1
DESTINO=$2
DATA=$(date +"%Y-%m-%d")
NOME_DIR=$(echo $ORIGEM | sed 's/\//_/g')
ARQUIVO="${DATA}_backup_${NOME_DIR}.tar.gz"
tar -czf "$DESTINO/$ARQUIVO" "$ORIGEM"
echo "Backup criado em: $DESTINO/$ARQUIVO"
