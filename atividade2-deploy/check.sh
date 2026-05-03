#!/bin/bash

DIR=${1:-.}

find "$DIR" -name "*.py" | while read file; do
    python3 -m py_compile "$file"
    
    if [ $? -eq 0 ]; then
        echo "OK: $file"
    else
        echo "ERRO: $file"
    fi
done
