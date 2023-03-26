return {
  {
    'echasnovski/mini.splitjoin',
    version = false,
    event = 'VeryLazy',
    config = function()
      require("mini.splitjoin").setup(
      -- No need to copy this inside `setup()`. Will be used automatically.
        {
          -- Module mappings. Use `''` (empty string) to disable one.
          -- Created for both Normal and Visual modes.
          mappings = { toggle = 'gS', split = '', join = '', },
          -- Detection options: where split/join should be done
          detect = {
            -- Array of Lua patterns to detect region with arguments.
            -- Default: { '%b()', '%b[]', '%b{}' }
            brackets = nil,
            -- String Lua pattern defining argument separator
            separator = ',',
            -- Array of Lua patterns for sub-regions to exclude separators from.
            -- Enables correct detection in presence of nested brackets and quotes.
            -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
            exclude_regions = nil,
          },
          -- Split options
          split = {
            hooks_pre = {},
            hooks_post = {},
          },
          -- Join options
          join = {
            hooks_pre = {},
            hooks_post = {},
          },
        }
      )
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    "L3MON4D3/LuaSnip",
    event = 'VeryLazy',
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function()
      -- require("luasnip.loaders.from_vscode").lazy_load()
      vim.cmd('source ~/.config/nvim/lua/meow/config/luasnip-keymap.vim')
    end
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup(
        {
          ---Add a space b/w comment and the line
          padding = true,
          ---Whether the cursor should stay at its position
          sticky = true,
          ---Lines to be ignored while (un)comment
          ignore = nil,
          ---LHS of toggle mappings in NORMAL mode
          toggler = {
            ---Line-comment toggle keymap
            line = 'gcc',
            ---Block-comment toggle keymap
            block = 'gbc',
          },
          ---LHS of operator-pending mappings in NORMAL and VISUAL mode
          opleader = {
            ---Line-comment keymap
            line = 'gc',
            ---Block-comment keymap
            block = 'gb',
          },
          ---LHS of extra mappings
          extra = {
            ---Add comment on the line above
            above = 'gcO',
            ---Add comment on the line below
            below = 'gco',
            ---Add comment at the end of line
            eol = 'gcA',
          },
          ---Enable keybindings
          ---NOTE: If given `false` then the plugin won't create any mappings
          mappings = {
            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
            basic = true,
            ---Extra mapping; `gco`, `gcO`, `gcA`
            extra = true,
          },
          ---Function to call before (un)comment
          pre_hook = nil,
          ---Function to call after (un)comment
          post_hook = nil,
        }
      )
    end
  }


  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     local null_ls = require("null-ls")
  --
  --     null_ls.setup({
  --       sources = {
  --         null_ls.builtins.completion.luasnip,
  --       },
  --     })
  --   end
  -- }
  --
  --
  --
  -- {
  --   enabled = true,
  --   'echasnovski/mini.ai',
  --   version = false,
  --   event = 'VeryLazy',
  --   config = function()
  --     require("mini.ai").setup(
  --     -- No need to copy this inside `setup()`. Will be used automatically.
  --       {
  --         -- Table with textobject id as fields, textobject specification as values.
  --         -- Also use this to disable builtin textobjects. See |MiniAi.config|.
  --         custom_textobjects = nil,
  --         -- Module mappings. Use `''` (empty string) to disable one.
  --         mappings = {
  --           -- Main textobject prefixes
  --           around = 'a',
  --           inside = 'i',
  --           -- Next/last variants
  --           around_next = 'an',
  --           inside_next = 'in',
  --           around_last = 'al',
  --           inside_last = 'il',
  --           -- Move cursor to corresponding edge of `a` textobject
  --           goto_left = 'g[',
  --           goto_right = 'g]',
  --         },
  --         -- Number of lines within which textobject is searched
  --         n_lines = 50,
  --         -- How to search for object (first inside current line, then inside
  --         -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
  --         -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
  --         search_method = 'cover_or_next',
  --       }
  --     )
  --   end
  -- },

  -- {
  --   'echasnovski/mini.comment',
  --   event = 'VeryLazy',
  --   config = function()
  --     require("mini.comment").setup(
  --     -- No need to copy this inside `setup()`. Will be used automatically.
  --       {
  --         -- Options which control module behavior
  --         options = {
  --           -- Whether to ignore blank lines when adding comment
  --           ignore_blank_line = false,
  --           -- Whether to recognize as comment only lines without indent
  --           start_of_line = false,
  --           -- Whether to ensure single space pad for comment parts
  --           pad_comment_parts = true,
  --         },
  --         -- Module mappings. Use `''` (empty string) to disable one.
  --         mappings = {
  --           -- Toggle comment (like `gcip` - comment inner paragraph) for both
  --           -- Normal and Visual modes
  --           comment = 'gc',
  --           -- Toggle comment on current line
  --           comment_line = 'gcc',
  --           -- Define 'comment' textobject (like `dgc` - delete whole comment block)
  --           textobject = 'gc',
  --         },
  --         -- Hook functions to be executed at certain stage of commenting
  --         hooks = {
  --           -- Before successful commenting. Does nothing by default.
  --           pre = function()
  --           end,
  --           -- After successful commenting. Does nothing by default.
  --           post = function()
  --           end,
  --         },
  --       }
  --     )
  --   end
  -- },

  -- {
  --   'echasnovski/mini.surround',
  --   event = 'VeryLazy',
  --   config = function()
  --     require('mini.surround').setup(
  --     -- No need to copy this inside `setup()`. Will be used automatically.
  --       {
  --         -- Add custom surroundings to be used on top of builtin ones. For more
  --         -- information with examples, see `:h MiniSurround.config`.
  --         custom_surroundings = nil,
  --         -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  --         highlight_duration = 3000,
  --         -- Module mappings. Use `''` (empty string) to disable one.
  --         mappings = {
  --           add = 'sa',            -- Add surrounding in Normal and Visual modes
  --           delete = 'sd',         -- Delete surrounding
  --           find = 'sf',           -- Find surrounding (to the right)
  --           find_left = 'sF',      -- Find surrounding (to the left)
  --           highlight = 'sh',      -- Highlight surrounding
  --           replace = 'sr',        -- Replace surrounding
  --           update_n_lines = 'sn', -- Update `n_lines`
  --           suffix_last = 'l',     -- Suffix to search with "prev" method
  --           suffix_next = 'n',     -- Suffix to search with "next" method
  --         },
  --         -- Number of lines within which surrounding is searched
  --         n_lines = 20,
  --         -- Whether to respect selection type:
  --         -- - Place surroundings on separate lines in linewise mode.
  --         -- - Place surroundings on each line in blockwise mode.
  --         respect_selection_type = false,
  --         -- How to search for surrounding (first inside current line, then inside
  --         -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
  --         -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
  --         -- see `:h MiniSurround.config`.
  --         search_method = 'cover',
  --       }
  --
  --     )
  --   end
  -- },

  -- {
  --   'echasnovski/mini.completion',
  --   config = function()
  --     require("mini.completion").setup(
  --     -- No need to copy this inside `setup()`. Will be used automatically.
  --       {
  --         -- Delay (debounce type, in ms) between certain Neovim event and action.
  --         -- This can be used to (virtually) disable certain automatic actions by
  --         -- setting very high delay time (like 10^7).
  --         delay = { completion = 300, info = 100, signature = 50 },
  --         -- Configuration for action windows:
  --         -- - `height` and `width` are maximum dimensions.
  --         -- - `border` defines border (as in `nvim_open_win()`).
  --         window = {
  --           info = { height = 25, width = 80, border = 'none' },
  --           signature = { height = 25, width = 80, border = 'none' },
  --         },
  --         -- Way of how module does LSP completion
  --         lsp_completion = {
  --           -- `source_func` should be one of 'completefunc' or 'omnifunc'.
  --           source_func = 'omnifunc',
  --           -- `auto_setup` should be boolean indicating if LSP completion is set up
  --           -- on every `BufEnter` event.
  --           auto_setup = true,
  --           -- `process_items` should be a function which takes LSP
  --           -- 'textDocument/completion' response items and word to complete. Its
  --           -- output should be a table of the same nature as input items. The most
  --           -- common use-cases are custom filtering and sorting. You can use
  --           -- default `process_items` as `MiniCompletion.default_process_items()`.
  --           -- process_items = --<function: filters out snippets; sorts by LSP specs>,
  --         },
  --         -- Fallback action. It will always be run in Insert mode. To use Neovim's
  --         -- built-in completion (see `:h ins-completion`), supply its mapping as
  --         -- string. Example: to use 'whole lines' completion, supply '<C-x><C-l>'.
  --         -- fallback_action = --<function: like `<C-n>` completion>,
  --
  --         -- Module mappings. Use `''` (empty string) to disable one. Some of them
  --         -- might conflict with system mappings.
  --         mappings = {
  --           force_twostep = '<C-a>',  -- Force two-step completion
  --           force_fallback = '<A-a>', -- Force fallback completion
  --         },
  --         -- Whether to set Vim's settings for better experience (modifies
  --         -- `shortmess` and `completeopt`)
  --         set_vim_settings = true,
  --       }
  --     )
  --     vim.g.minicompletion_disable = true
  --   end
  -- },


  -- {
  --   'echasnovski/mini.indentscope',
  --   event = 'VeryLazy',
  --   config = function()
  --     require("mini.indentscope").setup(
  --     -- No need to copy this inside `setup()`. Will be used automaticindentscope
  --       {
  --         -- Draw options
  --         draw = {
  --           -- Delay (in ms) between event and start of drawing scope indicator
  --           delay = 100,
  --           -- Animation rule for scope's first drawing. A function which, given
  --           -- next and total step numbers, returns wait time (in ms). See
  --           -- |MiniIndentscope.gen_animation| for builtin options. To disable
  --           -- animation, use `require('mini.indentscope').gen_animation.none()`.
  --           -- animation = --<function: implements constant 20ms between steps>,
  --
  --           -- Symbol priority. Increase to display on top of more symbols.
  --           priority = 2,
  --         },
  --         -- Module mappings. Use `''` (empty string) to disable one.
  --         mappings = {
  --           -- Textobjects
  --           object_scope = 'ii',
  --           object_scope_with_border = 'ai',
  --           -- Motions (jump to respective border line; if not present - body line)
  --           goto_top = '[i',
  --           goto_bottom = ']i',
  --         },
  --         -- Options which control scope computation
  --         options = {
  --           -- Type of scope's border: which line(s) with smaller indent to
  --           -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
  --           border = 'both',
  --           -- Whether to use cursor column when computing reference indent.
  --           -- Useful to see incremental scopes with horizontal cursor movements.
  --           indent_at_cursor = true,
  --           -- Whether to first check input line to be a border of adjacent scope.
  --           -- Use it if you want to place cursor on function header to get scope of
  --           -- its body.
  --           try_as_border = false,
  --         },
  --         -- Which character to use for drawing scope indicator
  --         symbol = '╎',
  --       }
  --     )
  --     vim.g.miniindentscope_disable = true
  --   end
  -- },
}
