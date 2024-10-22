-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { "cwd" }
vim.g.backspace = "indent,eol,start"

if vim.g.neovide then
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0.08

  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("i", "<D-s>", "<ESC>:w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

vim.opt.clipboard = "unnamed,unnamedplus"

-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   },
--   paste = {
--     ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--   },
-- }

-- vim.lsp.set_log_level(1)
