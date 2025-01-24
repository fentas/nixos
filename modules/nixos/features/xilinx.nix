{  pkgs, inputs, ...}:
{
  nixpkgs.overlays = [] ++ [ inputs.nix-xilinx.overlay ];

  environment.systemPackages = with pkgs; [
    vivado
    vitis
    vitis_hls
  ];
}
