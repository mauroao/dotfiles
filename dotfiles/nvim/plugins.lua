return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "omnisharp",
        "typescript-language-server",
        "html-lsp",
        "yaml-language-server",
        "json-lsp",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "gopls",
      },
    },
  },
}
