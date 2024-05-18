#!/bin/sh
pushd ~/nixos
git add *
sudo nixos-rebuild switch --flake .
popd
