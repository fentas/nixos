{ ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options = {
          desc = "Remove search highlights.";
          silent = true;
        };
      }

      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {
          desc = "Move focus to the left window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {
          desc = "Move focus to the right window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {
          desc = "Move focus to the lower window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {
          desc = "Move focus to the upper window";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options = {
          silent = true;
        };
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options = {
          silent = true;
        };
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options = {
          silent = true;
        };
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          silent = true;
        };
      }
      {
        key = "<C-n>";
        action = "<cmd>NvimTreeToggle<CR>";
        options = {
          desc = "Toggle Nvimtree";
        };
      }
      {
        key = "<leader>e";
        action = "<cmd>NvimTreeFocus<CR>";
        options = {
          desc = "Explore Files";
        };
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = "<cmd>Telescope help_tags<CR>";
        options = {
          desc = "Search Help";
        };
      }
      {
        mode = "n";
        key = "<leader>sk";
        action = "<cmd>Telescope keymaps<CR>";
        options = {
          desc = "Search Keymaps";
        };
      }
      {
        mode = "n";
        key = "<leader>sf";
        action = "<cmd>Telescope find_files<CR>";
        options = {
          desc = "Search Files";
        };
      }
      {
        mode = "n";
        key = "<leader>st";
        action = "<cmd>Telescope builtin<CR>";
        options = {
          desc = "Search Telescopes";
        };
      }
      {
        mode = "n";
        key = "<leader>sw";
        action = "<cmd>Telescope grep_string<CR>";
        options = {
          desc = "Search Word";
        };
      }
      {
        mode = "n";
        key = "<leader>sg";
        action = "<cmd>Telescope live_grep<CR>";
        options = {
          desc = "Search by Grep";
        };
      }
      {
        mode = "n";
        key = "<leader>sd";
        action = "<cmd>Telescope diagnostics<CR>";
        options = {
          desc = "Search Diagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>sr";
        action = "<cmd>Telescope resume<CR>";
        options = {
          desc = "Search Resume";
        };
      }
      {
        mode = "n";
        key = "<leader>s.";
        action = "<cmd>Telescope recents<CR>";
        options = {
          desc = "Search Recent Files";
        };
      }
      {
        mode = "n";
        key = "<leader>sc";
        action = "<cmd>Telescope git_status<CR>";
        options = {
          desc = "Search Commits";
        };
      }
      {
        mode = "n";
        key = "<leader><leader>";
        action.__raw = "function() require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer=false})) end";
        options = {
          desc = "Find Buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>/";
        action.__raw = "function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({previewer=false})) end";
        options = {
          desc = "Fuzzy in Current Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>s/";
        action.__raw = "function() require('telescope.builtin').live_grep({grep_open_files = true, prompt_title = 'Grep in Open Files'}) end";
        options = {
          desc = "Search in Open Files";
        };
      }
      {
        mode = "n";
        key = "<leader>dd";
        action.__raw = "function() require('trouble').toggle('diagnostics') end";
        options = {
          desc = "Document Diagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>q";
        action.__raw = "function() require('trouble').toggle('quickfix') end";
        options = {
          desc = "Quickfix";
        };
      }
      {
        mode = "n";
        key = "gr";
        action.__raw = "function() require('trouble').toggle('lsp_references') end";
        options = {
          desc = "Goto References";
        };
      }
      {
        mode = ["n" "t"];
        key = "<A-i>";
        action = "<cmd>ToggleTerm direction=float<CR>";
        options = {
          desc = "Float Terminal";
        };
      }
      {
        mode = ["n" "t"];
        key = "<A-h>";
        action = "<cmd>ToggleTerm direction=horizontal<CR>";
        options = {
          desc = "Float Terminal";
        };
      }
    ];
  };
}
