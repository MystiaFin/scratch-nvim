require('mappings')
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
