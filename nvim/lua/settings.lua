-- ~/.config/nvim/lua/settings.lua
vim.g.python3_host_prog = "/usr/bin/python3" -- Add or update this line
vim.opt.guicursor = ""

vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_method = "latexmk"
vim.keymap.set("n", "<leader>vv", ":VimtexView<CR>", { desc = "View PDF with forward search" })

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Custom keybindings
vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Move highlighted text up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-- Append next line to current line with cursor position preserved
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join next line with cursor position" })

-- Half-page movement with cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down, centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up, centered" })

-- Search navigation with cursor centered
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result, centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result, centered" })

-- Paste without overwriting clipboard
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste without overwriting clipboard" })

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy to system clipboard in visual mode" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Copy line to system clipboard" })

-- Show diagnostics in quickfix list
vim.keymap.set("n", "<leader>e", function() vim.diagnostic.setqflist() end, { desc = "Show diagnostics in quickfix list" })
