function keymap(mode, bind, command, options)
  options = options or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, bind, command, options)
end

-- Remap space as leader key
vim.cmd [[
  let mapleader = " "
]]

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal mode
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Open config
keymap("n", "<leader>,", ":e ~/.config/nvim/init.lua<CR>")

-- Navigate quickfix and location lists
keymap("n", "<leader>n", ":cnext<CR>")
keymap("n", "<leader>p", ":cprev<CR>")
keymap("n", "<leader>ln", ":lnext<CR>")
keymap("n", "<leader>ln", ":lprev<CR>")

-- Open file tree
keymap("n", "<leader>pv", ":Vex<CR>")

-- Git commands
keymap("n", "<leader>gc", ":Git commit<CR>")
keymap("n", "<leader>gf", ":Git fetch<CR>")
keymap("n", "<leader>gp", ":Git push<CR>")
keymap("n", "<leader>gst", ":Git<CR>")
keymap("n", "<leader>gd", ":Git diff<CR>")
keymap("n", "<leader>grb", ":Git rebase<CR>")
keymap("n", "<leader>gbl", ":Git blame<CR>")

-- Find files
vim.cmd [[
  nnoremap <expr> <C-p> &buftype ==# 'quickfix' ? "\<C-P>" : ":GFiles\<CR>"
]]

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

