-- [[ options ]]

-- enable relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- show which line your cursor is on
vim.o.cursorline = true

-- emable mouse mode for resizing splits
vim.o.mouse = "a"

-- disable mode display since covered by statusline
vim.o.showmode = false

-- sync clipboard between os and neovim
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

-- store undo history between sessions
vim.o.undofile = true

-- case-insensitive searching unless \C or one or more capital letters in query
vim.o.ignorecase = true
vim.o.smartcase = true

-- enable signcolumn
vim.o.signcolumn = "yes"

-- decrease update time
vim.o.updatetime = 250

-- decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- preview substitutions live, as you type!
vim.o.inccommand = "split"

-- tabs
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 4 -- amount to indent with << or >>
vim.o.tabstop = 4 -- how many spaces are shown per tab
vim.o.softtabstop = 4 -- how many spaces are applied when pressing tab
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true -- keep indentation from previous line

-- min num of lines above/below cursor on scroll
vim.o.scrolloff = 10

-- keep command line
vim.o.cmdheight = 1

-- necessary for something, i forget what
vim.o.termguicolors = true
