local config = function()
	local theme = require("lualine.themes.catppuccin")

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
		},
		tabline = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
