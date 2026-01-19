local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'phaazon/hop.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
      'windwp/nvim-ts-autotag', 
      requires = 'nvim-treesitter/nvim-treesitter',
      config = function()
          require('nvim-ts-autotag').setup()
      end
  }
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }
  -- use {
  --   'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons', opt = true}
  -- }
  -- Autocompletion
  -- use({
  -- 	"L3MON4D3/LuaSnip",
  -- 	tag = "v1.*",
  -- 	run = "make install_jsregexp"
  -- })
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  -- Status
  use {
    'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- FZF Lua
  use { "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" }
  }

  -- Telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'luc-tielen/telescope_hoogle'

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

  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
  use 'williamboman/mason-lspconfig.nvim'
  -- CODING --------------------------------- 
  -- generic
  -- use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'numToStr/Comment.nvim'
  -- Rust
  use 'simrat39/rust-tools.nvim'
  -- Python
  use 'ambv/black'
  

  use {
        'nvim-flutter/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    }
  -- Elixir
  use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})

  -- C#
  use 'OmniSharp/omnisharp-vim'
  ------------------------------------------- 
  -- Typescript

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'L3MON4D3/LuaSnip'
  use 'glepnir/lspsaga.nvim'
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }


  -- Other
  use 'voldikss/vim-floaterm'

  if packer_bootstrap then
    require('packer').synch()
  end
end)
