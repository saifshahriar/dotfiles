#!/bin/bash

from os import *

# Ask for confirmation

print(".")
print("├── conf.py")
print("├── fish")
print("│   ├── completions")
print("│   ├── conf.d")
print("│   ├── config.fish")
print("│   ├── fish_variables")
print("│   └── functions")
print("├── neofetch")
print("│   ├── config.conf")
print("│   └── config.conf.bak")
print("├── ranger")
print("│   ├── plugins")
print("│   │   ├── __init__.py")
print("│   │   ├── __pycache__")
print("│   │   │   └── __init__.cpython-39.opt-1.pyc")
print("│   │   └── ranger_devicons")
print("│   │       ├── CONTRIBUTING.MD")
print("│   │       ├── devicons.py")
print("│   │       ├── __init__.py")
print("│   │       ├── LICENSE")
print("│   │       ├── LICENSE_NERDFONT")
print("│   │       ├── __pycache__")
print("│   │       │   ├── devicons.cpython-39.opt-1.pyc")
print("│   │       │   └── __init__.cpython-39.opt-1.pyc")
print("│   │       ├── README.md")
print("│   │       └── screenshot.png")
print("│   └── rc.conf")
print("└── starship.toml")
print("\n")
print("10 directories, 18 files")
opt = input("Warning: This would going to overwrite and append any existing file that are the same name as the files containing in removeme.config directory. Do you want to proceed? [N/y] ")

opt = opt.lower()

if opt != "y":
    exit()
else:
    system("cp * ~/.config")
