#!/bin/sh
set -e
echo "prepare built in dicts"
mkdir  -p /lzcapp/var/dicts
if [ ! -f "/lzcapp/var/dicts/牛津高阶英汉双解词典（第9版）.mdx" ]; then
    ln -s "/lzcapp/pkg/content/牛津高阶英汉双解词典（第9版）.mdx" "/lzcapp/var/dicts/牛津高阶英汉双解词典（第9版）.mdx"
fi
if [ ! -f "/lzcapp/var/dicts/韦氏高阶英汉双解词典v3.mdx" ]; then
    ln -s "/lzcapp/pkg/content/韦氏高阶英汉双解词典v3.mdx" "/lzcapp/var/dicts/韦氏高阶英汉双解词典v3.mdx"
fi

mkdir -p /lzcapp/var/static
cp -r /lzcapp/pkg/content/css/* /lzcapp/var/static/

export BUILTIN_DICT_DIR=/lzcapp/var/dicts
export USER_STATIC_PATH=/lzcapp/var/static
export HOST=0.0.0.0
echo "prepare done,start app"

/lzcapp/pkg/content/mewow-dict
