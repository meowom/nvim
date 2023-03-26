return {
  -- theme
  {
    "sainnhe/everforest",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.opt.termguicolors = true
      vim.g.everforest_background = "hard"
      vim.g.everforest_disable_italic_comment = true
      vim.cmd.colorscheme("everforest")
    end
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = function()
      return {
        sections = {
          lualine_a = {'branch', 'diff', 'diagnostics'},
          lualine_b = {'filename'},
          lualine_c = {},
          lualine_x = {'progress'},
          lualine_y = {'location'},
          lualine_z = {},
        }
      }
    end
  },

  -- windows
  {
    enabled = false,
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
      vim.keymap.set({'n','i'},'<C-w>z','<Cmd>WindowsMaximize<CR>')
    end
  }
}
