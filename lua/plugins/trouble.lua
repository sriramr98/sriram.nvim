return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local trouble = require("trouble")
		-- Lua
		vim.keymap.set("n", "<leader>xx", function()
			trouble.toggle()
		end, { desc = "Toggle Trouble Window" })
		vim.keymap.set("n", "<leader>xw", function()
			trouble.toggle("workspace_diagnostics")
		end, { desc = "Open Workspace Diagnostics" })
		vim.keymap.set("n", "<leader>xd", function()
			trouble.toggle("document_diagnostics")
		end, { desc = "Open Document Diagnostics" })
		vim.keymap.set("n", "<leader>xq", function()
			trouble.toggle("quickfix")
		end, { desc = "Open Quickfix Window" })
		vim.keymap.set("n", "<leader>xl", function()
			trouble.toggle("loclist")
		end)
		vim.keymap.set("n", "gR", function()
			trouble.toggle("lsp_references")
		end, { desc = "Open LSP References" })
	end,
}
