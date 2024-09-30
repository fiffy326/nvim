-- vim.api.nvim_create_autocmd("ColorScheme", {
--    callback = function()
--       require("utils.theme").save()
--       require("utils.theme").force_transparency()
--    end,
-- })
--
-- vim.api.nvim_create_autocmd("VimEnter", {
--    callback = function()
--       require("utils.theme").load()
--       require("utils.theme").force_transparency()
--    end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
   end,
})

vim.api.nvim_create_autocmd("VimEnter", {
   callback = function()
      vim.cmd.aunmenu([[PopUp.How-to\ disable\ mouse]])
      vim.cmd.aunmenu([[PopUp.-1-]])
   end,
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "lua" },
   callback = function()
      vim.bo.tabstop = 3
   end,
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "hyprlang" },
   callback = function()
      vim.bo.commentstring = "# %s"
   end,
})
