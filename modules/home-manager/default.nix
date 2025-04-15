{ config, lib, mylib, ... }:
{
  imports =
    (mylib.extendModules { root = ["myHomeManager"]; dir = ./features; }) ++
    (mylib.extendModules { root = ["myHomeManager"]; dir = ./bundles; prefix = ["bundles"]; });
}
