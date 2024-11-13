local lualine_bg_color = "#1e222a"
local config = function()
	require("lualine").setup({
		options = {
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
