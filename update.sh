#!/usr/bin/env bash
set -x
set -e

# NOTE: Last executed using Rust 1.34.0

# cargo install --force --version 0.14.0 svd2rust
# cargo install --force --version 0.6.0  form
# rustup component add rustfmt

rm -rf src
mkdir src
svd2rust -i ./stm32l4x2.svd.patched
form -i lib.rs -o src
rm lib.rs
cargo fmt
rustfmt build.rs
