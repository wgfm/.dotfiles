return {
  {
    -- Only provides server configs (`lsp/*.lua`); servers are enabled in
    -- lua/custom/lsp/configs.lua.
    "neovim/nvim-lspconfig",
    lazy = false,
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
  },
}
