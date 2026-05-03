#!/bin/bash

REPO="https://github.com/fabricfc/pythonserver"
PASTA="pythonserver"

git clone $REPO
cd $PASTA

ERRO=0

for file in $(find . -name "*.py"); do
    python3 -m py_compile "$file"

    if [ $? -ne 0 ]; then
        echo "Erro em $file"
        ERRO=1
    fi
done

if [ $ERRO -ne 0 ]; then
    git checkout -b fixpythonLint
    echo "Corrija os erros manualmente"
    exit 1
fi

git checkout main
git merge fixpythonLint

sudo mkdir -p /opt/app1
rsync -av . /opt/app1

python3 app.py &

sleep 2

curl http://localhost:8000
