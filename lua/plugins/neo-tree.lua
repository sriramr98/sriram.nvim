return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left toggle<CR>", { desc = "Toggle Neotree" })
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Focus on Neotree" })
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "Show list of open buffers" })
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
					hide_by_name = {
						"node_modules",
					},
				},
			},
		})
	end,
}
