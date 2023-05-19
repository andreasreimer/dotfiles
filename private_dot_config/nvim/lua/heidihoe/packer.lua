-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    -- use({
    -- 'rose-pine/neovim',
    -- as = 'rose-pine',
    -- config = function()
    -- vim.cmd('colorscheme rose-pine')
    -- end
    -- })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')

    use('tpope/vim-fugitive')
    use('tpope/vim-sensible')
    use('tpope/vim-commentary')
    use('tpope/vim-surround')
    use('tpope/vim-abolish')

    use('jalvesaq/Nvim-R')
    use('jalvesaq/cmp-nvim-r')
    use('jalvesaq/vimcmdline')
    use('ron89/thesaurus_query.vim')

    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')

    use('ThePrimeagen/vim-be-good')
    use('kshenoy/vim-signature')
    use('chrisbra/csv.vim')

    use('dracula/vim')

    -- use {'zbirenbaum/copilot.lua'}
    -- -- use {
    -- --     "zbirenbaum/copilot-cmp",
    -- --     after = { "copilot.lua" },
    -- --     config = function ()
    -- --         require("copilot_cmp").setup()
    -- --     end
    -- -- }

    use { 'onsails/lspkind-nvim' }
    use { 'dhruvasagar/vim-table-mode' }



    -- use('neoclide/coc.nvim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }



    -- Markdown
    use {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
        cmd = { "MarkdownPreview" },
        requires = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
    }

    -- ChatGPT
    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                -- optional configuration
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

-- firenvim test 
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
    use 'eandrju/cellular-automaton.nvim'

    -- Obsidian Plugin
    use 'epwalsh/obsidian.nvim'



    -- all stuff should be before this end of function.
end)
