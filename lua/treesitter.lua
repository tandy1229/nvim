require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,         -- false will disable the whole extension
    disable = { "bash" },          -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
  refactor = {
    highlight_definitions = {
    enable = true,
    disable = {"python"},          -- list of language that will be disabled
  },
    -- highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<space>rr",
      },
    },
  },
	query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },
}
