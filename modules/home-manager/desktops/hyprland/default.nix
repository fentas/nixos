{ mylib, ... }:
{
  imports = 
    (mylib.extendModules { dir = ./features; default = true; })
  ;
}
