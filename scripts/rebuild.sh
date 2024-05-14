#!/bin/sh
pushd ~/nixos
sudo nixos-rebuild switch --flake .
popd
