local M = {}

function M.force_transparency()
   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
   vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function M.load()
   local theme = "default"
   local file = io.open(vim.fn.stdpath("data") .. "/theme.txt", "r")
   if file then
      theme = file:read("*l")
      file:close()
   end
   vim.cmd.colorscheme(theme)
end

function M.save()
   local theme = vim.g.colors_name
   local file = io.open(vim.fn.stdpath("data") .. "/theme.txt", "w")
   if file then
      file:write(theme)
      file:close()
   end
end

return M
