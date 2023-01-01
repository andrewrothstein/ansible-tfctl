#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/weaveworks/tf-controller/releases/download

# https://github.com/weaveworks/tf-controller/releases/download/v0.13.1/tfctl_Linux_amd64.tar.gz

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file="tfctl_${platform}.${archive_type}"
    local url="$MIRROR/v$ver/$file"
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    # https://github.com/weaveworks/tf-controller/releases/download/v0.13.1/tf-controller_0.13.1_checksums.txt
    local url="$MIRROR/v$ver/tf-controller_${ver}_checksums.txt"
    local lchecksums="$DIR/tf-controller_${ver}_checksums.txt"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  '%s':\n" $ver

    dl $ver $app $lchecksums Darwin amd64
    dl $ver $app $lchecksums Darwin arm64
    dl $ver $app $lchecksums Linux amd64
    dl $ver $app $lchecksums Linux arm64
    dl $ver $app $lchecksums Linux armv6
    dl $ver $app $lchecksums Linux armv7
}

dl_ver ${1:-0.13.1}
