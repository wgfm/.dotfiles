local nvim_lsp = require "lspconfig";
local handlers = require "wgfm/lsp/handlers";

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gleam', 'clangd', 'rust_analyzer', 'ts_ls', 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = handlers.on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.ocamllsp.setup({
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = nvim_lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities
})

nvim_lsp.elixirls.setup {
    cmd = { '/opt/homebrew/Cellar/elixir-ls/0.24.1/bin/elixir-ls' },
}

nvim_lsp.java_language_server.setup {
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
      gofumpt = true,
    },
  },
  on_attach = handlers.on_attach,
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

nvim_lsp.zls.setup {
  -- Server-specific settings. See `:help lspconfig-setup`

  -- the following line can be removed if ZLS is in your PATH
  -- cmd = { '/path/to/zls_executable' },
  -- There are two ways to set config options:
  --   - edit your `zls.json` that applies to any editor that uses ZLS
  --   - set in-editor config options with the `settings` field below.
  --
  -- Further information on ZLS config options:
  -- https://github.com/zigtools/zls#configuration-options
  settings = {
    zls = {
      -- the following line can be removed if Zig is in your PATH
      -- zig_exe_path = '/path/to/zig_executable',
    }
  }
}
