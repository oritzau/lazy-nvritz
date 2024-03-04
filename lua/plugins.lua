return {

	-- colorscheme
	{
        "morhetz/gruvbox",
        priority = 1000
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}
	},

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {}
    },

    -- bufferline
    {
        "akinsho/bufferline.nvim", 
        config = true,
        version = "*", 
        dependencies = "nvim-tree/nvim-web-devicons"
    },

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup{}
		end,
	},

	-- surround
	{"tpope/vim-surround"},

	-- repeat (for surround)
	{"tpope/vim-repeat"},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensured_installed = {"c", "rust", "python", "haskell", "lua", "vim", "vimdoc", "javascript"},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},

    -- lsp-zero
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    -- autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                mapping = {
                    ["<CR>"] = cmp.mapping.confirm({select=false}),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item()
                }
            })
        end
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = {"LspInfo", "LspInstall", "LspStart"},
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp"},
            {"williamboman/mason-lspconfig.nvim"},
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "rust_analyzer",
                    "jedi_language_server",
                    "jdtls",
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
                }
            })
        end
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- vimtex
    {
        "lervag/vimtex",
        lazy = false,
    },

	-- markdown-preview
	{
	  "iamcco/markdown-preview.nvim",
	  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	  build = "cd app && yarn install",
	  init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	  end,
	  ft = { "markdown" },
	},
}
