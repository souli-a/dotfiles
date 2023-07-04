vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.o.hlsearch = true
vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.termguicolors = true
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.guicursor = block
vim.opt.signcolumn = "yes"

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>q", "<CMD>q!<CR>", { noremap = true })

vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { noremap = true })

vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", { noremap = true })
vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true })

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<Esc>", ":")

vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", { noremap = true })

vim.keymap.set("n", "<A-k>", ":m -2<CR>")
vim.keymap.set("n", "<A-j>", ":m +1<CR>")
