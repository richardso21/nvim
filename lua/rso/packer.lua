vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- >>> CORE >>>

  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- fuzzy finding
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  -- color scheme
  use {
    "bluz71/vim-nightfly-colors",
    as = "nightfly",
    config = function()
      vim.cmd("colorscheme nightfly")
    end
  }

  -- tree sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    { run = ":TSUpdate" }
  }

  -- file tree
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
  }

  -- buffer bar
  use "nvim-tree/nvim-web-devicons"
  use {
    "romgrk/barbar.nvim",
    requires = "nvim-web-devicons"
  }

  -- status bar
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  }

  -- LSP
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
        -- Optional
        "williamboman/mason.nvim",
        run = function()
          ---@diagnostic disable-next-line: param-type-mismatch
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    }
  }


  -- >>> MISC >>>

  -- debugger
  use {
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim"
  }

  -- commenting
  use "numToStr/Comment.nvim"

  -- smooth scrolling
  use "karb94/neoscroll.nvim"

  -- lsp progress
  use "j-hui/fidget.nvim"

  -- indent guides
  use "lukas-reineke/indent-blankline.nvim"

  -- git
  use "tpope/vim-fugitive"

  -- undotree
  use "mbbill/undotree"

  -- which key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  }

  -- save sessions
  use {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      }
    end
  }

  -- dim inactive windows
  use "levouh/tint.nvim"

  -- zen mode
  use "folke/zen-mode.nvim"
end)
