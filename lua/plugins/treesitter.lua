local function buffer_is_large(_, bufnr)
   return require("utils.buffer").is_large(bufnr)
end

return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   dependencies = { "nvim-treesitter/nvim-treesitter-context" },
   opts = {
      indent = {
         enable = true,
         disable = buffer_is_large,
      },
      highlight = {
         enable = true,
         disable = buffer_is_large,
         use_languagetree = true,
      },
      incremental_selection = {
         enable = true,
         disable = buffer_is_large,
      },
      auto_install = true,
      ensure_installed = {
         "bash",
         "c",
         "cmake",
         "cpp",
         "css",
         "doxygen",
         "html",
         "hyprlang",
         "javascript",
         "jsdoc",
         "json",
         "jsonc",
         "latex",
         "lua",
         "luadoc",
         "luap",
         "make",
         "markdown",
         "markdown_inline",
         "printf",
         "python",
         "query",
         "regex",
         "rust",
         "scss",
         "tsx",
         "typescript",
         "vim",
         "vimdoc",
      },
   },
   config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
   end,
}
