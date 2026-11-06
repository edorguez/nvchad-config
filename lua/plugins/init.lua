return {
  -- formatter (config: lua/configs/conform.lua)
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  -- package manager for LSP servers, formatters & DAP adapters
  {
    "mason-org/mason.nvim",
  },

  -- auto-installs the LSP servers listed below.
  -- note: `automatic_enable = false` because enabling is handled
  -- manually in lua/configs/lspconfig.lua (native vim.lsp API).
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "cssmodules_ls",
        "jsonls",
        "eslint",
        "yamlls",
        "emmet_ls",
        "angularls",
        "csharp_ls",
        "rust_analyzer",
        "gopls",
      },
      automatic_enable = false,
    },
  },

  -- LSP servers config (config: lua/configs/lspconfig.lua)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- git decorations (config: lua/configs/gitsignsconfig.lua)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "configs.gitsignsconfig"
    end,
  },

  -- debugger (config: lua/configs/dap.lua)
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },

  -- auto-installs DAP adapters (with default setup handlers)
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      ensure_installed = { "codelldb", "delve" },
      automatic_installation = true,
    },
  },

  -- Go debugging with delve (breakpoints, tests, etc.)
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    opts = {},
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = {},
  },

  -- vim islands: auto close/rename tags in markup files
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "typescript",
        "css",
        "html",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "go",
        "gomod",
        "gowork",
        "gotmpl",
        "rust",
      },
    },
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        number = true,
        relativenumber = true,
      },
    },
  },

  -- pretty diagnostics / symbols / references panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>dx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      {
        "<leader>dX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      { "<leader>dL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>dQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
    opts = {},
  },
}
