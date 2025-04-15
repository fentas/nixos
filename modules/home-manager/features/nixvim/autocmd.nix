{ ... }:
{
  programs.nixvim.autoCmd = [
    {
      event = "TextYankPost";
      desc = "Highlight when yanking text";
      group = "fentas-autocmd";
      callback.__raw = "function() vim.highlight.on_yank() end";
    }
  ];

  programs.nixvim.autoGroups = {
    fentas-autocmd = {
      clear = true;
    };
  };
}
