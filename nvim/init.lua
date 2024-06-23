require("david")
-- vim.o.background = "dark" 
vim.o.hlsearch = true
vim.cmd("colorscheme gruvbox")


-- Latex
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'

vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax enable]]
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach({})
    end,
    group = nvim_metals_group,
  })

