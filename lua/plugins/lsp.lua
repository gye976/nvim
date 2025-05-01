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

 vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'LSP: Implementations', noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: Go to Definition', noremap = true, silent = true })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: Go to Declaration', noremap = true, silent = true })
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = 'LSP: Go to Type Definition', noremap = true, silent = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover', noremap = true, silent = true })

-- Telescope Picker Setting
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'LSP: References', noremap = true, silent = true })
vim.keymap.set('n', 'gh', builtin.lsp_incoming_calls, { desc = 'LSP: Incoming calls', noremap = true, silent = true })
vim.keymap.set('n', 'gH', builtin.lsp_outgoing_calls, { desc = 'LSP: Outgoing calls', noremap = true, silent = true })
    end
  }
}
