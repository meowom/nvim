return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
      { "benfowler/telescope-luasnip.nvim" },
    },
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      -- { "<leader>/", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>",               desc = "Command History" },
      -- find
      {
        "<leader><space>",
        "<cmd>Telescope find_files<cr>",
        desc =
        "Find Files (root dir)"
      },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc =
        "Find Files (root dir)"
      },
      {
        "<leader>fF",
        ":lua require('telescope.builtin').find_files({cwd = '%:h'})<cr>",
        desc = "Find Files (cwd)"
      },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "Recent" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>",               desc = "Diagnostics" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>",                 desc = "Grep (root dir)" },
      {
        "<leader>sG",
        ":lua require('telescope.builtin').live_grep({cwd = '%:h'})<cr>",
        desc = "Grep (cwd)"
      },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",            desc = "Help Pages" },
      {
        "<leader>sH",
        "<cmd>Telescope highlights<cr>",
        desc =
        "Search Highlight Groups"
      },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",              desc = "Key Maps" },
      { "<leader>sl", "<cmd>Telescope luasnip<CR>",              desc = "luasnip" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",            desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>",                desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>",          desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>",               desc = "Resume" },
      { "<leader>sw", "<cmd>Telescope grep_string<cr>",          desc = "Word (root dir)" },
      {
        "<leader>sW",
        ":lua require('telescope.builtin').grep_string({cwd = '%:h'})<cr>",
        desc = "Word (cwd)"
      },
      { "<leader>ss", "<cmd>Telescope lsp_documention_symbols<cr>", desc = "Workspace Symbols (root dir)" },
      { "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols (root dir)" },
      -- Goto
      { "<leader>gr", "<cmd>Telescope lsp_references<CR>",       desc = "keymaps" },
      { "<leader>gd", "<cmd>Telescope lsp_definitions<CR>",      desc = "Goto Definition" },
      { "<leader>gI", "<cmd>Telescope lsp_implementations<CR>",  desc = "Goto Implementaion" },
      { "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Goto Type Definition" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          prompt_prefix = "> ",
          selection_caret = "> ",
          entry_prefix = "  ",
          multi_icon = "<>",
          -- path_display = "truncate",

          winblend = 0,
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.95,
            height = 0.85,
            -- preview_cutoff = 120,
            prompt_position = "top",
            horizontal = {
              preview_width = function(_, cols, _)
                if cols > 200 then
                  return math.floor(cols * 0.4)
                else
                  return math.floor(cols * 0.6)
                end
              end,
            },
            vertical = {
              width = 0.9,
              height = 0.95,
              preview_height = 0.5,
            },
            flex = {
              horizontal = {
                preview_width = 0.9,
              },
            },
          }
        }
      }
      telescope.load_extension('fzf')
      telescope.load_extension('luasnip')
    end,
  },

}
