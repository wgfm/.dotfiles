local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- Have packer manage itself
  use({ 'junegunn/fzf', config = 'vim.cmd [[fzf#install()]]' })
  use({ 'junegunn/fzf.vim' })
  use({ 'arcticicestudio/nord-vim' })
  use({ 'vim-airline/vim-airline' })
  use({ 'vim-airline/vim-airline-themes' })
  use({ 'tpope/vim-fugitive' })
  use({ 'mileszs/ack.vim' })
  use({ 'neovim/nvim-lspconfig' })

  use({ 'hrsh7th/nvim-cmp' })
  use({ 'hrsh7th/cmp-nvim-lsp' })
  use({ 'hrsh7th/cmp-nvim-lua' })
  use({ 'hrsh7th/cmp-buffer' })
  use({ 'hrsh7th/cmp-path' })
  use({ 'hrsh7th/cmp-cmdline' })

  -- Snippets
  use({ 'L3MON4D3/LuaSnip' })
  use({ 'saadparwaiz1/cmp_luasnip' })

  use({ 'rafamadriz/friendly-snippets' })

  use({ 'rust-lang/rust.vim' })
  use({ 'pangloss/vim-javascript' })
  use({ 'leafgarland/typescript-vim' })
  use({ 'MaxMEllon/vim-jsx-pretty' })
  use({ 'peitalin/vim-jsx-typescript' })
  use({ 'prettier/vim-prettier', { run = 'yarn install' } })
  use({ 'habamax/vim-asciidoctor' })

  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
