return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "mason-lspconfig.nvim" },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            filetypes = { "lua" },
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" }, -- nvim uses LuaJIT
                    diagnostics = {
                        globals = { "vim" },          -- recognize `vim` as a global
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        })

        vim.lsp.config("gopls", {
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_markers = { "go.work", "go.mod" },
            settings = {
                gopls = {
                    gofumpt = true,
                    codelenses = {
                        gc_details = false,
                        generate = true,
                        regenerate_cgo = true,
                        run_govulncheck = true,
                        test = true,
                        tidy = true,
                        upgrade_dependency = true,
                        vendor = true,
                    },
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                    analyses = {
                        fieldalignment = true,
                        nilness = true,
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    usePlaceholders = true,
                    completeUnimported = true,
                    staticcheck = true,
                    directoryFilters = { "-.git", "-node_modules" },
                    semanticTokens = true,
                },
            },
        })

        vim.lsp.enable("lua_ls")
        vim.lsp.enable("gopls")
    end,
}
