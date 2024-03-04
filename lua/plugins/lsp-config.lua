local required_lsps = {
	"pyright",
	"tsserver",
	"lua_ls",
	"dockerls",
    "rust_analyzer",
    "gopls"
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = required_lsps,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

            -- List all lsps installed by mason and setup capabilities
            local servers = require("mason-lspconfig").get_installed_servers()
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {}, { desc = "Show Hover Definition" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto References" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Open Code Actions" })
			vim.keymap.set("n", "<leader>gI", vim.lsp.buf.implementation, { desc = "Open Implementations" })
			vim.keymap.set("n", "<leader>vR", vim.lsp.buf.rename, { desc = "Open Float" })
			vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature Help" })
		end,
	},
}
