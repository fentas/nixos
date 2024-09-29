{ ... }:
{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
    };

    which-key = {
      enable = true;
      settings = {
        showKeys = true;
        spec = [
          {
            __unkeyed-1 = "<leader>c";
            desc = "Code";
          }
          {
            __unkeyed-1 = "<leader>d";
            desc = "Document";
          }
          {
            __unkeyed-1 = "<leader>r";
            desc = "Rename";
          }
          {
            __unkeyed-1 = "<leader>s";
            desc = "Search";
          }
          {
            __unkeyed-1 = "<leader>w";
            desc = "Workspace";
          }
          {
            __unkeyed-1 = "<leader>g";
            desc = "Git";
          }
          {
            __unkeyed-1 = "<leader>df";
            desc = "Format";
          }
          {
            __unkeyed-1 = "<leader>ca";
            desc = "Actions";
          }
          {
            __unkeyed-1 = "<leader>rn";
            desc = "Rename";
          }
          {
            __unkeyed-1 = "gD";
            desc = "Declaration";
          }
          {
            __unkeyed-1 = "gR";
            desc = "References";
          }
          {
            __unkeyed-1 = "gi";
            desc = "Implementation";
          }
          {
            __unkeyed-1 = "<leader>de";
            desc = "Diagnostics on Line";
          }
          {
            __unkeyed-1 = "<leader>dq";
            desc = "Diagnostics Loclist";
          }
        ];
      };
    };

    luasnip = {
      enable = true;
    };

    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        experimental.ghost_text = true;

        snippet.expand = "luasnip";
        completion.completeopt = "menu,menuone,noinsert";

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete {}";
          "<C-l>" = "cmp.mapping(function() if luasnip.expand_or_locally_jumpable(  ) then luasnip.expand_or_jump(  ) end end, {'i', 's' })";
          "<C-h>" = "cmp.mapping(function() if luasnip.expand_or_locally_jumpable(-1) then luasnip.expand_or_jump(-1) end end, {'i', 's' })";
        };

        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
        ];
      };
    };

    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        lua-ls = {enable = true;};
        clangd = {enable = true;};
        nil-ls = {enable = true;};
        texlab = {enable = true;};
        pyright = {enable = true;};
        jsonls = {enable = true;};
        yamlls = {enable = true;};
      };

      keymaps = {
        diagnostic = {
          "[d" = "goto_prev";
          "]d" = "goto_next";
          "<leader>de" = "open_float";
          "<leader>dq" = "setloclist";
        };

        lspBuf = {
          "gD" = "declaration";
          "gR" = "references";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
          "<leader>df" = "format";
        };
        extra = [
          {
            key = "gd";
            action.__raw = "require('telescope.builtin').lsp_definitions";
            options = {
              desc = "[G]oto [D]efinitions";
            };
          }
          {
            key = "gI";
            action.__raw = "require('telescope.builtin').lsp_implementations";
            options = {
              desc = "[G]oto [I]mplementations";
            };
          }
          {
            key = "<leader>ds";
            action.__raw = "require('telescope.builtin').lsp_document_symbols";
            options = {
              desc = "[D]ocument [S]ymbols";
            };
          }
          {
            key = "<leader>ws";
            action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
            options = {
              desc = "[W]orkspace [S]ymbols";
            };
          }
        ];
      };
    };

    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        indent.enable = true;
        incrementalSelection.enable = true;
      };
    };

    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
        ui-select = {
          enable = true;
        };
      };
    };

    mini = {
      enable = true;
      modules = {
        ai = {
          n_lines = 500;
        };
        surround = { };
      };
    };

    nvim-autopairs = {
      enable = true;
    };

    trouble = {
      enable = true;
    };

    toggleterm = {
      enable = true;
    };

    gitsigns = {
      enable = true;
    };

    lualine = {
      enable = true;
      settings = {
        extensions = [ "nvim-tree" "toggleterm" "trouble" "quickfix"];
      };
    };

    schemastore = {
      enable = true;
    };

    web-devicons = {
      enable = true;
    };
  };
}
