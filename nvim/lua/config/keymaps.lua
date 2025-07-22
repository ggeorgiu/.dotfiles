local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Dir navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- Pane navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)      -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts)      -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts)      -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts)      -- Navigate Right
keymap.set("t", "<C-h>", "wincmd h")          -- Navigate Left
keymap.set("t", "<C-j>", "wincmd j")          -- Navigate Down
keymap.set("t", "<C-k>", "wincmd k")          -- Navigate Up
keymap.set("t", "<C-l>", "wincmd l")          -- Navigate Right
keymap.set("n", "<C-h>", "TmuxNavigateLeft")  -- Navigate Left
keymap.set("n", "<C-j>", "TmuxNavigateDown")  -- Navigate Down
keymap.set("n", "<C-k>", "TmuxNavigateUp")    -- Navigate Up
keymap.set("n", "<C-l>", "TmuxNavigateRight") -- Navigate Right

-- Window management
keymap.set("n", "<leader>|", ":vsplit<CR>", opts) -- Split vertically
keymap.set("n", "<leader>_", ":split<CR>", opts)  -- Split horizontally

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Disable arrow keys
keymap.set({ "n", "i", "v" }, "<up>", "<nop>")
keymap.set({ "n", "i", "v" }, "<down>", "<nop>")
keymap.set({ "n", "i", "v" }, "<left>", "<nop>")
keymap.set({ "n", "i", "v" }, "<right>", "<nop>")

-- Comments
vim.api.nvim_set_keymap("n", "<C-->", "gccj", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-->", "gccj", { noremap = false })

-- Copy & Paste
keymap.set("x", "<leader>p", '"_dP')

keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')
keymap.set("n", "<leader>d", '"_d')

-- Move selection up and down (visual/normal mode)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("n", "K", ":m .-2<CR>==", opts)
keymap.set("n", "J", ":m .+1<CR>==", opts)

-- Keep cursor at center screen
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)
