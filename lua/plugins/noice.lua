return {
   "folke/noice.nvim",
   dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
   },
   event = "VeryLazy",
   opts = {
      lsp = {
         override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
         },
      },
      presets = {
         bottom_search = true,
         command_palette = true,
         long_message_to_split = true,
         inc_rename = false,
         lsp_doc_border = true,
      },
      routes = {
         {
            filter = {
               event = "msg_show",
               kind = "",
               find = "written",
            },
            opts = { skip = true },
         },
         {
            filter = {
               event = "msg_show",
               kind = "",
               find = "indented",
            },
            opts = { skip = true },
         },
         {
            filter = {
               event = "msg_show",
               kind = "",
               find = "change",
            },
            opts = { skip = true },
         },
         {
            filter = {
               event = "msg_show",
               kind = "",
               find = "fewer",
            },
            opts = { skip = true },
         },
         {
            filter = {
               event = "msg_show",
               kind = "",
               find = "more",
            },
            opts = { skip = true },
         },
         {
            filter = {
               event = "msg_show",
               kind = "",
               find = "yanked",
            },
            opts = { skip = true },
         }
      },
   },
}
