local set = vim.opt_local

set.shiftwidth = 4
set.expandtab = false
set.tabstop = 4

-- clangd hover only shows doc comments from headers; libc/POSIX headers have
-- none, so look up the man page (section 3 first, then 2) instead.
vim.keymap.set("n", "gK", function()
	local word = vim.fn.expand("<cword>")
	if not pcall(vim.cmd.Man, "3 " .. word) then
		vim.cmd.Man(word)
	end
end, { buffer = true, desc = "Man page for word under cursor" })
