return {
    "jackMort/ChatGPT.nvim",
    config = function()
        require("chatgpt").setup({
            api_key_cmd = "op read op://Private/gpt_api_key/credential --no-newline"
        })
        vim.keymap.set("n", "<leader>cg", ":ChatGPT<CR>", { desc = "Open ChatGPT" })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim",
    },
}
