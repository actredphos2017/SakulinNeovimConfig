vim.g.mapleader = " "

local keymap = vim.keymap

-- - 输入模式
keymap.set("i", "<C-c>", "<ESC>")

-- - 可视模式

-- 移动代码块
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- - 正常模式

-- 增加窗口
keymap.set("n", "WL", "<C-w>v")
keymap.set("n", "WJ", "<C-w>s")

-- 可视模式
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


keymap.set("n", "<C-l>", "e")
keymap.set("n", "<C-h>", "b")

-- - Plugin Neo Tree
keymap.set("n", "tr", ":Neotree<CR>")

-- - Plugin Telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>")
keymap.set('n', '<leader>fb', ":Telescope buffers<CR>")
keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>")

