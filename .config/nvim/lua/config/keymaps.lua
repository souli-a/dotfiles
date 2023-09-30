vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = false
vim.opt.signcolumn = 'yes'
vim.opt.guicursor = block
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.o.hlsearch = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.termguicolors = true

local bind = vim.keymap.set
local opts = { silent = true, noremap = true }

bind('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
bind('n', '<leader>q', '<CMD>q!<CR>', opts)

bind('n', '<leader>h', ':wincmd h<CR>', opts)
bind('n', '<leader>l', ':wincmd l<CR>', opts)
bind('n', '<leader>k', ':wincmd k<CR>', opts)
bind('n', '<leader>j', ':wincmd j<CR>', opts)

bind('i', 'jj', '<Esc>')
bind('n', '<Esc>', ':')

bind('n', '<leader>v', ':vsplit<CR><C-w>l', opts)

bind('n', '<A-k>', ':m -2<CR>', opts)
bind('n', '<A-j>', ':m +1<CR>', opts)
