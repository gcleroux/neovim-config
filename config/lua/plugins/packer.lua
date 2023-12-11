local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use("wbthomason/packer.nvim")    -- Have packer manage itself

    use("nvim-lua/popup.nvim")       -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim")     -- Useful lua functions used by lots of plugins
    use("windwp/nvim-autopairs")     -- Make pairs of brackets, parentheses, etc. automatically
    use("kyazdani42/nvim-web-devicons") -- Nice dev icons used by many plugins
    use("akinsho/bufferline.nvim")   -- Lua bufferline
    use("moll/vim-bbye")             -- Closing windows without messing up the layout

    -- Tree-sitter
    use({
        "nvim-treesitter/nvim-treesitter", -- Neovim LSP server
        run = ":TSUpdate",
    })

    use("p00f/nvim-ts-rainbow")

    -- Docstrings generator
    use({
        "danymat/neogen", -- Generate docstrings
        requires = { "nvim-treesitter/nvim-treesitter" },
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "stable"
    })

    -- Color schemes
    use("navarasu/onedark.nvim") -- Atom OneDark theme
    use("EdenEast/nightfox.nvim") -- Nightfox theme
    use("rmehri01/onenord.nvim")

    -- Git plugins
    use("lewis6991/gitsigns.nvim") -- Git annotations in the gutter
    use("kdheepak/lazygit.nvim") -- LazyGit neovim integration

    -- Using sudo from user session
    use("lambdalisue/suda.vim") -- Open/write files as root

    -- snippets
    use({
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets" },
    })
    use("rafamadriz/friendly-snippets")

    -- cmp plugins
    use("hrsh7th/nvim-cmp")  -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path")  -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("hrsh7th/cmp-nvim-lsp") -- LSP completions
    use("hrsh7th/cmp-emoji") -- Emoji completions
    use("saadparwaiz1/cmp_luasnip")
    use({
        "rcarriga/cmp-dap",
        requires = {
            { "hrsh7th/nvim-cmp" },
            { "mfussenegger/nvim-dap" },
            { "rcarriga/nvim-dap-ui" },
        },
    })
    use("zbirenbaum/copilot.lua")
    use({
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    })
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    })

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
    })
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    use("neovim/nvim-lspconfig")        -- enable LSP
    use("b0o/schemastore.nvim")         -- jsonls schemas for LSP server

    -- Debugger
    use("mfussenegger/nvim-dap")
    use({
        -- TODO: Configure dapui at some point
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup()
        end,
    })
    use({
        "theHamsta/nvim-dap-virtual-text",
        requires = { "mfussenegger/nvim-dap" },
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    })
    -- use("leoluz/nvim-dap-go")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-media-files.nvim" },
        },
    })
    use({
        "AckslD/nvim-neoclip.lua",
        requires = {
            { "nvim-telescope/telescope.nvim" },
        },
    })

    -- Terminal
    use("numToStr/FTerm.nvim")
    use({
        "aserowy/tmux.nvim",
        config = function()
            return require("tmux").setup()
        end,
    })

    -- CSV highlighting
    use("mechatroner/rainbow_csv")

    -- Lua line
    use({
        "nvim-lualine/lualine.nvim", -- Keeps open files in top menu bar
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use("luukvbaal/nnn.nvim")

    -- Nvim surroung for easier bracket management
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- Comments plugin to allow vscode like line commenting
    use("numToStr/Comment.nvim")

    use("yamatsum/nvim-cursorline")
    use({
        "folke/flash.nvim",
        config = function()
            require("flash").setup()
        end,
    })
    use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
    use({
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("octo").setup()
        end,
    })
    use({
        "rawnly/gist.nvim",
        config = function()
            require("gist").setup()
        end,
        -- `GistsList` opens the selected gif in a terminal buffer,
        -- this plugin uses neovim remote rpc functionality to open the gist in an actual buffer and not have buffer inception
        requires = {
            "samjwill/nvim-unception",
            setup = function()
                vim.g.unception_block_while_host_edits = true
            end,
        },
    })

    -- Using nixOS vimPlugins instead
    -- use({
    --     "iamcco/markdown-preview.nvim", -- Preview markdown files in web browser
    --     run = "cd app && npm install",
    --     setup = function()
    --         vim.g.mkdp_filetypes = { "markdown" }
    --         vim.g.mkdp_browser = { "/home/guillaume/.nix-profile/bin/chromium-browser" }
    --     end,
    --     ft = { "markdown" },
    --     -- run = function()
    --     --     vim.fn["mkdp#util#install"]()
    --     -- end,
    -- })
    use({
        "jghauser/follow-md-links.nvim",
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
