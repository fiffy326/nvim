local M = {}

function M.is_large(bufnr)
   local max_size = 100 * 1024 -- 100 KB
   local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
   return ok and stats and stats.size > max_size
end

return M
