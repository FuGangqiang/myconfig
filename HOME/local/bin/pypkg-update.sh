#!/bin/bash

if [ -d dist ]; then
    rm -rf dist
fi

python setup.py register
python setup.py bdist_wheel
twine upload dist/*
