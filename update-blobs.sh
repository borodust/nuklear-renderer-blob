#!/usr/bin/env bash

name=nkrenderer
repository_url=https://github.com/borodust/bodge-nuklear-renderer


if [[ -z  $1 ]] ; then
   echo "Version is not provided!"
   exit 1;
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -A platforms
platforms=(["linux"]="so" ["osx"]="dylib" ["windows"]="dll")

declare -A archs
archs=(["x86_64"]="x86_64" ["i686"]="x86")

for arch in "${!archs[@]}" ; do
    target_dir="$script_dir/${archs[$arch]}"
    mkdir -p "$target_dir"
    for platform in "${!platforms[@]}" ; do
        lib="lib$name.${platforms[$platform]}"
        url="$repository_url/releases/download/$1/$lib-$arch-$platform-$1"
        echo "Downloading $lib from $url"
        if ! wget -O "$target_dir/$lib" -q "$url" ; then
            echo "$lib download failed"
            exit 1;
        fi
    done
done
