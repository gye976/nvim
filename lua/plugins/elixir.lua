return {
  {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { 
	"nvim-tree/nvim-web-devicons" },
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
	    local ts_utils = require("nvim-treesitter.ts_utils")

local function get_function_name()
  local expr = ts_utils.get_node_at_cursor()
  if not expr then return "" end

  while expr do
    if expr:type() == 'function_definition' then
      break
    end
    expr = expr:parent()
  end

  if not expr then return "" end

  -- expr:child(1) 대신 이름 노드 찾아보기
  local name_node = expr:child(0)
  if not name_node then return "[anonymous]" end

  local ok, name = pcall(vim.treesitter.query.get_node_text, name_node, 0)
  if ok and name ~= "" then
    return name:gsub("\n", " ")  -- 줄바꿈 있으면 공백으로 바꿈
  else
    -- 노드 텍스트를 못 얻으면 노드 범위로 직접 텍스트 얻기
    local start_row, start_col, end_row, end_col = expr:range()
    local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)

    if #lines == 0 then
      return "[anonymous]"
    end

	for i, line in ipairs(lines) do
		print(string.format("line %d: %s", i, line))
	end

	local text = ""
	for i, line in ipairs(lines) do
		local brace_pos = string.find(line, "{")
  line = line:gsub("^%s+", "")        -- 앞쪽 공백 제거
  line = line:gsub("\t", " ")         -- 탭을 공백으로
  line = line:gsub("%s+", " ")        -- 다중 공백을 하나로
		if brace_pos then
	    		text = text .. string.sub(line, 1, brace_pos - 1)
	    		break
	  	else
	    		text = text .. line .. " "
	  	end
	end
	
	return text
end
end  -- 여기 꼭 닫기!


local function update_winbar()
  local text = get_function_name()
  if text == "" then text = "" end
  vim.opt.winbar = text
end

vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI", "BufEnter", "BufWinEnter"}, {
  callback = update_winbar,
})

update_winbar()

	local elixir = require("elixir")

	vim.keymap.set('n', '<Leader><Left>', elixir.tab.prev, { noremap = true, silent = true })
	vim.keymap.set('n', '<Leader><Right>', elixir.tab.next, { noremap = true, silent = true })
	vim.keymap.set('n', '<Leader>q', elixir.tab.close, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>ss", elixir.search.symbol, { desc = "Search Symbol" })
        vim.keymap.set("n", "<leader>sd", elixir.search.definition, { desc = "Search Definition" })

        vim.keymap.set('n', 'gd', elixir.goto.definition, { desc = 'LSP: gd', noremap = true, silent = true })
        vim.keymap.set('n', 'gr', elixir.goto.references, { desc = 'LSP: gr', noremap = true, silent = true })
        vim.keymap.set('n', 'gi', elixir.goto.incoming, { desc = 'LSP: gi', noremap = true, silent = true })
        vim.keymap.set('n', 'go', elixir.goto.outgoing, { desc = 'LSP: go', noremap = true, silent = true })

        vim.keymap.set('n', 'gD', elixir.goto.definition_in_newtab, { desc = 'LSP: gD', noremap = true, silent = true })
        vim.keymap.set('n', 'gR', elixir.goto.references_in_newtab, { desc = 'LSP: gR', noremap = true, silent = true })
        vim.keymap.set('n', 'gI', elixir.goto.incoming_in_newtab, { desc = 'LSP: gI', noremap = true, silent = true })
       vim.keymap.set('n', 'gO', elixir.goto.outgoing_in_newtab, { desc = 'LSP: gO', noremap = true, silent = true })

    end
  }
}
