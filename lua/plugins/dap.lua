return {
   {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = {
         "williamboman/mason.nvim",
         "mfussenegger/nvim-dap",
      },
      event = "VeryLazy",
      opts = function()
         return {
            handlers = {
               function(dap)
                  require("mason-nvim-dap").default_setup(dap)
               end,
            },
            ensure_installed = {
               "bash",   -- Bash
               "cppdbg", -- C/C++
               "python", -- Python
            },
         }
      end,
   },
   {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      keys = {
         { "<F10>", "<Cmd>lua require('dapui').toggle()<CR>", desc = "Toggle debug UI" },
      },
      opts = {},
   },
}
