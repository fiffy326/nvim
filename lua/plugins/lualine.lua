return {
   "nvim-lualine/lualine.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = {
      options = {
         icons_enabled = true,
         theme = "auto",
         component_separators = { left = "", right = "" },
         section_separators = { left = "", right = "" },
         disabled_filetypes = {
            statusline = { "alpha" },
            winbar = {},
         },
         ignore_focus = {},
         always_divide_middle = true,
         globalstatus = false,
         refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
         },
      },
      sections = {
         lualine_a = { "mode" },
         lualine_b = { "branch", "diff", "diagnostics" },
         lualine_c = { "filename" },
         lualine_x = {
            {
               require("lazy.status").updates,
               cond = require("lazy.status").has_updates,
               color = "PendingUpdates",
            },
            {
               require("noice").api.statusline.mode.get,
               cond = require("noice").api.statusline.mode.has,
               color = "NoiceMode"
            },
         },
         lualine_y = { "progress" },
         lualine_z = { "location" },
      },
      inactive_sections = {
         lualine_a = {},
         lualine_b = {},
         lualine_c = { "filename" },
         lualine_x = { "location" },
         lualine_y = {},
         lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "lazy", "man", "mason", "nvim-dap-ui", "trouble" },
   },
}
