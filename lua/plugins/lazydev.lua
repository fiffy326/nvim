return {
   "folke/lazydev.nvim",
   dependencies = { "Bilal2453/luvit-meta" },
   ft = "lua",
   opts = {
      library = {
         { path = "luvit-meta/library", word = { "vim%.uv" } },
         vim.fn.stdpath("config") .. "/lua/utils",
      },
   },
}
