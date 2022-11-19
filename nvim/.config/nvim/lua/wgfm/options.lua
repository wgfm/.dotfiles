local options = {
  number = true,
  relativenumber = true,
  completeopt = { 'menu', 'menuone',' noselect' },

  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,

  scrolloff = 8,

  completeopt = {"menu", "menuone", "noselect"} -- for nvim-cmp
}

for opt, val in pairs(options) do
  vim.opt[opt] = val
end

vim.cmd [[set iskeyword+=-]]

