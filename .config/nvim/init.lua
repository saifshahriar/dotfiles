-- Setup NvChad nvim config: https://nvchad.github.io/getting-started/setup
-- Now add the following line to the init.lua file.
-- ! Do not overwrite the init.lua file
local result = vim.api.nvim_exec(
[[
source ./.vimrc.vim
]],
true)
