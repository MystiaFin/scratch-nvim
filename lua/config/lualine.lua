local M = {}

function M.setup()
    -- Setup configuration
    require('lualine').setup({
        options = {
          theme = "catppuccin",
          section_separators = {"", ""},
          component_separators = {"", ""},
icons_enabled = true,
          globalstatus = false,
          disabled_filetypes = {
            "NvimTree",
            "packer",
          },

        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch"},
          lualine_c = {"filename"},
          lualine_x = {
                {
                  require("noice").api.statusline.mode.get,
                  cond = require("noice").api.statusline.mode.has,
                  color = { fg = "#ff9e64" },
                }
              },
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

return M
