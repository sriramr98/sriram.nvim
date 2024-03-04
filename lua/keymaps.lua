return {
	n = {
		["<leader>sv"] = { mappedTo = "<C-w>v", opts = { desc = "Split Vertically" } },
		["<leader>sh"] = { mappedTo = "<C-w>s", opts = { desc = "Split Horizontally" } },
		["<leader>se"] = { mappedTo = "<C-w>=", opts = { desc = "Make split windows equal width" } },
		["<leader>sx"] = { mappedTo = ":close<CR>", opts = { desc = "Close Current Split Window" } },

		-- Vim Panes Navigation
		["<c-k>"] = { mappedTo = ":wincmd k<CR>", opts = { desc = "Move to top pane" } },
		["<c-j>"] = { mappedTo = ":wincmd j<CR>", opts = { desc = "Move to bottom pane" } },
		["<c-h>"] = { mappedTo = ":wincmd h<CR>", opts = { desc = "Move to left pane" } },
		["<c-l>"] = { mappedTo = ":wincmd l<CR>", opts = { desc = "Move to right pane" } },

		-- Quit highlights
		["<leader>q"] = { mappedTo = ":noh<CR>", opts = { desc = "Quit all highlights" } },

		-- Tabs
		["<leader>to"] = { mappedTo = ":tabnew<CR>", opts = { desc = "Open new Tab" } },
		["<leader>tn"] = { mappedTo = ":tabn<CR>", opts = { desc = "Goto Next Tab" } },
		["<leader>tp"] = { mappedTo = ":tabp<CR>", opts = { desc = "Goto Previous Tab" } },
		["<leader>tx"] = { mappedTo = ":tabclose<CR>", opts = { desc = "Close Tab" } },

		-- Telescope
		["<leader>ff"] = { mappedTo = ":Telescope find_files<CR>", opts = { desc = "Find Files" } },
		["<leader>fw"] = { mappedTo = ":Telescope live_grep<CR>", opts = { desc = "Search Across Files" } },
		["<leader>fg"] = { mappedTo = ":Telescope git_files<CR>", opts = { desc = "Search Git Files" } },
		["<leader>fG"] = { mappedTo = ":Telescope grep_string<CR>", opts = { desc = "Search String under cursor" } },
		["<leader>fu"] = { mappedTo = ":Telescope undo<CR>", opts = { desc = "Open Undo History" } },
	},
	i = {
		["jk"] = { mappedTo = "<ESC>", { desc = "Go to normal mode" } },
	},
}
