#!/bin/sh

set -eu

ICE_VERSION="$1"
VENV=/opt/omero

python -mvenv $VENV
$VENV/bin/pip download "zeroc-ice==$ICE_VERSION"
tar -zxf "zeroc-ice-$ICE_VERSION.tar.gz"
cd "zeroc-ice-$ICE_VERSION"
python setup.py bdist_wheel
cp dist/* /dist/
