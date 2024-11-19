vim.g.mapleader = " " -- Set the leader key to space

-- Toggle NvimTree with <leader>e
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Re-indent and stay in visual mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Map Enter in normal mode to jump to the end of the line
vim.api.nvim_set_keymap("n", "<CR>", "$", { noremap = true, silent = true })

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

-- in config/keymaps.lua or directly in init.lua
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })  -- Shift+Tab goes to previous buffer

-- For tab switching
vim.keymap.set('n', '<C-Tab>', ':tabnext<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':tabprevious<CR>', { silent = true })

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
