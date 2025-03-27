require "nvchad.mappings"

local map = vim.keymap.set

-- Basic
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "jj for quick esc" })
map("n", "<leader>H", ":nohl<CR>", { desc = "Unhighlight" })
-- Quick save and quit
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Exit" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Save & Exit" })
-- Indentation without breaking
vim.cmd([[
	nnoremap < <<
	nnoremap > >>
	vmap < <gv
	vmap > >gv
]])

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
