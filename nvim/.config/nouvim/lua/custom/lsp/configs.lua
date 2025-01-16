local nvim_lsp = require "lspconfig";
local handlers = require "custom/lsp/handlers";

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gleam', 'clangd', 'rust_analyzer', 'ts_ls', 'pyright', 'zls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.ocamllsp.setup({
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = nvim_lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    capabilities = handlers.capabilities
})

nvim_lsp.elixirls.setup {
    cmd = { '/opt/homebrew/Cellar/elixir-ls/0.24.1/bin/elixir-ls' },
}

nvim_lsp.java_language_server.setup {
  cmd = { '/Users/wernerhofstra/dev/tools/java-language-server/dist/lang_server_mac.sh' },
}

nvim_lsp.gopls.setup {}

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
