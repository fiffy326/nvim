return {
   "lukas-reineke/indent-blankline.nvim",
   main = "ibl",
   opts = function()
      local highlight = {
         "RainbowDelimiterRed",
         "RainbowDelimiterYellow",
         "RainbowDelimiterBlue",
         "RainbowDelimiterOrange",
         "RainbowDelimiterGreen",
         "RainbowDelimiterViolet",
         "RainbowDelimiterCyan",
      }
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

      return {
         viewport_buffer = {
            min = 0, -- default: 30
         },
         scope = {
            show_start = false,
            show_end = false,
            highlight = highlight,
            include = {
               node_type = {
                  lua = { "return_statement", "table_constructor" }
               }
            },
         },
      }
   end,
}
