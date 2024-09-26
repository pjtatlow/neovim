-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>r", "<cmd>LspRestart<cr>", { noremap = true, desc = "Lsp Restart" })
vim.keymap.set("n", "<M-h>", ":BufferLineMovePrev<CR>", { noremap = true, desc = "Tab Left" })
vim.keymap.set("n", "<M-l>", ":BufferLineMoveNext<CR>", { noremap = true, desc = "Tab Right" })
-- vim.keynap.set("n", "<leader>nj", function ()
--   local buf = vim.api.nvim_create_buffer()
-- end, { noremap = true, desc = "New JSON file" })
