return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            signatureHelp = { enabled = true },
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
                disable = { "missing-fields", "missing-parameters" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.stdpath("config") .. "/lua",
                },
            },
        },
    },
}
