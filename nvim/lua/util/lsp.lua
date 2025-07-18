local keymap = vim.keymap

local M = {}

M.on_attach = function(_, bufnr)
	-- keybid opts
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts)
	keymap.set("n", "<leader>hd", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
end

return M
