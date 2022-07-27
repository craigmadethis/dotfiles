local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- require("user.lsp.null-ls")
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
-- defining servers to start and their configs

require("user.lsp.configs")
--
require("user.lsp.handlers").setup()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup {
  sources = {
    require("null-ls").builtins.formatting.prettier.with({
      extra_args = function(params)
        return params.options
            and params.options.tabSize
            and { "--tab-width",
              params.options.tabSize,
            }
      end,
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
