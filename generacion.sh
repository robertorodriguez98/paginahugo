#! /usr/bin/env bash

hugo -D
cp -r public ../fuente_blog
surge ../fuente_blog