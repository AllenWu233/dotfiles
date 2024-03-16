local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
    "lua_ls",
    "pyright",
    "clangd",
    "bashls",
    "rust_analyzer",
    "jdtls",
}

local settings = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

local handlers = {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities
        }
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- ["rust_analyzer"] = function ()
    --    -- require("rust-tools").setup {}
    -- end,
    ["lua_ls"] = function ()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
}

require("mason").setup(settings)

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
    handlers = handlers
})

