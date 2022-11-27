command! ShowDiff w !git diff % -
command! OpenAsRoot w !sudo tee %
command! FixWhitespace :%s/\s\+$//e
