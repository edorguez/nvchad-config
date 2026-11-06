-- NvChad default autocmds + your own autocmds here

require "nvchad.autocmds"

-- auto-install formatter tools via Mason.
-- LSPs are handled by mason-lspconfig.nvim and DAP adapters by mason-nvim-dap.nvim.
local mason_tools = { "stylua", "prettierd", "gofumpt" }

vim.defer_fn(function()
  local ok, registry = pcall(require, "mason-registry")
  if not ok then
    return
  end

  local function install_package(name)
    local ok_pkg, pkg = pcall(registry.get_package, registry, name)
    if ok_pkg and pkg and not pkg:is_installed() then
      pkg:install()
    end
  end

  registry.refresh(function()
    for _, name in ipairs(mason_tools) do
      install_package(name)
    end
  end)
end, 750)
