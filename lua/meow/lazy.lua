require("meow.config.keymaps")
require("meow.config.options")
-- require("meow.config.autocmds")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = { import = "meow.plugins" },
  defaults = { lazy = false },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
  },
  performance = {
    rtp = {
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "gzip",
        "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        "tutor",
        -- "zipPlugin",
      },
    },
  },
})

