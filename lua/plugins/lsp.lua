local keymaps = {
   {
      mode = "n",
      lhs = "gl",
      rhs = function() vim.diagnostic.open_float() end,
      desc = "Open diagnostics menu",
      capability = "textDocument/diagnostic",
   },
   {
      mode = "n",
      lhs = "]d",
      rhs = function() vim.diagnostic.goto_next() end,
      desc = "Go to next diagnostic",
      capability = "textDocument/diagnostic",
   },
   {
      mode = "n",
      lhs = "[d",
      rhs = function() vim.diagnostic.goto_prev() end,
      desc = "Go to previous diagnostic",
      capability = "textDocument/diagnostic",
   },
   {
      mode = "n",
      lhs = "<C-k>",
      rhs = function() vim.lsp.buf.hover() end,
      desc = "Show hover information",
      capability = "textDocument/hover",
   },
   {
      mode = "n",
      lhs = "gs",
      rhs = function() vim.lsp.buf.signature_help() end,
      desc = "Show signature information",
      capability = "textDocument/signatureHelp",
   },
   {
      mode = "n",
      lhs = "gd",
      rhs = function() vim.lsp.buf.declaration() end,
      desc = "Go to declaration",
      capability = "textDocument/declaration",
   },
   {
      mode = "n",
      lhs = "gD",
      rhs = function() vim.lsp.buf.definition() end,
      desc = "Go to definition",
      capability = "textDocument/definition",
   },
   {
      mode = "n",
      lhs = "go",
      rhs = function() vim.lsp.buf.type_definition() end,
      desc = "Go to type definition",
      capability = "textDocument/typeDefinition",
   },
   {
      mode = "n",
      lhs = "gi",
      rhs = function() vim.lsp.buf.implementation() end,
      desc = "Show implementations",
      capability = "textDocument/implementation",
   },
   {
      mode = "n",
      lhs = "gr",
      rhs = function() vim.lsp.buf.references() end,
      desc = "Show references",
      capability = "textDocument/references",
   },
   {
      mode = "n",
      lhs = "<F4>",
      rhs = function() vim.lsp.buf.code_action() end,
      desc = "Show code action",
      capability = "textDocument/codeAction",
   },
   {
      mode = { "n", "x" },
      lhs = "<F3>",
      rhs = function() vim.lsp.buf.format({ async = true }) end,
      desc = "Format buffer",
      capability = "textDocument/formatting",
   },
   {
      mode = "n",
      lhs = "<F2>",
      rhs = function() vim.lsp.buf.rename() end,
      desc = "Rename",
      capability = "textDocument/rename",
   },
}

return {
   "williamboman/mason-lspconfig.nvim",
   dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
   },
   opts = function()
      return {
         handlers = {
            function(lsp)
               require("lspconfig")[lsp].setup({
                  capabilities = require("cmp_nvim_lsp").default_capabilities(),
               })
            end,
         },
         ensure_installed = {
            "bashls",    -- Bash
            "clangd",    -- C/C++
            "cmake",     -- CMake
            "css_variables", -- CSS
            "cssls",     -- CSS
            "cssmodules_ls", -- CSS
            "html",      -- HTML
            "hyprls",    -- Hyprlang
            "jsonls",    -- JSON
            "lua_ls",    -- Lua
            "marksman",  -- Markdown
            "pyright",   -- Python
            "rust_analyzer", -- Rust
            "somesass_ls", -- Sass
            "tailwindcss", -- CSS
            "ts_ls",     -- TypeScript
            "vimls",     -- VimScript
         },
      }
   end,
   config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      vim.api.nvim_create_autocmd("LspAttach", {
         callback = function(event)
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client == nil then return end
            for _, keymap in ipairs(keymaps) do
               if client.supports_method(keymap.capability) then
                  vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs,
                     { buffer = event.buf, desc = "LSP: " .. keymap.desc })
               end
            end
         end,
      })
      vim.filetype.add({
         pattern = {
            [".*/hypr/.*%.conf"] = "hyprlang",
         }
      })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
         pattern = { "hyprlang" },
         callback = function(event)
            print(string.format("Starting HyprLS for %s", vim.inspect(event)))
            vim.lsp.start({
               name = "hyprlang",
               cmd = { "hyprls" },
               root_dir = vim.fn.getcwd(),
            })
         end,
      })
   end,
}
