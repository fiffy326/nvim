local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(path) then
   local repo = "https://github.com/folke/lazy.nvim.git"
   vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, path })
end
vim.opt.rtp:prepend(path)

require("lazy").setup({
   spec = { import = "plugins" },
   install = { colorscheme = { "catppuccin", "default" } },
   change_detection = { notify = false },
   checker = { enabled = true, notify = false },
   lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
   ui = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      icons = {
         ft = "",
         lazy = "󰂠 ",
         loaded = "",
         not_loaded = "",
      },
   },
   performance = {
      rtp = {
         disabled_plugins = {
            "gzip",
            -- "matchit",
            -- "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
         },
      },
   },
})
