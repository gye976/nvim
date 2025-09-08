
--leader key = space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Go Back/Forward
--vim.api.nvim_set_keymap('n', '<A-Left>', '<C-O>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<A-Right>', '<C-I>', { noremap = true, silent = true })

--window toggle
vim.api.nvim_set_keymap('n', '<Leader>w<Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w<Right>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wl', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w<Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w<Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wj', '<C-w>j', { noremap = true, silent = true })

vim.keymap.set('n', 'd', '"_d', { noremap = true })

--vim.keymap.set('n', '<C-k>', '{', { noremap = true, silent = true })
--vim.keymap.set('n', '<C-j>', '}', { noremap = true, silent = true })

--disable to log jumplist by {,}
--vim.keymap.set('n', '{', [[:keepjumps normal! {<CR>]], { silent = true })
--vim.keymap.set('n', '}', [[:keepjumps normal! }<CR>]], { silent = true })
