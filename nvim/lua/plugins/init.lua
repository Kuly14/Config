return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup {
                actions = {
                    open_file = {
                        window_picker = {
                            enable = false, -- Disable window picker to avoid manual selection
                        },
                    },
                },
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")
                    local function opts(desc)
                        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end
                    -- Load default mappings
                    api.config.mappings.default_on_attach(bufnr)
                    -- Custom mappings with default split directions
                    vim.keymap.set("n", "<CR>", api.node.open.tab, opts("Open in new tab"))
                    vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open in vertical split to the right"))
                    vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open in horizontal split at the bottom"))
                end,
            }
        end,
    },
    { "neovim/nvim-lspconfig",   dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" } },
    { "williamboman/mason.nvim", config = function() require("mason").setup() end },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- For icons in the tabline
        config = function()
            require("bufferline").setup {
                options = {
                    mode = "tabs",            -- Display buffers as tabs
                    numbers = "none",         -- No numbers (optional: "ordinal" for buffer numbers)
                    diagnostics = "nvim_lsp", -- Show LSP diagnostics in tabs
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "center",
                        },
                    },
                },
            }
        end,
        keys = {
            { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Switch to buffer 1" },
            { "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "Switch to buffer 2" },
            { "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "Switch to buffer 3" },
            { "<leader><", "<cmd>BufferLineCyclePrev<CR>",    desc = "Previous buffer" },
            { "<leader>>", "<cmd>BufferLineCycleNext<CR>",    desc = "Next buffer" },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
        config = function()
            local cmp = require("cmp")
            cmp.setup {
                snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } }),
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Switch between buffers" },
            { "<leader>fo", "<cmd>Telescope oldfiles<CR>",   desc = "Switch to recent files" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "lua", "rust" },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end
    },
    { "nvim-treesitter/playground" },
    { "mbbill/undotree",           keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" } } },
    { "airblade/vim-gitgutter" },
    { "lervag/vimtex",             lazy = false },
    {
        "SirVer/ultisnips",
        config = function()
            vim.g.UltiSnipsExpandTrigger = "<tab>"
            vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
            vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
            vim.g.UltiSnipsSnippetDirectories = { "UltiSnips" }
        end
    },
    { "numToStr/Comment.nvim", config = function() require("Comment").setup() end },
}
