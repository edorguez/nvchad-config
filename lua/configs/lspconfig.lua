local on_attach = require("nvchad.configs.lspconfig").on_attach
local original_on_init = require("nvchad.configs.lspconfig").on_init

-- wrap nvchad's on_init to also disable inline document colors from LSPs
local my_on_init = function(client, ...)
  if original_on_init then
    original_on_init(client, ...)
  end
  client.server_capabilities.documentColorProvider = false
end

-- LSP servers (installed automatically by mason-lspconfig.nvim)
local servers = {
  "html",
  "emmet_ls",
  "ts_ls",
  "angularls",
  "csharp_ls",
  "cssls",
  "cssmodules_ls",
  "jsonls",
  "eslint",
  "yamlls",
  "rust_analyzer",
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    on_init = my_on_init,
  })
end

vim.lsp.config("gopls", {
  on_attach = on_attach,
  on_init = my_on_init,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

vim.lsp.enable(servers)
vim.lsp.enable "gopls"
-- note: lua_ls is enabled by nvchad's defaults() (see nvchad.configs.lspconfig)

-- extra LSP keymaps not covered by NvChad's defaults
-- (nvchad already maps: gd, gD, <leader>ra, <leader>D, <leader>wa/wr/wl)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})
