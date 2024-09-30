return {
   "yioneko/nvim-cmp",
   branch = "perf",
   dependencies = {
      "FelipeLema/cmp-async-path",
      "folke/lazydev.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "lukas-reineke/cmp-under-comparator",
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
   },
   event = { "CmdlineEnter", "InsertEnter" },
   config = function()
      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      local context = require("cmp.config.context")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      local under_comparator = require("cmp-under-comparator").under
      cmp.setup({
         mapping = cmp.mapping.preset.insert({
            ["<C-e>"] = cmp.mapping.close(),
            ["<C-x>"] = cmp.mapping.abort(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<PageUp>"] = cmp.mapping.scroll_docs(-4),
            ["<PageDown>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-Tab>"] = cmp.mapping(function() -- toggle documentation window
               if cmp.visible_docs() then
                  cmp.close_docs()
               else
                  cmp.open_docs()
               end
            end, { "i", "s" }),
            ["<CR>"] = cmp.mapping.confirm {
               behavior = cmp.ConfirmBehavior.Insert,
               select = true,
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_next_item()
               elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
               else
                  fallback()
               end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_prev_item()
               elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
               else
                  fallback()
               end
            end, { "i", "s" }),
         }),
         preselect = cmp.PreselectMode.Item,
         completion = {
            completeopt = "menu,menuone,noselect",
         },
         formatting = {
            fields = { "abbr", "kind", "menu" },
            expandable_indicator = true,
            format = lspkind.cmp_format({
               mode = "symbol_text",
               menu = {
                  lazydev = "[Plugin]",
                  nvim_lsp = "[LSP]",
                  nvim_lua = "[Lua]",
                  luasnip = "[Snippet]",
                  async_path = "[Path]",
                  buffer = "[Buffer]",
               },
               max_width = 50,
               ellipsis_char = "…",
               show_labelDetails = true,
            }),
         },
         sources = {
            {
               name = "lazydev",
               group_index = 0,
            },
            {
               name = "nvim_lsp",
               entry_filter = function(entry, _)
                  return cmp.lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
               end,
               group_index = 1,
            },
            {
               name = "nvim_lua",
               group_index = 2,
            },
            {
               name = "luasnip",
               group_index = 3,
               keyword_length = 4,
            },
            {
               name = "async_path",
               group_index = 4,
               keyword_length = 4,
            },
            {
               name = "buffer",
               group_index = 5,
               keyword_length = 6,
            },
            {
               name = "nvim_lsp_signature_help",
               group_index = 6,
            }
         },
         sorting = {
            priority_weight = 2,
            comparators = {
               compare.offset,
               compare.exact,
               -- compare.scopes,
               compare.score,
               under_comparator,
               compare.recently_used,
               compare.locality,
               compare.kind,
               -- compare.sort_text,
               compare.length,
               compare.order,
            },
         },
         snippet = {
            expand = function(args)
               luasnip.lsp_expand(args.body)
            end,
         },
         view = {
            docs = { auto_open = true },
            entries = {
               selection_order = "top_down",
               follow_cursor = true,
               name = "custom",
               separator = nil,
            },
         },
         window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
         },
         matching = {
            disallow_fuzzy_matching = true,     -- default: false
            disallow_fullfuzzy_matching = true, -- default: false
            disallow_partial_fuzzy_matching = true,
            disallow_partial_matching = false,
            disallow_prefix_unmatching = true, -- default: false
            disallow_symbol_nonprefix_matching = true,
         },
         performance = {
            debounce = 0, -- default: 60
            throttle = 0, -- default: 30
            fetching_timeout = 500,
            confirm_resolve_timeout = 80,
            async_budget = 1,
            max_view_entries = 200,
         },
         enabled = function() -- disable in comments
            if vim.api.nvim_get_mode().mode == "c" then
               return true
            else
               return not context.in_treesitter_capture("comment")
                   and not context.in_syntax_group("Comment")
            end
         end,
      })
      cmp.setup.cmdline({ "/", "?" }, {
         mapping = cmp.mapping.preset.cmdline(),
         sources = { { name = "buffer" } },
      })
      cmp.setup.cmdline(":", {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = "cmdline",   option = { ignore_cmds = { "Man", "!" } } },
            { name = "async_path" },
         },
         enabled = function()
            -- disable completion for specific commands (IncRename)
            local disabled = { IncRename = true }
            local cmd = vim.fn.getcmdline():match("%S+")
            return not disabled[cmd] or cmp.close()
         end,
      })
   end,
}
