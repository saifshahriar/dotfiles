command! ShowDiff w !diff % -
command! AsRoot w !sudo tee %
command! FixWhitespace :%s/\s\+$//e
