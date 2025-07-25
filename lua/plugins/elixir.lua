return {
  {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { 
	"nvim-tree/nvim-web-devicons" 
  },
  },
  {
    "gye976/elixir.nvim",
    version = "*",
    dependencies = { 
	    "akinsho/bufferline.nvim",
	    "dhananjaylatkar/cscope_maps.nvim",
	    "nvim-telescope/telescope.nvim",
	    "neovim/nvim-lspconfig",
	    "nvim-treesitter/nvim-treesitter",
    },

    config = function()
	local elixir = require("elixir")

	vim.keymap.set('n', '<Leader><Left>', elixir.tab.prev, { noremap = true, silent = true })
	vim.keymap.set('n', '<Leader><Right>', elixir.tab.next, { noremap = true, silent = true })
	vim.keymap.set('n', '<Leader>q', elixir.tab.close, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>ss", elixir.search.symbol, { desc = "Search Symbol" })
        vim.keymap.set("n", "<leader>sd", elixir.search.definition, { desc = "Search Definition" })

        vim.keymap.set('n', 'gf', elixir.goto.def_in_ctx, { desc = 'LSP: gf', noremap = true, silent = true })

        vim.keymap.set('n', 'gd', elixir.goto.def, { desc = 'LSP: gd', noremap = true, silent = true })
        vim.keymap.set('n', 'gr', elixir.goto.ref, { desc = 'LSP: gr', noremap = true, silent = true })
        vim.keymap.set('n', 'gi', elixir.goto.incoming, { desc = 'LSP: gi', noremap = true, silent = true })
        vim.keymap.set('n', 'go', elixir.goto.outgoing, { desc = 'LSP: go', noremap = true, silent = true })

        vim.keymap.set('n', 'gD', elixir.goto.def_in_newtab, { desc = 'LSP: gD', noremap = true, silent = true })
        vim.keymap.set('n', 'gR', elixir.goto.ref_in_newtab, { desc = 'LSP: gR', noremap = true, silent = true })
        vim.keymap.set('n', 'gI', elixir.goto.incoming_in_newtab, { desc = 'LSP: gI', noremap = true, silent = true })
       vim.keymap.set('n', 'gO', elixir.goto.outgoing_in_newtab, { desc = 'LSP: gO', noremap = true, silent = true })

    end
  }
}
