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
      require("lualine").setup({
        options = {
          section_separators = {"", ""},
          component_separators = {"", ""},
icons_enabled = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch"},
          lualine_c = {"filename"},
          lualine_x = {"encoding", "fileformat", "filetype"},
          lualine_y = {"progress"},
          lualine_z = {"location"},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {"filename"},
          lualine_x = {"location"},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
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
      require('nvim-treesitter').setup({
        ensure_installed = {
          "lua", "python", "rust", "html", "css", "javascript", "typescript", "tsx", "c", "cpp", "java"
        },
        highlight = {
          enable = true,
        },
        autotag = {
          enable = true,
        }
      })
      vim.cmd('TSEnable highlight')
    end
},
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        --
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
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
      require("bufferline").setup({
          options = {
            mode = "buffers",
            numbers = "none",
            themable = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            separator_style = "thin",
            diagnostics = "nvim_lsp",
            offsets = {
              {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
              },
            },
            always_show_bufferline = true,
            -- Add these options for better integration
            indicator = {
              style = 'icon',
            },
          },
          -- Remove the custom highlights section since Catppuccin will handle it
          -- The transparent background will be handled by Catppuccin's integration
      })
    end
  }
}
