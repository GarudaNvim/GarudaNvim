local ok, conform = pcall(require, "conform")
if not ok then return end

conform.setup({
  formatters_by_ft = {
    c          = { "clang_format" },
    cpp        = { "clang_format" },
    python     = { "ruff_format" },
    java       = { "google_java_format" },
    go         = { "goimports" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    jsx        = { "prettier" },
    tsx        = { "prettier" },
    lua        = { "stylua" },
  },
  -- lsp_fallback = false: conform is the sole formatter, never falls back to LSP
  format_on_save = { timeout_ms = 3000, async = false, lsp_fallback = false },
})
