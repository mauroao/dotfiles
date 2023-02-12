local servers = {
  'lua_ls',
  'pyright',
  'tsserver',
  'omnisharp',
  'html',
  'bashls'
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

local open_diagnostic = function ()
  vim.diagnostic.open_float(nil, {focus=false})
end

local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gh',       vim.lsp.buf.hover,           { noremap=true, buffer=bufnr, desc='(LSP) Hover' })
  vim.keymap.set('n', 'gD',       vim.lsp.buf.declaration,     { noremap=true, buffer=bufnr, desc='(LSP) Declaration' })
  vim.keymap.set('n', 'gd',       vim.lsp.buf.definition,      { noremap=true, buffer=bufnr, desc='(LSP) Definition' })
  vim.keymap.set('n', 'gi',       vim.lsp.buf.implementation,  { noremap=true, buffer=bufnr, desc='(LSP) Implementation' })
  vim.keymap.set('n', 'gs',       vim.lsp.buf.signature_help,  { noremap=true, buffer=bufnr, desc='(LSP) Signature help' })
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { noremap=true, buffer=bufnr, desc='(LSP) Type Definition' })
  vim.keymap.set('n', 'gr',       vim.lsp.buf.references,      { noremap=true, buffer=bufnr, desc='(LSP) References' })
  vim.keymap.set('n', 'gt',       open_diagnostic,             { noremap=true, buffer=bufnr, desc='(LSP) Show Diagnostics' })

  if client.server_capabilities.signatureHelpProvider then
    require('lsp-overloads').setup(client, { })
  end
end

local settings = {
  -- lua
  Lua = {
    diagnostics = {
      globals = { "vim", "use" },
    },
    workspace = {
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
      },
    },
  },
  -- python
  python = {
    analysis = {
      diagnosticSeverityOverrides = {
        reportTypedDictNotRequiredAccess = 'information'
      }
    }
  },
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = settings
  }
end

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false
})

