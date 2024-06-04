return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				lsp_saga = true,
				which_key = true,
				telescope = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
