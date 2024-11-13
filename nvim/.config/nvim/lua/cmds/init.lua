vim.cmd("colorscheme darcula-dark")

local custom_window_color = "#1e222a"
vim.cmd("highlight NvimTreeNormal guibg=" .. custom_window_color)
vim.cmd("highlight NvimTreeEndOfBuffer guibg=" .. custom_window_color)
vim.cmd("highlight MasonNormal guibg=" .. custom_window_color)
vim.cmd("highlight TelescopeNormal guibg=" .. custom_window_color)
vim.cmd("highlight LazyNormal guibg=" .. custom_window_color)
