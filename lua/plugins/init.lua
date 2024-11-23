return {
  -- theme
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
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("config.lualine").setup()
    end
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
    event = "BufReadPre",
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
    event = "InsertEnter",
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
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {
            "        ",
            "        ",
            "        ",
            "        ",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⣀⣀⠀⠠⣄⣉⡶⢿⣷⣿⣷⣶⣶⣮⣄⡠⡀⡀⣠⣄⡀⠀⠀⠀⠀",
            "⠀⠀⠀⣄⡾⣫⢒⢾⣾⣿⢟⢥⣶⣶⣶⣮⣖⠾⡙⢿⣿⣦⡊⡲⣶⣆⠀⠀⠀⠀",
            "⠀⠀⠀⢬⣾⢣⣳⣿⡿⢑⣵⣿⣿⣷⠹⣿⣿⣿⣮⡳⡝⣿⣿⡔⠙⣿⣇⠀⠀⠀",
            "⠀⠀⢠⣿⡏⢲⣿⡿⣱⣿⣿⡿⡻⣱⣿⣝⢞⢿⢿⣿⣮⠎⣿⣿⡔⠸⣿⠀⠀⠀",
            "⠀⠀⡜⣾⠁⣿⣿⢳⡿⡛⠁⠌⢾⣿⣿⣿⣧⠀⠑⢝⢿⣏⠘⣿⣷⠀⣿⡆⠀⠀",
            "⠀⢀⢻⡟⣷⣿⣿⣈⣼⣾⣿⣮⣹⣿⣿⣿⣿⣾⣿⣮⣳⢝⣴⢻⣿⢸⢹⣧⡆⠀",
            "⣀⣘⣿⣧⢿⣿⣿⢿⣿⠋⠉⠉⣿⣿⣿⣿⣿⡙⠉⠙⣿⡇⢸⢸⣿⢨⠬⠭⠤⠤",
            "⢢⣝⢿⣯⡝⢿⡟⣼⣿⣿⣿⣿⣿⣿⡉⢙⣿⣿⣿⣿⣿⡏⢄⣿⡟⢰⣿⡿⡧⠇",
            "⡄⣎⣵⡙⡧⢏⢷⢑⢻⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⠁⣼⠏⠠⠛⣱⣴⡆⡏",
            "⣧⣿⣿⣿⣷⡉⠈⠣⢻⣿⣿⣿⣯⣟⣻⣇⣿⣿⣿⣿⡿⢑⠁⠁⢲⣿⣿⣿⣇⣷",
            "⢸⣿⣿⣿⣿⣇⠀⠀⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠑⠁⠀⠀⢸⣿⣿⣿⣿⣿",
            "⢸⣿⣿⣿⣿⣿⠀⠀⠀⣀⠀⠈⠹⠛⣻⣛⠻⠉⠀⡀⢸⣀⠀⠀⣸⣿⣿⠿⢨⣿",
            "⢸⡏⣿⣿⣿⣿⣧⢰⣿⢸⡄⠁⠢⠀⣤⣤⣤⡲⠟⡁⣾⣿⣿⢸⡟⣛⣵⡇⡼⡿",
            "⢀⣟⠹⠻⣟⣛⢿⣾⢧⢀⣿⡸⢣⢾⣟⢿⢣⣼⣶⣠⣟⣛⣻⣴⡆⣿⣿⢁⠇⣦",
            "        ",
            "        ",
            "        ",
          },
        center = {
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Find File           ',
              desc_hl = 'String',
              key = 'f',
              keymap = 'SPC f f',
              key_hl = 'Number',
              action = 'Telescope find_files'
            },
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Find Dotfiles',
              desc_hl = 'String',
              key = 'd',
              keymap = 'SPC f d',
              key_hl = 'Number',
              action = 'Telescope find_files cwd=~/.config'
            },
            {
              icon = ' ',
              icon_hl = 'Error',
              desc = 'Quit Neovim        ',
              desc_hl = 'String',
              key = 'q',
              keymap = '',
              key_hl = 'Number',
              action = 'qa'
            },
          },
        }
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  }
}
