local M = {}

M.setup = function()
  vim.diagnostic.config({
    virtual_text = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
      },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = true,
      header = "",
      prefix = "",
    },
  })
end

local float_opts = { border = "rounded", max_width = 80 }

local function lsp_keymaps(bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  local function map(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true })
  end

  map("gD", vim.lsp.buf.declaration)
  map("gd", vim.lsp.buf.definition)
  map("gr", vim.lsp.buf.references)
  map("K", function() vim.lsp.buf.hover(float_opts) end)
  map("gi", vim.lsp.buf.implementation)
  map("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
  map("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)
  map("<C-k>", function() vim.lsp.buf.signature_help(float_opts) end)
  map("<space>wa", vim.lsp.buf.add_workspace_folder)
  map("<space>wr", vim.lsp.buf.remove_workspace_folder)
  map("<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
  map("<space>D", vim.lsp.buf.type_definition)
  map("<space>rn", vim.lsp.buf.rename)
  map("<space>ca", vim.lsp.buf.code_action)
  map("<space>e", vim.diagnostic.open_float)
  map("<space>q", vim.diagnostic.setloclist)
  map("<space>f", vim.lsp.buf.format)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    lsp_keymaps(args.buf)
  end,
})

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities()
end

return M
