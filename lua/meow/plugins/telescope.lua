return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
      { "benfowler/telescope-luasnip.nvim" },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope<CR>", desc = "Telescope" },
      { "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "find files" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "help" },
      { "<leader>fs", "<cmd>Telescope luasnip<CR>", desc = "luasnip" },
      { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "keymaps" },
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
