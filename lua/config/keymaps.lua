--leader key = space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Go Back/Forward
vim.api.nvim_set_keymap('n', '<A-Left>', '<C-O>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Right>', '<C-I>', { noremap = true, silent = true })

--window toggle
vim.api.nvim_set_keymap('n', '<Leader>w<Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w<Right>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w<Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w<Down>', '<C-w>j', { noremap = true, silent = true })

--buffer toggle
vim.api.nvim_set_keymap('n', '<Leader><Left>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Right>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>q', ':q!<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>bq', ':bufdo bd!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-k>', '{', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '}', { noremap = true, silent = true })

--disable to log jumplist by {,}
--vim.keymap.set('n', '{', [[:keepjumps normal! {<CR>]], { silent = true })
--vim.keymap.set('n', '}', [[:keepjumps normal! }<CR>]], { silent = true })
