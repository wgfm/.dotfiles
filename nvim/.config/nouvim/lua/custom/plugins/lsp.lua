return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local lspconfig = require("lspconfig")

            local function setup_lsp(language, opts)
                if opts == nil then
                    opts = {}
                end

                lspconfig[language].setup(opts)
            end

            setup_lsp("lua_ls")
            setup_lsp("gopls")
            setup_lsp("rust_analyzer")
            setup_lsp("zls")
        end,
    }
}
