#! /usr/bin/env bash

hugo
cp -r public/* ../fuente_blog
surge ../fuente_blog
