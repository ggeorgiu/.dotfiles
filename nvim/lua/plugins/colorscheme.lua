return {
	{
		"ggeorgiu/darcula-dark.nvim",
		config = function()
			-- setup must be called before loading
			require("darcula").setup({
				override = function(_)
					return {
						background = "#323335",
						dark = "#1e222a",
						comment = "#808080",
					}
				end,
				opt = {
					integrations = {
						telescope = false,
						dap_nvim = true,
					},
				},
			})
		end,
	},
}
