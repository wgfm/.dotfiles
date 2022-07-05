vim.cmd [[
  autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.go lua goimports(1000)

  autocmd! FileType qf nnoremap <buffer> <leader>s <C-w><Enter><C-w>L
]]
