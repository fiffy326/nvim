return {
   "williamboman/mason.nvim",
   opts = {
      max_concurrent_installers = 10,
      ui = {
         border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
         icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
         },
      },
   },
}
