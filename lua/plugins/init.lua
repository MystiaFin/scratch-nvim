return {
  -- theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end
  },
  -- auto close
  {
    "m4xshen/autoclose.nvim",
    event = "VeryLazy",
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
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "BufReadPost",
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    config = function()
      local highlights = require("catppuccin.groups.integrations.bufferline").get()

      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          indicator = {
            icon = "▎",
          },
          seperator_style = "slant",
          show_buffer_close_icons = false,
          show_close_icon = false,
          enforce_regular_tabs = true,
          modified_icon = "●",
          tab_size = 18,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = {"close"}
          },
          -- Add offset for nvim-tree
          offsets = {
            {
              filetype = "NvimTree",
              text = "Elaina my beloved",
              highlight = "Directory",
              separator = true,
            }
          },
        },
        highlights = highlights,
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
      require('telescope').setup{
        defaults = {
          mappings = {
          }
        },
        pickers = {
        },
        extensions = {
        },
      }
    end
  },
}
