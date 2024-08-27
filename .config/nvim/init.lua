require("autocmd")
require("core")
require("keybinds")
require("options")

-- Lazy --
require("plugins")
require("lazy").setup("plugins", { change_detection = { notify = false } })

-- NeoVide --
vim.cmd([[
let g:neovide_padding_top = 5
let g:neovide_padding_bottom = 0
let g:neovide_padding_right = 5
let g:neovide_padding_left = 5
let g:neovide_scroll_animation_length = 0.0
]])
