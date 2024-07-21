local null_ls = require("null_ls")
local opts = {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    require("none-ls.formatting.black"),
    require("none-ls.diagnostics.eslint"),  -- requires none-ls-extras.nvim
    require("none-ls.diagnostics.mypy"),
    require("none-ls.diagnostics.ruff"),
  },

  -- on_attach = function (client, bufnr)
  --   if client.supports_methods("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({
  --       group = augroup,
  --       buffer = bufnr,
  --     })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function ()
  --         vim.lsp.buf.format({ bufnr = bufnr })
  --       end,
  --     })
  --   end
  -- end,
}

return opts
