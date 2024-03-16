return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'craftzdog/solarized-osaka.nvim'
    use({
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd('colorscheme tokyonight')
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
        end
    })
    use 'folke/which-key.nvim'
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'christoomey/vim-tmux-navigator'
    use 'tpope/vim-commentary'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'
    use 'psf/black'
    use 'nvim-tree/nvim-tree.lua'
    use 'tpope/vim-sleuth'
    use 'nvim-tree/nvim-web-devicons'
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'lewis6991/gitsigns.nvim'
    use 'folke/todo-comments.nvim'
    use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
        }
    }
    use 'stevearc/conform.nvim'
end)
