vim.cmd('source ' .. vim.fn.stdpath('config') .. '/mappings.lua')

-- indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- intitialize lazy.nvim
require("config.lazy")

-- load theme
vim.cmd.colorscheme "catppuccin"

--load plugin
require("autoclose").setup()

vim.wo.relativenumber = true
vim.opt.number = true

vim.opt.clipboard = "unnamed"

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


local lspconfig = require('lspconfig')
-- Rust
lspconfig.rust_analyzer.setup {}

-- Python
lspconfig.pyright.setup {}

-- HTML
lspconfig.html.setup {}


-- Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false }
    }
  }
}

-- C++
lspconfig.clangd.setup {}
