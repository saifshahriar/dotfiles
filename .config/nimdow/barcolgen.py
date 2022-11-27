#!/usr/bin/env python3

# Tokyonight Colorscheme
col = {
    'background':   '#1a1b26',
    'foreground':   '#c0caf5',
    'nblack':       '#15161e',
    'nred':         '#f7768e',
    'ngreen':       '#9ece6a',
    'nyellow':      '#e0af68',
    'nblue':        '#7aa2f7',
    'nmagenta':     '#bb9af7',
    'ncyan':        '#7dcfff',
    'nwhite':       '#a9b1d6',
    'bblack':       '#414868',
    'bred':         '#f7768e',
    'bgreen':       '#9ece6a',
    'byellow':      '#e0af68',
    'bblue':        '#7aa2f7',
    'bmagenta':     '#bb9af7',
    'bcyan':        '#7dcfff',
    'bwhite':       '#c0caf5'
}

f = open("colors.sh", "w")

for i in col:
    h = (col[i]).lstrip('#')
    rgb = list(tuple(int(h[i:i+2], 16) for i in (0, 2, 4)))
    f.write(f"{i}=$\'\\x1b[38;2;{rgb[0]};{rgb[1]};{rgb[2]}m\'\n")
f.close()
