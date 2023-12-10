local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Theme
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nightfly]])
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  "nvim-treesitter/nvim-treesitter-context",
  "HiPhish/rainbow-delimiters.nvim",

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- LSP & Autocomplete
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x'
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  'saadparwaiz1/cmp_luasnip',
  {
    "folke/trouble.nvim",
    opts = {}
  },
  "folke/neodev.nvim",

  -- LaTeX
  {
    "lervag/vimtex",
    lazy = false,
  },

  -- Bracket/Parenthesis/Brace Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = '<leader>ml',
        block = '<leader>mk'
      },
      opleader = {
        line = 'ml',
        block = 'mk'
      },
      mappings = {
        extra = false
      }
    },
    lazy = false,
  },

  -- File Explorer
  "nvim-tree/nvim-tree.lua",

  -- Git (Fugitive)
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    opts = {} -- required for it to actually init
  },

  -- UI wowzers
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  "folke/noice.nvim",

  -- Mode Line
  "nvim-lualine/lualine.nvim",

  -- Buffers
  "akinsho/bufferline.nvim",
  "famiu/bufdelete.nvim",

  -- Window Tinting
  {
    "levouh/tint.nvim",
    opts = {
      tint = -55
    },
  },

  -- Scrolling
  {
    "karb94/neoscroll.nvim",
    opts = {
      easing_function = "sine"
    },
  },

  -- Indentations
  {
    "echasnovski/mini.indentscope",
    version = '*',
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },

  -- Variable illuminate
  "RRethy/vim-illuminate",

  -- Undo Tree
  "mbbill/undotree",

  -- Session Persist
  {
    "rmagatti/auto-session",
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
  },
  -- {
  --   "folke/persistence.nvim",
  --   event = "BufReadPre", -- this will only start session saving when an actual file was opened
  --   opts = {},
  --   init = function()
  --     require("persistence").load()
  --   end
  -- },

  -- Which Key
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = true,
    opts = {
      open_mapping = [[<c-\>]],
      direction = 'float'
    }
  },

  -- Github Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {}
  },
})

vim.keymap.set("n", "<leader>z", function() vim.cmd("Lazy") end)
