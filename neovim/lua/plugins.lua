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
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  -- using packer.nvim
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'glepnir/lspsaga.nvim'

  use 'glepnir/galaxyline.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'mfussenegger/nvim-jdtls'
  use 'mfussenegger/nvim-dap'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use 'joshdick/onedark.vim'
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
  use 'windwp/nvim-autopairs'


  if packer_bootstrap then
    require('packer').synch()
  end
end)
