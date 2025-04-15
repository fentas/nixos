{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    # languages
    python312
    nodejs_23
    yarn

    # formatting
    fmt
    rustfmt

    # debug
    bash-language-server
    rustc
  ];
}
