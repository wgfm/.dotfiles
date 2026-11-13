return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "zbirenbaum/copilot.lua",
    },
    config = function()
      -- copilot.lua only manages the Copilot language server (download, auth).
      -- Suggestions are shown by Neovim's built-in inline completion instead
      -- of copilot.lua's own UI, see lua/custom/completion.lua.
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }

      require "custom.completion"
    end,
  },
}
