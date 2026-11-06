# nvchad-config

Mi configuración de Neovim basada en el [starter de NvChad](https://github.com/NvChad/starter)
(NvChad v2.5 + base46/UI v3.0), enfocada en desarrollo **Web (TS/JS/React/Angular), Go, Rust,
HTML/CSS, JSON/YAML y Lua**. Todo el tooling (LSPs, formatters, debuggers) se instala
automáticamente la primera vez que abres Neovim gracias a Mason.

## Requisitos

- **Neovim >= 0.12** — `brew install neovim`
- `git`
- Toolchains según lo que programes: `node`/`npm`, `go`, `rust`/`cargo`, `dotnet` (C#), JDK (Angular)

Recomendados:

- `brew install ripgrep` — grep rápido para Telescope (`<leader>fw`)
- `brew install lazygit` — diffs/historial de git interactivo

## Instalación

En una Mac nueva:

```bash
# respalda (o borra) configuraciones previas
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null

# clona y arranca
git clone https://github.com/EdoRguez/nvchad-config ~/.config/nvim
nvim
```

La primera ejecución instala plugins, parsers de treesitter y todo el tooling de Mason
(LSPs, stylua, prettierd, gofumpt, codelldb, delve, ...). Puede tardar unos minutos.

Para actualizar después: `cd ~/.config/nvim && git pull` y dentro de nvim `:Lazy update`.

## Ambiente incluido

| Componente | Qué es |
| --- | --- |
| [NvChad v2.5](https://github.com/NvChad/NvChad) | Base: tema tokyonight, statusline, NvChad UI v3.0 |
| Mason 2.x | Instalación automática de LSP/formatters/adapters |
| conform.nvim | Formateo (`<leader>fm` + format on save): stylua, gofumpt, rustfmt, prettierd |
| nvim-lspconfig 0.11+ API | LSP nativo: ts_ls, gopls, rust_analyzer, cssls, html, eslint, ... |
| nvim-treesitter | Highlight para todos los lenguajes listados arriba |
| trouble.nvim v3 | Panel de diagnostics/symbols/references |
| nvim-dap + dap-ui + dap-go | Debugging: codelldb (C/C++/Rust) y delve (Go) |
| gitsigns.nvim | Decoraciones git en el gutter |
| nvim-tree + nvim-ts-autotag | Explorador de archivos y auto-cierre de tags |

## Mapeos principales (leader = `Espacio`)

| Tecla | Acción |
| --- | --- |
| `;` | Modo comando |
| `jk` (insert) | `<ESC>` |
| `<C-n>` / `<leader>e` | NvimTree toggle / focus |
| `<leader>ff` / `fw` / `fb` / `fh` | Telescope: archivos / grep / buffers / help |
| `<leader>ca` (o `gra`) | Code actions |
| `gd`, `gD`, `gi` , `gr`, `K`, `grr` | Navegación LSP |
| `<leader>fm` | Formatear buffer |
| `<leader>dx` / `<leader>dX` | Diagnostics (workspace / buffer) |
| `<leader>cs` / `<leader>cl` | Symbols / LSP panel (Trouble) |
| `<leader>dL` / `<leader>dQ` | Location list / Quickfix |
| `<leader>db` / `dc` / `du` / `di` / `dU`/`dr` | DAP: toggle breakpoint / continue / step over/in/out / UI |
| `<C-h/j/k/l>` | Navegar ventanas |
| `<leader>b`, `<tab>`, `<S-tab>`, `<leader>x` | Buffer: nuevo / siguiente / anterior / cerrar |
| `<A-h>` / `<A-v>` / `<A-i>` | Terminales toggle |
| `<leader>ch` | NvChad cheatsheet |
| `<leader>wK` / `<leader>wk` | WhichKey |

## Créditos

- [NvChad y su starter](https://github.com/NvChad/NvChad) — la base de todo
- [lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager
- Todos los plugins listados en `lazy-lock.json`
