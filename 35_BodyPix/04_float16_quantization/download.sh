#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=17SckgeXXt3NVDNDG8xUqhK31rWPfO_gk" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=17SckgeXXt3NVDNDG8xUqhK31rWPfO_gk" -o resources.tar.gz
tar -zxvf resources.tar.gz
rm resources.tar.gz

echo Download finished.