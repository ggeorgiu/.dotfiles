-- Default settings
vim.o.compatible = false

-- Wiki list
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
	{
		path = "~/notes/work/",
		syntax = "markdown",
		ext = "md",
		index = "work",
		name = "work",
	},
	{
		path = "~/notes/personal/",
		syntax = "markdown",
		ext = "md",
		index = "personal",
		name = "personal",
	},
}

vim.api.nvim_set_hl(0, "VimwikiLink", { fg = "#87CEEB", underline = true })

