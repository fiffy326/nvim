return {
   "mikavilpas/yazi.nvim",
   dependencies = { "nvim-lua/plenary.nvim" },
   event = "VeryLazy",
   cmd = "Yazi",
   keys = {
      { "<Leader>y", "<Cmd>Yazi toggle<CR>", desc = "Yazi" },
   },
   opts = { open_for_directories = true },
}
