return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "BufReadPre",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                border = "rounded",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "BufReadPre",
        dependencies = { "mason.nvim" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "gopls"
            },
        },
    },
}
