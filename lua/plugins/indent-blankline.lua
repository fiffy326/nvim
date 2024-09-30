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
         -- enabled = true,
         -- debounce = 200,
         viewport_buffer = {
            min = 0, -- default: 30
         },
         indent = {
            -- char = "▎",
            -- highlight = "IblIndent",
            -- smart_indent_cap = true,
            -- priority = 1,
            -- repeat_linebreak = true,
         },
         whitespace = {
            -- highlight = "IblWhitespace",
            -- remove_blankline_trail = true,
         },
         scope = {
            -- enabled = true,
            -- char = ibl.config.indent.char,
            show_start = false, -- default: true
            show_end = false, -- default: true
            -- show_exact_scope = false,
            -- injected_languages = true,
            highlight = highlight,
            -- priority = 1024,
            include = {
               node_type = {
                  ["*"] = { "*" },
               }
            },
            -- exclude = {},
            -- exclude = {
            --    filetypes = {
            --       "lspinfo",
            --       "packer",
            --       "checkhealth",
            --       "help",
            --       "man",
            --       "gitcommit",
            --       "TelescopePrompt",
            --       "TelescopeResults",
            --       "",
            --    },
            --    buftypes = {
            --       "terminal",
            --       "nofile",
            --       "quickfix",
            --       "prompt",
            --    },
            -- },
         },
      }
   end,
}
