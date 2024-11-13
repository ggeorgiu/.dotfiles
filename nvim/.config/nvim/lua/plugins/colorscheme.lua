return {
	{
		"xiantang/darcula-dark.nvim",
		config = function()
			-- setup must be called before loading
			require("darcula").setup({
				override = function(_)
					return {
						background = "#323335",
						dark = "#232425",
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
