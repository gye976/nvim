return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim',
    },

    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        preview_width = 0.5,
                        results_width = 0.5,
                    },
                    width = 0.9,
                    height = 0.9,
                    preview_cutoff = 100,
                },
            },
            extensions = {
                live_grep_args = {
		    auto_quoting = true, -- enable/disable auto-quoting
		      -- define mappings, e.g.
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
			    -- freeze the current list and start a fuzzy search in the frozen list
          		    ["<C-space>"] = lga_actions.to_fuzzy_refine,
                        },
                    },
                },
            },
        })

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Telescope help tags' })
	vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, { desc = 'Telescope LSP workspace symbols' })

        --vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Telescope live grep (builtin)' })
        vim.keymap.set('n', '<leader>fg', require("telescope").extensions.live_grep_args.live_grep_args, { desc = 'Telescope live grep (with args)' })

        telescope.load_extension("live_grep_args")
    end
}
