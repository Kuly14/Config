-- ~/.config/nvim/lua/lsp.lua
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Capabilities for autocompletion
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
}

capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

-- Install LSP servers via Mason
mason_lspconfig.setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
    automatic_installation = true,
}

-- Setup LSP servers
mason_lspconfig.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = capabilities,
        }
    end,
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        }
    end,
    ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = { command = "clippy" },
                },
            },
        }
    end,
}

-- LSP keybindings
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts) -- Moved from settings.lua
        vim.keymap.set("n", "gs", vim.lsp.buf.implementation, opts)             -- Moved from settings.lua
        vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
        vim.keymap.set("n", "<leader>ch", vim.lsp.buf.incoming_calls, opts) -- Incoming calls
        vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, opts) -- Outgoing calls
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>le", function()
            vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) -- List only errors
            vim.cmd("botright copen")                                        -- Open quickfix window at the bottom
        end, opts)
    end,
})
