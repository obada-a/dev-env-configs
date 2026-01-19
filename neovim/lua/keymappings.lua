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


-- Folding
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true, silent = true })

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
-- vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })


-- Move selected line / block of text in visual (https://vim.fandom.com/wiki/Moving_lines_up_or_down)
vim.api.nvim_set_keymap('v', 'K', ':move \'<-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ':move \'>+1<CR>gv=gv', { noremap = true, silent = true })


-- File refresh
vim.api.nvim_set_keymap('n', '<Leader>r', ':edit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ri', ':edit!<CR>', { noremap = true, silent = true })


-- Git 
vim.api.nvim_set_keymap('n', '<Leader>g', ':GitBlameToggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>gu', ':GitBlameOpenCommitURL<CR>', { noremap = true, silent = true})

-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])

vim.api.nvim_set_keymap('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>",  { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "Dw", ":call vimspector#AddWatch()<cr>",  { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "De", ":call vimspector#Evaluate()<cr>",  { noremap = true, silent = true})


-- FloaTerm configuration
vim.api.nvim_set_keymap('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.4 --width=1.0 --position=bottom --autoclose=2 <CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', "t", ":FloatermToggle myfloat<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', "<Esc>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true})


-- FzfLua
vim.keymap.set('n', "<C-P>", require('fzf-lua').files, {desc = "Fzf Files"})
