-- formatters per language. All tools are installed automatically via Mason.
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt" },
    rust = { "rustfmt" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
  },

  formatters = {
    prettierd = {
      -- respect the project's prettier config (.prettierrc, prettier.config.js, ...)
      prepend_args = { "--config-precedence", "prefer-file" },
    },
  },

  -- format on save (also available on demand with <leader>fm)
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
