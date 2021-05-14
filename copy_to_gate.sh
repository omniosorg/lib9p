#!/bin/ksh -e

# Script to refresh the contrib/lib9p area in a checkout of illumos-gate

if [[ -z "$1" ]]; then
	echo "Syntax: $0 <path to gate checkout>"
	exit 1
fi

gate="$1"
lib="$gate/usr/src/contrib/lib9p"
if [[ ! -d "$lib" ]]; then
	echo "Error, could not find usr/src/contrib/lib9p under $gate"
	exit 1
fi

rm -rf $lib/*

cp COPYRIGHT $lib/
echo 'lib9p library' > $lib/COPYRIGHT.descrip

rsync='rsync -a --delete --delete-excluded'

mkdir -p $lib/transport $lib/backend $lib/sbuf
set -o globstar
for f in **/*.[ch]; do
	[[ $f = example* ]] && continue
	[[ $f = apple* ]] && continue
	[[ $f = sbuf* ]] && continue
	echo "... $f"
	[[ $f = */* ]] && mkdir -p $lib/${f%/*}
	cp $f $lib/$f
done

cp sbuf_illumos/* $lib/sbuf

