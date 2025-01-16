local function set(mode, bind, command, options)
  options = options or { noremap = true, silent = true }
  vim.keymap.set(mode, bind, command, options)
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal mode
-- Better window navigation
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
set("n", "<C-Up>", ":resize -2<CR>")
set("n", "<C-Down>", ":resize +2<CR>")
set("n", "<C-Left>", ":vertical resize -2<CR>")
set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
set("n", "<S-l>", ":bnext<CR>")
set("n", "<S-h>", ":bprevious<CR>")
set("n", "<leader>fb", ":Telescope buffers<CR>")

set("n", "<leader>fg", ":Telescope live_grep<CR>")

-- Move text up and down
set("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
set("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Open config
set("n", "<leader>,", ":e ~/.config/nouvim/init.lua<CR>")

-- Navigate quickfix and location lists
set("n", "<leader>n", ":cnext<CR>")
set("n", "<leader>p", ":cprev<CR>")
set("n", "<leader>ln", ":lnext<CR>")
set("n", "<leader>lp", ":lprev<CR>")

-- Open file tree
set("n", "<leader>pv", ":Vex<CR>")

-- Git commands
set("n", "<leader>gc", ":Git commit<CR>")
set("n", "<leader>gf", ":Git fetch<CR>")
set("n", "<leader>gp", ":Git push<CR>")
set("n", "<leader>gst", ":Git<CR>")
set("n", "<leader>gd", ":Git diff<CR>")
set("n", "<leader>grb", ":Git rebase<CR>")
set("n", "<leader>gbl", ":Git blame<CR>")

set("n", "grn", vim.lsp.buf.rename)
set("n", "gra", vim.lsp.buf.code_action)
set("n", "grr", vim.lsp.buf.references)

-- Find files
vim.cmd [[
  nnoremap <expr> <C-p> &buftype ==# 'quickfix' ? "\<C-P>" : ":Telescope find_files\<CR>"
]]

-- Visual --
-- Stay in indent mode
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Move text up and down
set("v", "<A-j>", ":m .+1<CR>==")
set("v", "<A-k>", ":m .-2<CR>==")
set("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
set("x", "J", ":move '>+1<CR>gv-gv")
set("x", "K", ":move '<-2<CR>gv-gv")
set("x", "<A-j>", ":move '>+1<CR>gv-gv")
set("x", "<A-k>", ":move '<-2<CR>gv-gv")

set({"n"}, "<leader>hh", function() vim.lsp.buf.hover() end, {silent = true})

local ls = require("luasnip")

set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
