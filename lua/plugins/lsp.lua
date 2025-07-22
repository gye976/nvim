return {
  {
     "williamboman/mason.nvim",
      config = function() 
        require('mason').setup()
      end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.clangd.setup({})
      lspconfig.bashls.setup({})

	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover', noremap = true, silent = true })

    end
  }
}
