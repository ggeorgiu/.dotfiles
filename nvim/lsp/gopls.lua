return {
    cmd = { "gopls" },
    filetypes = { "go" },
    root_markers = { "go.mod", "go.sum" },
    gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
            unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
    },
}
