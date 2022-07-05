local nvim_lsp = require "lspconfig";
local handlers = require "wgfm/lsp/handlers";

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = handlers.on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.java_language_server.setup{
  cmd = { '/Users/wernerhofstra/dev/tools/java-language-server/dist/lang_server_mac.sh' },
}

nvim_lsp.gopls.setup {
  cmd = { 'gopls', 'serve' },
  capabilities = handlers.capabilities,
  filetypes = { "go", "gomod", "gotmpl" },
  settings = {
    gopls = {
--      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
--        shadow = true,
      },
      staticcheck = true,
    },
  },
  on_attach = on_attach,
}

function goimports(timeoutms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

