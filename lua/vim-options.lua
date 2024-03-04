vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("-")

local keymap = vim.keymap;
local custom_keymaps = require('keymaps')

-- Setup normal mode mappings
for mode, mappings in pairs(custom_keymaps) do
    for key, value in pairs(mappings) do
        keymap.set(mode, key, value.mappedTo, value.opts);
    end
end
