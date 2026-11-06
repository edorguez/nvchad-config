# nvchad-config

My Neovim configuration based on the [NvChad starter](https://github.com/NvChad/starter)
(NvChad v2.5 + base46/UI v3.0), focused on **Web (TS/JS/React/Angular), Go, Rust,
HTML/CSS, JSON/YAML and Lua** development. All tooling (LSPs, formatters, debuggers)
is installed automatically on the first Neovim launch, thanks to Mason.

## Requirements

- **Neovim >= 0.12** — `brew install neovim`
- `git`
- Toolchains for whatever you code in: `node`/`npm`, `go`, `rust`/`cargo`, `dotnet` (C#), JDK (Angular)

Recommended:

- `brew install ripgrep` — fast grep for Telescope (`<leader>fw`)
- `brew install lazygit` — interactive git diffs/history

## Installation

On a new Mac:

```bash
# back up (or delete) previous configs
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null

# clone and launch
git clone https://github.com/edorguez/nvchad-config ~/.config/nvim
nvim
```

The first run installs plugins, treesitter parsers and all the Mason tooling
(LSPs, stylua, prettierd, gofumpt, codelldb, delve, ...). It may take a few minutes.

To update later: `cd ~/.config/nvim && git pull`, then inside nvim run `:Lazy update`.

## Included stack

| Component | What it provides |
| --- | --- |
| [NvChad v2.5](https://github.com/NvChad/NvChad) | Base: tokyonight theme, statusline, NvChad UI v3.0 |
| Mason 2.x | Automatic installation of LSP/formatters/adapters |
| conform.nvim | Formatting (`<leader>fm` + format on save): stylua, gofumpt, rustfmt, prettierd |
| nvim-lspconfig 0.11+ API | Native LSP: ts_ls, gopls, rust_analyzer, cssls, html, eslint, ... |
| nvim-treesitter | Highlighting for every language listed above |
| trouble.nvim v3 | Diagnostics/symbols/references panel |
| nvim-dap + dap-ui + dap-go | Debugging: codelldb (C/C++/Rust) and delve (Go) |
| gitsigns.nvim | Git decorations in the gutter |
| nvim-tree + nvim-ts-autotag | File explorer and auto tag closing |

## Key bindings (leader = `Space`)

| Key | Action |
| --- | --- |
| `;` | Command mode |
| `jk` (insert) | `<ESC>` |
| `<C-n>` / `<leader>e` | NvimTree toggle / focus |
| `<leader>ff` / `fw` / `fb` / `fh` | Telescope: find files / grep / buffers / help |
| `<leader>ca` (or `gra`) | Code actions |
| `gd`, `gD`, `gi`, `gr`, `K`, `grr` | LSP navigation |
| `<leader>fm` | Format buffer |
| `<leader>dx` / `<leader>dX` | Diagnostics (workspace / buffer) |
| `<leader>cs` / `<leader>cl` | Symbols / LSP panel (Trouble) |
| `<leader>dL` / `<leader>dQ` | Location list / Quickfix |
| `<leader>db` / `dc` / `du` / `di` / `dU`/`dr` | DAP: toggle breakpoint / continue / step over/in/out / UI |
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>b`, `<tab>`, `<S-tab>`, `<leader>x` | Buffer: new / next / previous / close |
| `<A-h>` / `<A-v>` / `<A-i>` | Toggle terminals |
| `<leader>ch` | NvChad cheatsheet |
| `<leader>wK` / `<leader>wk` | WhichKey |

## Credits

- [NvChad and its starter](https://github.com/NvChad/NvChad) — the foundation of it all
- [lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager
- Every plugin listed in `lazy-lock.json`
