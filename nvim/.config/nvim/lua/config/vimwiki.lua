-- Default settings
vim.o.compatible = false

-- Wiki list
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
	{
		path = "~/notes/work/",
		syntax = "markdown",
		ext = "md",
		index = "to-do",
	},
	{
		path = "~/notes/personal/daily/",
		syntax = "markdown",
		ext = "md",
		index = "personal",
	},
	{
		path = "~/notes/personal/learn/",
		syntax = "markdown",
		ext = "md",
		index = "learn",
	},
	{
		path = "~/notes/personal/gym/",
		syntax = "markdown",
		ext = "md",
		index = "gym",
	},
	{
		path = "~/notes/personal/finance/",
		syntax = "markdown",
		ext = "md",
		index = "finance",
	},
}
