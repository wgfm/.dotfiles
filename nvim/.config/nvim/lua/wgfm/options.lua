local options = {
  number = true,
  relativenumber = true,
  completeopt = { 'menu', 'menuone',' noselect' },

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,

  scrolloff = 8,

  completeopt = {"menu", "menuone", "noselect"} -- for nvim-cmp
}

for opt, val in pairs(options) do
  vim.opt[opt] = val
end

vim.cmd [[set iskeyword+=-]]

