#!/bin/sh
curl -sL "https://mirrors.edge.kernel.org/pub/software/scm/git/sha256sums.asc" | grep -oE 'git-2\.[0-9]+\.[0-9]+\.tar\.xz' | sed 's/git-//; s/\.tar\.xz//'
