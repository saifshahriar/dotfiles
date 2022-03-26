-- Setup NvChad nvim config: https://nvchad.github.io/getting-started/setup
-- Now add the following line to the init.lua file.
-- ! Do not overwrite the init.lua file
local vimrc = vim.api.nvim_exec(
[[
" Uncomment the following line if its an Unix based system
source ./vimrc.vim

" Uncomment the following line if its a Windows system
" source .\vimrc.vim
]],
true)
