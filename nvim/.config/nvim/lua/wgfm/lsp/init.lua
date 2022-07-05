local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require "wgfm/lsp/configs"
require("wgfm/lsp/handlers").setup()
