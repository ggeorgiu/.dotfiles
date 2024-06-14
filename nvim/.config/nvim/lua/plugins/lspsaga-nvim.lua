return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			-- enable the breadcrumbs feature
			symbols_in_winbar = {
				enable = true,
				delay = 350,
			},
			implement = {
				enable = true,
			},
			outline = {
				enable = true,
			},
			-- keybinds for navigation in lspsaga window
			move_in_saga = {
				prev = "<C-k>",
				next = "<C-j>",
			},
			-- use enter to open file with finder
			finder_action_keys = {
				open = "<CR>",
			},
			-- use enter to open file with definition preview
			definition_action_keys = {
				edit = "<CR>",
			},
			lightbulb = {
				virtual_text = false,
			},
			ui = {
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
