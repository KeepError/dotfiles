-- Language servers
-- Find available here: https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.lsp.enable({ "lua_ls", "ty", "ruff", "ts_ls", "biome", "gopls" })

-- Formatters
-- Find available here: https://github.com/stevearc/conform.nvim/blob/master/lua/conform/formatters
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    javascript = { "biome-check" },
    typescript = { "biome-check" },
    go = { "gofmt" },
  },
})
