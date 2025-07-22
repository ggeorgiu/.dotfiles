-- format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function()
        vim.lsp.buf.format()
    end,
})
