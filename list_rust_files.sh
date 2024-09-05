#!/bin/bash

shopt -s globstar

for path in "$@"
do
	find "$path" -name Cargo.toml -printf "%h\n" | while read f
	do
		ls -d "$f"/**/*.rs | grep -v target/
	done
done
