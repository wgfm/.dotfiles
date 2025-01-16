local ok, _ = pcall(require, "lspconfig")
if not ok then
    print("Error setting up LSP")
    return
end

require("custom/lsp/handlers").setup()
require "custom/lsp/configs"
