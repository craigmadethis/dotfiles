return {
  -- on_attach = on_attach,
  -- capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false, },
    },
  },
}
