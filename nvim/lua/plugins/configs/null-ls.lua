local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  debug = true,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    null_ls.builtins.completion.luasnip,
    require("none-ls.diagnostics.eslint"),
    -- require("none-ls.formatting.clang_format"),
    require("none-ls.diagnostics.ruff"),
    -- require("none-ls.diagnostics.mypy"),
    require("none-ls.formatting.autopep8"),
  },
  on_attach = function(client, bufnr)
    if client.supports_methods("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
}

return opts
