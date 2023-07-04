local lsp = require("lsp-zero").preset({
  name = "minimal",
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.format_mapping("<leader>f", {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["lua_ls"] = { "lua" },
    ["null-ls"] = { "html", "json", "yaml", "markdown", "css", "javascript", "javascriptreact" },
  },
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  lsp.buffer_autoformat()
end)

lsp.setup()

local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd.with({
      disabled_filetypes = {},
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/.prettierrc.json"),
      },
    }),
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostic_config = {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        severity_sort = true,
      },
    }),
    null_ls.builtins.completion.spell,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
