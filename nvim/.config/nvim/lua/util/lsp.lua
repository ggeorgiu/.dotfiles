local keymap = vim.keymap

local M = {}

M.on_attach = function(_, bufnr)
		-- keybind opts
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- set keybinds
		keymap.set("n", "fd", "<cmd>Lspsaga finder<CR>", opts)
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	end

return M
