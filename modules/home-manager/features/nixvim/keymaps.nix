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
          desc = "Toggle [N]vimtree";
        };
      }
      {
        key = "<leader>e";
        action = "<cmd>NvimTreeFocus<CR>";
        options = {
          desc = "[E]xplore Files";
        };
      }
      {
        key = "]c";
        action.__raw = "function() if vim.wo.diff then return ']c' end vim.schedule(function() require('gitsigns').next_hunk() end) return '<Ignore>' end";
        options = {
          desc = "Move to next Git hunk";
        };
      }
      {
        key = "[c";
        action.__raw = "function() if vim.wo.diff then return ']c' end vim.schedule(function() require('gitsigns').prev_hunk() end) return '<Ignore>' end";
        options = {
          desc = "Move to previous Git hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gr";
        action.__raw = "require('gitsigns').reset_hunk";
        options = {
          desc = "[G]it [R]eset Hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gp";
        action.__raw = "require('gitsigns').preview_hunk";
        options = {
          desc = "[G]it [P]review Hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gb";
        action.__raw = "package.loaded.gitsigns.blame_line";
        options = {
          desc = "[G]it [B]lame";
        };
      }
      {
        mode = "n";
        key = "<leader>gt";
        action.__raw = "require('gitsigns').toggle_deleted";
        options = {
          desc = "[G]it [T]oggle Deleted";
        };
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = "<cmd>Telescope help_tags<CR>";
        options = {
          desc = "[S]earch [H]elp";
        };
      }
      {
        mode = "n";
        key = "<leader>sk";
        action = "<cmd>Telescope keymaps<CR>";
        options = {
          desc = "[S]earch [K]eymaps";
        };
      }
      {
        mode = "n";
        key = "<leader>sf";
        action = "<cmd>Telescope find_files<CR>";
        options = {
          desc = "[S]earch [F]iles";
        };
      }
      {
        mode = "n";
        key = "<leader>st";
        action = "<cmd>Telescope builtin<CR>";
        options = {
          desc = "[S]earch [T]elescopes";
        };
      }
      {
        mode = "n";
        key = "<leader>sw";
        action = "<cmd>Telescope grep_string<CR>";
        options = {
          desc = "[S]earch [W]ord";
        };
      }
      {
        mode = "n";
        key = "<leader>sg";
        action = "<cmd>Telescope live_grep<CR>";
        options = {
          desc = "[S]earch by [G]rep";
        };
      }
      {
        mode = "n";
        key = "<leader>sd";
        action = "<cmd>Telescope diagnostics<CR>";
        options = {
          desc = "[S]earch [D]iagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>sr";
        action = "<cmd>Telescope resume<CR>";
        options = {
          desc = "[S]earch [R]esume";
        };
      }
      {
        mode = "n";
        key = "<leader>s.";
        action = "<cmd>Telescope recents<CR>";
        options = {
          desc = "[S]earch Recent Files [.]";
        };
      }
      {
        mode = "n";
        key = "<leader>sc";
        action = "<cmd>Telescope git_status<CR>";
        options = {
          desc = "[S]earch [C]ommits";
        };
      }
      {
        mode = "n";
        key = "<leader><leader>";
        action.__raw = "function() require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({previewer=false})) end";
        options = {
          desc = "[ ] Find Buffers";
        };
      }
      {
        mode = "n";
        key = "<leader>/";
        action.__raw = "function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({previewer=false})) end";
        options = {
          desc = "[/] Fuzzy in Current Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>s/";
        action.__raw = "function() require('telescope.builtin').live_grep({grep_open_files = true, prompt_title = 'Grep in Open Files'}) end";
        options = {
          desc = "[S]earch [/] in Open Files";
        };
      }
      {
        mode = "n";
        key = "<leader>dd";
        action.__raw = "function() require('trouble').toggle('document_diagnostics') end";
        options = {
          desc = "[D]ocument [D]iagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>wd";
        action.__raw = "function() require('trouble').toggle('workspace_diagnostics') end";
        options = {
          desc = "[D]ocument [D]iagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>q";
        action.__raw = "function() require('trouble').toggle('quickfix') end";
        options = {
          desc = "[Q]uickfix";
        };
      }
      {
        mode = "n";
        key = "gr";
        action.__raw = "function() require('trouble').toggle('lsp_references') end";
        options = {
          desc = "[G]oto [R]eferences";
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
      {
        mode = "i";
        key = "<Tab>";
        action.__raw = "function() require('intellitab').indent() end";
        options = {
          silent = true;
        };
      }
    ];
  };
}
