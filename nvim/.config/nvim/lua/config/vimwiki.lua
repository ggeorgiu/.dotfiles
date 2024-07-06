-- Default settings
vim.o.compatible = false
vim.cmd("filetype plugin on")

-- Wiki list
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
	{
		path = "~/notes/work/",
		syntax = "markdown",
		ext = ".md",
		index = "work",
	},
	{
		path = "~/notes/personal/",
		syntax = "markdown",
		ext = ".md",
		index = "personal",
	},
}
