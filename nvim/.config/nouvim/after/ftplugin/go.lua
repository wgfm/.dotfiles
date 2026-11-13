local set = vim.opt_local

set.shiftwidth = 4
set.expandtab = false
set.tabstop = 4

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  buffer = 0,
  callback = function()
    local client = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })[1]
    if not client then
      return
    end
    local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local res = client:request_sync("textDocument/codeAction", params, 1000, 0)
    for _, r in pairs((res and res.result) or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

vim.cmd [[
   autocmd! FileType qf nnoremap <buffer> <leader>s <C-w><Enter><C-w>L
]]
