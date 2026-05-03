#!/bin/bash

ORIGEM=$1
DESTINO="/opt/app1"

sudo mkdir -p $DESTINO

rsync -av --include="*.py" --exclude="*" "$ORIGEM/" "$DESTINO/"

chmod +x $DESTINO/*.py

echo "Deploy concluído em $DESTINO"
