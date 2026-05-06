vim.filetype.add({
  pattern = {
    [".*%.yml%.tpl"] = "yaml",
    [".*%.yaml%.tpl"] = "yaml",
  },
})
