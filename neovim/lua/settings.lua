local UTF_8 = 'utf-8'

-- Intendation 
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- vim.o.shortmess = '+=c'                 -- Don't pass messages to |in-completion-menu|.
-- vim.o.iskeyword = '+=-'                 -- treat dash separated words as a word text object


-- better backspace
vim.o.backspace='indent,eol,start'


-- vim.o.formatoptions = '-=cro'           -- Stop newline continuation of comments
vim.o.hidden = true                     -- Required to keep multiple buffers open
vim.o.wrap = false                      -- Display long lines as one line
-- vim.o.whichwrap = '+=<,>,h,l,[,]'       -- Move cursor to the next line when reaching the end


-- Config editor
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.showcmd = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.showmatch = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.mouse = 'a'
vim.o.pumheight = 10                    -- Makse popup menu smaller
vim.o.cmdheight = 2                     -- More space for displaying messages
vim.o.encoding = UTF_8
vim.o.fileencoding = UTF_8
vim.o.conceallevel = 0
vim.o.laststatus = 2                    -- Always displays the status line
vim.o.showtabline = 2                   -- Always show tabs
vim.o.showmode = false                  -- Don't show the mode (e.g. --INSERT)
vim.o.backup  =  false
vim.o.writebackup = false
vim.o.signcolumn = 'yes'                -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300                  -- Faster completion
vim.o.timeoutlen = 500                  -- By default timeoutlen is 1000 ms
vim.o.clipboard = 'unnamedplus'       -- Copy paste between vim and everything else
vim.o.guifont = 'Hack'


-- Theme
vim.o.t_Co = '256'
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.listchars = 'tab:→\\ ,trail:␣,extends:…,eol:⏎'      
vim.o.list = true

-- Search config
vim.o.incsearch = true              -- seach as characters are entered
vim.o.hlsearch  = true              -- highlight matches

-- Spelling
vim.o.spell = true
vim.o.spelllang = 'en'
vim.o.spellsuggest = 'best,9'

-- Folding
vim.o.foldlevelstart = 10
vim.foldnestmax = 10
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
