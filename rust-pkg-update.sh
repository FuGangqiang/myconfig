#!/bin/sh

set -x

# rustup target add wasm32-unknown-unknown
# rustup component add rls
# rustup component add rust-analysis
# rustup component add rust-src
# rustup component add rust-docs
# rustup component add rustfmt
# rustup component add rust-std-wasm32-unknown-unknown

rustup update
rustup completions zsh > ~/.zsh/completion/_rustup

cargo install -f skim
cargo install -f mdbook
cargo install -f cargo-tree
cargo install -f cargo-edit
cargo install -f cargo-expand
cargo install -f cargo-generate
cargo install -f wasm-bindgen-cli
cargo install -f wasm-pack
cargo install -f jwt-cli
