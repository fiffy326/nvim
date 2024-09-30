local map = vim.keymap.set

map("n", ";", ":", { desc = "Command mode" })
map("i", "jk", "<Esc>", { desc = "Normal mode" })

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("i", "<C-b>", "<Esc>^i", { desc = "Start of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })
map("i", "<C-h>", "<Left>", { desc = "Left" })
map("i", "<C-l>", "<Right>", { desc = "Right" })
map("i", "<C-j>", "<Down>", { desc = "Down" })

map("v", ">", ">gv", { desc = "Increase indent" })
map("v", "<", "<gv", { desc = "Decrease indent" })
map("v", "<Tab>", ">gv", { desc = "Increase indent" })
map("v", "<S-Tab>", "<gv", { desc = "Decrease indent" })

map("c", "<Ins>", "\\(.*\\)", { desc = "Greedy capture group" })

map("n", "<Leader>/", "gcc", { desc = "Toggle comment line", remap = true })
map("v", "<Leader>/", "gc", { desc = "Toggle comment", remap = true })

map("n", "<Leader><F1>", "<Cmd>h index<CR>", { desc = "Vim reference manual" })

map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

map("n", "<C-q>", "<Cmd>q<CR>", { desc = "Quit" })
map("n", "<C-s>", "<Cmd>w<CR>", { desc = "Save buffer" })
map("n", "<C-c>", "<Cmd>%y+<CR>", { desc = "Copy buffer contents" })

map("n", "<Esc>", "<Cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<Leader>n", "<Cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<Leader>rn", "<Cmd>set rnu!<CR>", { desc = "Toggle relative number" })

map("n", "<Leader>l", "<Cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<Leader>m", "<Cmd>Mason<CR>", { desc = "Mason" })
map("n", "<Leader>?", "<Cmd>WhichKey<CR>", { desc = "WhichKey" })
