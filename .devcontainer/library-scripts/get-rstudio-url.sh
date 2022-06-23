#/bin/bash

TOKEN=$(jupyter lab list | grep -o 'token=[[:alnum:]]*')

echo "http://127.0.0.1:8888/?$TOKEN"