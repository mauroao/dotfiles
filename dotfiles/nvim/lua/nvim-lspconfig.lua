-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

local open_diagnostics_window = function ()
  vim.diagnostic.open_float(nil, {focus=false})
end

local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { noremap=true, buffer=bufnr, desc='(LSP) Hover' })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap=true, buffer=bufnr, desc='(LSP) Declaration' })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap=true, buffer=bufnr, desc='(LSP) Definition' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap=true, buffer=bufnr, desc='(LSP) Implementation' })
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { noremap=true, buffer=bufnr, desc='(LSP) Signature help' })
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { noremap=true, buffer=bufnr, desc='(LSP) Type Definition' })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap=true, buffer=bufnr, desc='(LSP) References' })
  vim.keymap.set('n', 'gt', open_diagnostics_window, { noremap=true, buffer=bufnr, desc='(LSP) Show Diagnostics' })
  --- Guard against servers without the signatureHelper capability
  if client.server_capabilities.signatureHelpProvider then
    require('lsp-overloads').setup(client, { })
  end
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {'pyright', 'tsserver', 'omnisharp', 'html'}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

-- configure lua server (with special settings)
lspconfig['sumneko_lua'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim", "use" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- Python specific settings
-- lspconfig['pyright'].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = {
--     python = {
--       analysis = {
--         diagnosticSeverityOverrides = {
--           reportTypedDictNotRequiredAccess = 'information'
--         }
--       }
--     }
--   }
-- }

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]




