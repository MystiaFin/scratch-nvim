return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			highlights = {
				fill = { bg = "#191724" }, -- Darker base from Rosé Pine
				background = { fg = "#e0def4", bg = "#1f1d2e" },
				buffer_selected = { fg = "#c4a7e7", bold = true },
				separator = { fg = "#1f1d2e", bg = "#191724" },
				separator_selected = { fg = "#1f1d2e" },
				indicator_selected = { fg = "#c4a7e7", bg = "#1f1d2e" },
			},
			options = {
				separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
				always_show_bufferline = true,
			},
		})
	end,
}
