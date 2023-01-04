local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "dockerfile",
        "go",
        "html",
        "json",
        "julia",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "rst",
        "terraform",
        "toml",
        "yaml",
    }, -- list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },

    -- TS rainbow parenthesis
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
})
