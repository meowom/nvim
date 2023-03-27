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
          local opts = { buffer = ev.buf, desc = '' }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'lsp declaration' })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'lsp definition' })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'lsp hover' })
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'lsp implementation' })
          --          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>wwa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = 'lsp add workspace folder' })
          vim.keymap.set('n', '<leader>wwr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = 'lsp remove workspave folder' })
          vim.keymap.set('n', '<leader>lwl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { buffer = ev.buf, desc = 'lsp list workspace folders' })
          vim.keymap.set('n', '<leader>ld', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = 'lsp type definition' })
          vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'lsp rename' })
          vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'lsp code action' })
          vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'lsp references' })
          vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
          end, { buffer = ev.buf, desc = 'lsp format' })
        end,
      })


      -- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
      -- print("hello world")
    end
  }
}
