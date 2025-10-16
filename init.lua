vim.o.number = true
vim.o.clipboard = "unnamed"
vim.o.backspace = "indent,eol,start"
vim.o.directory = "/tmp"
vim.o.backupdir = "/tmp"
vim.o.backupskip = "/tmp/*,/private/tmp/*"
vim.o.fileformats = "unix,dos,mac"
vim.o.wrap = false
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.history = 1000
vim.o.undolevels = 1000
vim.o.title = true
vim.o.visualbell = true
vim.o.errorbells = false

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.copyindent = true

vim.o.wildmenu = true
vim.o.wildmode = "list:longest"
vim.opt.wildignore = {
    ".hg", ".git", ".svn",
    "*.aux", "*.out", "*.toc",
    "*.jpg", "*.bmp", "*.gif", "*.png", "*.jpeg",
    "*.o", "*.obj", "*.exe", "*.dll", "*.manifest",
    "*.spl",
    "*.sw?",
    "*.DS_Store",
    "*.luac",
    "*.pyc",
    "**.class",
}

vim.o.foldmethod = "indent"
vim.o.foldlevel = 99

vim.o.hidden = true
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn = number



vim.g.mapleader = ","
vim.keymap.set({"n", "v"}, "/", "/\\v")
vim.keymap.set("n", "<silent> <leader>/", ":nohlsearch<CR>")
vim.keymap.set("n", "<Left>", "<C-W>h")
vim.keymap.set("n", "<Right>", "<C-W>l")
vim.keymap.set("n", "<Up>", "<C-W>k")
vim.keymap.set("n", "<Down>", "<C-W>j")
vim.keymap.set("n", "<S-Left>", "gT")
vim.keymap.set("n", "<S-Right>", "gt")
vim.keymap.set("n", "<D-p>", ":lua FzfLua.files()<CR>")


-- Something is broken with this command
vim.api.nvim_create_autocmd("VimResized", {
    pattern = "*",
    command = "normal! <C-w>="
})

require("config.lazy")

vim.cmd.colorscheme("flexoki")
