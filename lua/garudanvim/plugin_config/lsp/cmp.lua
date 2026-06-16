local ok, blink = pcall(require, "blink.cmp")
if not ok then return end

blink.setup({
  keymap = {
    preset       = "default", -- C-n/C-p navigate, C-y accept, C-e cancel
    ["<Tab>"]    = { "select_next", "fallback" },
    ["<S-Tab>"]  = { "select_prev", "fallback" },
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    menu = {
      auto_show = true,
      border    = "rounded",
    },
    documentation = {
      auto_show          = true,
      auto_show_delay_ms = 200,
      window             = { border = "rounded" },
    },
    ghost_text = { enabled = false },
  },
  sources   = { default = { "lsp", "path", "snippets", "buffer" } },
  signature = { enabled = true, window = { border = "rounded" } },
})
