local LSP = {}

LSP.servers = {
    "bashls",
    "clangd",
    "dockerls",
    "docker_compose_language_service",
    "gopls",
    "html",
    "jedi_language_server",
    "jsonls",
    "marksman",
    "nil_ls",
    "lua_ls",
    "taplo",
    "yamlls",
}

-- Specific LSP settings (key must be LSP server name)
-- ===================================================

-- Lua settings
LSP.lua_ls = {
    Lua = {
        format = {
            enable = true,
            defaultConfig = {
                indent_style = "space",
                indent_size = "4",
            },
        },
        diagnostics = {
            globals = { "vim" },
        },
        workspace = {
            library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
            },
        },
        telemetry = {
            enable = false,
        },
    },
}

-- JSON settings
LSP.jsonls = {
    json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
    },
}

-- YAML settings
LSP.yamlls = {
    yaml = {
        schemas = {
            ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
    },
}

return LSP
