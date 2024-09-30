return {
   "catppuccin/nvim",
   name = "catppuccin",
   priority = 1000,
   opts = {
      transparent_background = true,
      custom_highlights = function(colors)
         return {
            IncSearch = { fg = colors.text, bg = colors.overlay0 },
            LineNr = { fg = colors.overlay0 },
            CursorLineNr = { fg = colors.text, style = { "bold" } },
            PendingUpdates = { fg = colors.blue },
            NoiceMode = { fg = colors.blue },
         }
      end,
      integrations = {
         fidget = true,
         indent_blankline = {
            scope_color = "blue",
            -- colored_indent_levels = false,
         },
         lsp_trouble = true,
         mason = true,
         noice = true,
         notify = true,
         nvim_surround = true,
         which_key = true,
      },
   },
   config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
   end,
}
