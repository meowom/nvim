return {
  {
    "williamboman/mason.nvim",
    -- cmd = "Mason",
    dependencies = {
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end
  },

  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   config = function()
  --     require("mason-lspconfig").setup()
  --   end
  -- },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Setup language servers.
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}
      -- Server-specific settings. See `:help lspconfig-setup`


      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      -- vim.keymap.set('n', '<leader>fd', vim.diagnostic.open_float)
      -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf, desc = 'hello world' }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          --          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>wwa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wwr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<leader>lwl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<leader>ld', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })


      -- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
      -- print("hello world")
    end
  }
}
