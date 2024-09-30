return {
   "nvim-telescope/telescope.nvim",
   branch = "0.1.x",
   dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   },
   cmd = "Telescope",
   keys = {
      { "<Leader>Fs", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search buffer" },
      { "<Leader>FS", "<Cmd>Telescope live_grep<CR>",                 desc = "Search directory" },
      { "<Leader>ff", "<Cmd>Telescope find_files<CR>",                desc = "Directory files" },
      { "<Leader>fr", "<Cmd>Telescope oldfiles<CR>",                  desc = "Recent files" },
      { "<Leader>fb", "<Cmd>Telescope buffers<CR>",                   desc = "Buffers" },
      { "<Leader>fh", "<Cmd>Telescope help_tags<CR>",                 desc = "Help tags" },
      { "<Leader>fm", "<Cmd>Telescope man_pages<CR>",                 desc = "Man pages" },
      { "<Leader>fp", "<Cmd>Telescope pickers<CR>",                   desc = "Pickers" },
      { "<Leader>fk", "<Cmd>Telescope keymaps<CR>",                   desc = "Keymaps" },
   },
   opts = {
      defaults = {
         vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
         },
      },
   },
   config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
   end,
}
