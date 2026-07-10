return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets", "windwp/nvim-autopairs" },
    version = "*", -- use pre-built binary, avoids needing rust toolchain
    opts = {
        keymap = {
            preset = "default",
            ["<CR>"] = { "accept", "fallback" },
        }, -- or "super-tab" for tab-driven flow
        appearance = {
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        completion = {
            documentation = { auto_show = true },
            accept = {
                auto_brackets = { enabled = true },
            }
        },
    },
    lazy = false
}
