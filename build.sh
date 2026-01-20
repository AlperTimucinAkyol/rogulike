#! /bin/bash

set -e

args1="$1"

cargo build --release --target wasm32-unknown-unknown && \
	wasm-bindgen target/wasm32-unknown-unknown/release/rogulike.wasm \
	--out-dir wasm --no-modules --no-typescript

if [ $args1 = "--server" ]; then
	if [ $pwd -eq  ~/rogulike/wasm ]; then
		basic-http-server
	else
		cd ~/rogulike/wasm
		basic-http-server
	fi
fi


