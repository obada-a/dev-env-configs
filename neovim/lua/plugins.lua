local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  --use 'nvim-treesitter/playground'
  --use 'p00f/nvim-ts-rainbow'
  --use 'nvim-treesitter/nvim-treesitter-refactor'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }
  use {
    'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Status
  use {
    'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Theme
  use 'joshdick/onedark.vim'
  use 'arcticicestudio/nord-vim'
  use 'sjl/badwolf'
  use 'jacoborus/tender'
  use 'gosukiwi/vim-atom-dark'
  use 'norcalli/nvim-colorizer.lua'
  use 'kevinhwang91/nvim-bqf'
  use 'unblevable/quick-scope'

  -- Git 
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- CODING --------------------------------- 
  -- generic
  use 'windwp/nvim-autopairs'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'numToStr/Comment.nvim'
  -- Rust
  use 'simrat39/rust-tools.nvim'
  -- Python
  use 'ambv/black'

  -- C#
  use 'OmniSharp/omnisharp-vim'
  ------------------------------------------- 

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'glepnir/lspsaga.nvim'

  if packer_bootstrap then
    require('packer').synch()
  end
end)
