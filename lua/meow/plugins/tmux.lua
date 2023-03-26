return {
  -- the colorscheme should be available when starting Neovim
  {
    "aserowy/tmux.nvim",
    keys = {
      { "<C-h>", "<cmd>lua require('tmux').move_left()<cr>" },
      { "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>" },
      { "<C-k>", "<cmd>lua require('tmux').move_top()<cr>" },
      { "<C-l>", "<cmd>lua require('tmux').move_right()<cr>" },
      { "<A-h>", "<cmd>lua require('tmux').resize_left()<cr>" },
      { "<A-j>", "<cmd>lua require('tmux').resize_bottom()<cr>" },
      { "<A-k>", "<cmd>lua require('tmux').resize_top()<cr>" },
      { "<A-l>", "<cmd>lua require('tmux').resize_right()<cr>" },
    },
    config = function()
      return require("tmux").setup({
        copy_sync = {
          enable = false,
        },
        navigation = {
          -- cycles to opposite pane while navigating into the border
          cycle_navigation = true,
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = false,
          -- prevents unzoom tmux when navigating beyond vim border
          persist_zoom = false,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = false,
          -- sets resize steps for x axis
          resize_step_x = 1,
          -- sets resize steps for y axis
          resize_step_y = 1,
        }
      })
    end
  },
}
