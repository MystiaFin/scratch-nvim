return {
	"rose-pine/neovim",
	event = "VimEnter",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine-moon")
		require("rose-pine").setup({
			variant = "moon", -- Choose between 'main', 'moon', or 'dawn'
			highlight_groups = {
				BufferLineFill = { bg = "base" },
				BufferLineBackground = { fg = "muted", bg = "surface" },
				BufferLineBufferSelected = { fg = "text", bg = "overlay", bold = true },
			},
		})
	end,
}
