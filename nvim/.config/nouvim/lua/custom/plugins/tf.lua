return {
  {
    -- The `master` branch is frozen and incompatible with Neovim 0.12; its
    -- query directives break markdown rendering (e.g. LSP hover windows).
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Installing parsers requires the tree-sitter CLI (`brew install tree-sitter-cli`).
      if vim.fn.executable("tree-sitter") == 1 then
        require("nvim-treesitter").install({ "hcl", "terraform" })
      end
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "hcl", "terraform" },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
