return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      -- "nvim-treesitter/nvim-treesitter-textobjects",
      "andymass/vim-matchup",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        -- ensure_installed = {
        --   "c",
        --   "lua",
        --   "rust",
        --   "javascript",
        --   "vim",
        -- },
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = { enable = true, },

        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection = "gnn", -- set to `false` to disable one of the mappings
        --     node_incremental = "grn",
        --     scope_incremental = "grc",
        --     node_decremental = "grm",
        --   },
        -- },

        matchup = {
          enable = true,       -- mandatory, false will disable the whole extension
          -- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
          -- [options]
        },
      }
    end
  }
}
