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

    {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
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
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    --     config = function()
    --         local cmp = require("cmp")
    --         cmp.setup {
    --             snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<C-Space>"] = cmp.mapping.complete(),
    --                 ["<C-e>"] = cmp.mapping.abort(),
    --                 ["<CR>"] = cmp.mapping.confirm({ select = true }),
    --             }),
    --             sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } }),
    --         }
    --     end,
    -- },
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
