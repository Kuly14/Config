vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- When highligted moves all highligted text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Moves the next line to this line with a space
vim.keymap.set("n", "J", "mzJ`z")

-- Moves half a page either down or up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pastes without copying the underlying value
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Copies the data to the general copy register 
-- So you can just ctlr v anywhere else outside of vim
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.setqflist()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })

