return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Lua
        vim.keymap.set("n", "<leader>xx", function()
            require("trouble").toggle()
        end, { desc = "Toggle Trouble Window" })
        vim.keymap.set("n", "<leader>xw", function()
            require("trouble").toggle("workspace_diagnostics")
        end, { desc = "Open Workspace Diagnostics" })
        vim.keymap.set("n", "<leader>xd", function()
            require("trouble").toggle("document_diagnostics")
        end, { desc = "Open Document Diagnostics" })
        vim.keymap.set("n", "<leader>xq", function()
            require("trouble").toggle("quickfix")
        end, { desc = "Open Quickfix Window" })
        vim.keymap.set("n", "<leader>xl", function()
            require("trouble").toggle("loclist")
        end)
        vim.keymap.set("n", "gR", function()
            require("trouble").toggle("lsp_references")
        end, { desc = "Open LSP References" })
    end,
}
