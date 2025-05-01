return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local vscode = require('vscode')
      local c = require('vscode.colors').get_colors()

      vscode.setup({
        transparent = false,
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        terminal_colors = true,

        color_overrides = {	
           vscLineNumber = '#888888',
           vscLightBlue = '#000044',
           vscBlueGreen = '#008888',
        },

        group_overrides = {
            Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
            CursorLine = { bg = '#ffffff' },

            WinSeparator = { fg = '#000000', bg = '#FFFFFF', bold = true },

	    StatusLine = { fg = "#343434", bg = "#b0e5ff" },
	    StatusLineNC = { fg = "#343434", bg = "#e5e5e5" },
	    
	    Normal = { fg = "#343434", bg = "#ffffff" },
	    NormalNC = { fg = "#343434", bg = "#f4f4f4" },

	    NormalFloat = { bg = "#f4f4f4" },

	    TelescopeNormal = { fg = "#000000", bg = "#ffffff" },
	    TelescopeResultsBorder = { fg = "#000000", bg = "#ffffff" },
	    TelescopePreviewBorder = { fg = "#000000", bg = "#ffffff" },
	    TelescopePromptBorder = { fg = "#000000", bg = "#ffffff" },
            TelescopePromptCounter = { fg = "#000000", bg = "#ffffff" },
        },
      })

      vim.o.background = "light"
      vim.cmd.colorscheme "vscode"
    end
  }
}

