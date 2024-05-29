{ ... }:
{
  programs.nixvim.autoCmd = [
    {
      event = "TextYankPost";
      desc = "Highlight when yanking text";
      group = "sam-autocmd";
      callback.__raw = "function() vim.highlight.on_yank() end";
    }
  ];

  programs.nixvim.autoGroups = {
    sam-autocmd = {
      clear = true;
    };
  };
}
