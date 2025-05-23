return {
	"valentino-sm/shade.nvim",
	lazy = false,
	config = function()
		local shade = require("shade")

		shade.setup({
			overlay_opacity = 50,
			opacity_step = 1,
			keys = {
				brightness_up = "<C-Up>",
				brightness_down = "<C-Down>",
				toggle = "<Leader>s",
			},
		})
	end,
}
