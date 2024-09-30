local g = vim.g
local opt = vim.opt

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.mapleader = " "
g.maplocalleader = "\\"

opt.clipboard = "unnamedplus"
opt.cmdwinheight = 10
opt.colorcolumn = "120"
opt.completeopt:append({ "menuone" })
opt.confirm = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.expandtab = true
opt.fillchars:append({ eob = " " })
opt.guicursor = ""
opt.ignorecase = true
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.listchars:append({ tab = "» ", trail = "·", nbsp = "␣" })
opt.mouse = "a"
opt.mousemoveevent = true
opt.mousescroll = "ver:1,hor:6"
opt.number = true
opt.numberwidth = 2
opt.pumheight = 10
opt.pumwidth = 15
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 0
opt.shortmess:append({ I = true, s = true })
opt.showcmd = false
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 500
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 50
opt.virtualedit = "block"
opt.whichwrap:append("<>[]hl")
opt.wildmode = "longest:full,full"
opt.wrap = false
