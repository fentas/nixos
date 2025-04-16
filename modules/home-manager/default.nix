{ config, lib, mylib, ... }:
{
  imports = []
    ++ (mylib.extendModules { dir = ./features; })
    ++ (mylib.extendModules { dir = ./desktops; })
    ++ (mylib.extendModules { dir = ./bundles; })
  ;
}
