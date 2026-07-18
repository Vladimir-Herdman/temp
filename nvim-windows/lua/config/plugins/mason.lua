return {
    {
        "mason-org/mason.nvim",
        --ft = _G.LAZY_LOAD_ON_FILE,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
            require("lspconfig")
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        }
                    }
                }
            })
            vim.lsp.config("r_language_server", {
                filetypes = { 'r', 'rmd' },
            })
        end,
    }
}
