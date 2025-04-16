{ mylib, ... }:
{
  imports = []
    ++ (mylib.extendModules { dir = ./gpu; })
    ++ (mylib.extendModules { dir = ./radio; })
  ;
}
