local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.globals") --custom global config
require("config.options") --custom vim options
require("config.keymaps") --custom keymaps
require("config.autocmds") --custom autocmds
require("config.noops") --custom noops
require("config.vimwiki") --custom vimwiki opts

local opts = {
	defaults = {
		lazy = true,
	},
	install = {},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"netrw",
			"netrwPlugin",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = false,
	},
	ui = {
		backdrop = 100,
		border = "rounded",
	},
}

require("lazy").setup("plugins", opts)
