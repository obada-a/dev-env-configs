vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true})
vim.g.mapleader = ','

-- Window movements
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { silent = true })


-- Indentation
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- turn off search highlights
vim.api.nvim_set_keymap('n', '<Leader><space>', ':nohlsearch<CR>', { noremap = true, silent = true })
-- Toggle highlights
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })


-- lexplore
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Escape mapping
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })


-- Move selected line / block of text in visual (https://vim.fandom.com/wiki/Moving_lines_up_or_down)
vim.api.nvim_set_keymap('v', 'K', ':move \'<-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ':move \'>+1<CR>gv=gv', { noremap = true, silent = true })