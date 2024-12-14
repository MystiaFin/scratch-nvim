return {
  -- theme
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('config.dashboard').setup()
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
          transparent_background = true,
          integrations = {
            bufferline = true,
          },
          color_overrides = {
            -- You can customize colors here if needed
          },
        })
        -- Set colorscheme after setup
        vim.cmd.colorscheme "catppuccin"
    end
  },
  -- auto close
  {
    "m4xshen/autoclose.nvim",
    event = {"InsertEnter"},
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      require("nvim-tree").setup(require("config.nvim-tree"))
    end
  },
  -- smooth scroll
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    config = function()
      require("config.neoscroll").setup()
    end
  },
  -- Discord presence
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup({
        neovim_image_text = "Elaina my beloved",
        main_image = "file",
      })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
    require('config.lualine').setup()
end
  },
  {
    'nvim-lua/plenary.nvim',
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup()
    end
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    lazy = true,
    config = function()
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim", "neovim/nvim-lspconfig"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },
      })
    end,
  },
{
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require('config.treesitter').setup()
    end
},
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
        per_filetype = {
          ["html"] = {
            enable_close = true
          },
          ["jsx"] = {
            enable_close = true
          }
        }
      })
    end
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("config.bufferline").setup()
    end
  },
  {
    'neogitorg/neogit',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true
  },
  {
    'lewis6991/gitsigns.nvim',
    event = "BufRead",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- Specify the correct branch
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
        -- Use relative paths
        global_settings = {
          save_on_toggle = false,
          save_on_change = true,
          enter_on_sendcmd = false,
          tmux_autoclose_windows = false,
          excluded_filetypes = { "harpoon" },
          mark_branch = false,
          use_relative_path = true, -- Force relative paths
        },
      })
    end
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
    end
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      }
  },
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
      "kdheepak/lazygit.nvim",
      lazy = false,
      cmd = {
          "LazyGit",
          "LazyGitConfig",
          "LazyGitCurrentFile",
          "LazyGitFilter",
          "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim",
      },
      config = function()
          require("telescope").load_extension("lazygit")
      end,
      keys = {
          { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
      }
  }
}
