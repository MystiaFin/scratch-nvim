-- Enable Lazy Loading
vim.loader.enable()

-- General configuration
vim.cmd("source " .. vim.fn.stdpath("config") .. "/mappings.lua")

-- UI Configuration
vim.o.guicursor = "n-v-c:block"
vim.opt.synmaxcol = 240
vim.opt.lazyredraw = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.fillchars:append({ eob = " " })

-- Indentation Settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Initialize lazy.nvim
require("config.lazy")

-- Load Plugins
require("autoclose").setup()

-- UI Settings
vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = "unnamed"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Telescope Setup (Add safety check)
local ok_telescope, telescope_builtin = pcall(require, "telescope.builtin")
if ok_telescope then
	vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Telescope find files" })
	vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Telescope live grep" })
	vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { desc = "Telescope buffers" })
	vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Telescope help tags" })
else
	print("Telescope is not installed!")
end

vim.cmd("runtime plugin/man.vim")

-- LSP Config
local lspconfig = require("lspconfig")

-- Helper function to setup LSP for specific filetypes
local function setup_with_filetypes(server, config, filetypes)
	config = config or {}
	config.on_attach = function(client, bufnr)
		if vim.tbl_contains(filetypes, vim.bo[bufnr].filetype) then
			local opts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-l>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		end
	end
	config.filetypes = filetypes
	lspconfig[server].setup(config)
end

-- LSP Servers
setup_with_filetypes("rust_analyzer", {}, { "rust" })
setup_with_filetypes("pyright", {}, { "python" })
setup_with_filetypes("html", {}, { "html", "htm" })
setup_with_filetypes("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
}, { "lua" })
setup_with_filetypes("clangd", {}, { "cpp", "c", "h", "hpp" })

-- OmniSharp Setup
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "omnisharp" } })

lspconfig.omnisharp.setup({
	cmd = { "omnisharp" },
	root_dir = function(fname)
		local util = require("lspconfig.util")
		return util.root_pattern("*.sln", "*.csproj", "Assets", "Packages")(fname) or util.path.dirname(fname)
	end,
	on_attach = function(client, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-l>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		require("lsp_signature").on_attach({ bind = true, handler_opts = { border = "rounded" } }, bufnr)
	end,
	settings = {
		omnisharp = {
			useModernNet = true,
			enableMsBuildLoadProjectsOnDemand = true,
			enableImportCompletion = true,
			enableRoslynAnalyzers = true,
			organizeImportsOnFormat = true,
			loggingLevel = "information",
			enableEditorConfigSupport = true,
		},
	},
	filetypes = { "cs", "csx", "razor", "cshtml" },
})

-- Persistent Undo Setup
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.o.undofile = true
vim.o.undodir = undodir
vim.o.undolevels = 10000
vim.o.undoreload = 10000

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>j", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>k", function()
	harpoon:list():next()
end)

vim.opt.lazyredraw = false
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})
