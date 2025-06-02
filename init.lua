require 'core.options'
require 'core.keymaps'


local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
	require 'plugins.neotree',
	require 'plugins.colortheme',
	require 'plugins.treesitter',
	require 'plugins.telescope',
	require 'plugins.lsp',
	require 'plugins.autopairs',
	require 'plugins.autocompletion',
	require 'plugins.gitsigns'
})
-- Set statusline to show current working directory
vim.o.statusline = '%F %=%m %y %r %=%-14.(%l,%c%V%) %P'

vim.cmd.colorscheme "catppuccin"
