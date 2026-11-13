-- Server definitions come from nvim-lspconfig's `lsp/` directory; anything set
-- here is merged on top of those defaults.
local handlers = require("custom/lsp/handlers")

vim.lsp.config("*", {
  capabilities = handlers.capabilities,
})

vim.lsp.config("elixirls", {
  cmd = { "/opt/homebrew/Cellar/elixir-ls/0.24.1/bin/elixir-ls" },
})

vim.lsp.config("java_language_server", {
  cmd = { "/Users/wernerhofstra/dev/tools/java-language-server/dist/lang_server_mac.sh" },
})

vim.lsp.config("zls", {
  settings = {
    zls = {
      enable_build_on_save = true,
    },
  },
})

vim.lsp.enable({
  "clangd",
  "elixirls",
  "gleam",
  "gopls",
  "java_language_server",
  "lua_ls",
  "ocamllsp",
  "pyright",
  "rust_analyzer",
  "ts_ls",
  "zls",
})
