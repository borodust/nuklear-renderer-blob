#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

lisp download-blobs nkrenderer https://github.com/borodust/bodge-nuklear-renderer \
     "$script_dir/" $1
