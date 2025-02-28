vim.g.mapleader = " " -- Set the leader key to space

-- Toggle NvimTree with <leader>e
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Re-indent and stay in visual mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Buffer map
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':bd<CR>', { noremap = true, silent = true })

-- Dismiss message
vim.keymap.set('n', '<leader>l', '<cmd>NoiceDismiss<CR>')
vim.keymap.set("n", '<leader>gg', '<cmd>CopilotChatToggle<CR>')
vim.keymap.set("n", '<leader>gs', '<cmd>CopilotChatSave<CR>')
vim.keymap.set("n", '<leader>gl', '<cmd>CopilotChatLoad<CR>')
vim.keymap.set("n", '<leader>gm', '<cmd>CopilotChatModels<CR>')
vim.keymap.set("n", '<leader>gr', '<cmd>CopilotChatReset<CR>')

