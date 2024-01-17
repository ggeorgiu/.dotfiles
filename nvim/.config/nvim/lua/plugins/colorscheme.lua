return {
	"sainnhe/sonokai",
	name = "sonokai",
	lazy = false,
	priority = 999,
	config = function()
    vim.g.sonokai_style = 'andromeda'
    vim.cmd("colorscheme sonokai")
	end,
}
