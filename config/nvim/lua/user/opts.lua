vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

vim.opt.shell = "/bin/bash"
vim.opt.termguicolors = true

vim.opt.mouse = "a"
vim.opt.undolevels=1000
vim.opt.undoreload=20000
vim.opt.undofile = true
-- vim.opt.undodir = "$HOME/.vimundo"
vim.opt.autoread = true
vim.opt.scrolloff = 8
vim.opt.ruler = true
vim.opt.cmdheight = 2
vim.opt.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.title = true
vim.opt.visualbell = false
vim.opt.errorbells = false

vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.ffs = "unix,dos,mac"
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.cursorline = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false


vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp

-- vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
-- vim.opt.pumheight = 10                          -- pop up menu height
-- vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.showtabline = 0                         -- always show tabs
-- vim.opt.smartindent = true                      -- make indenting smarter again
-- vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
-- vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
-- vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.updatetime = 300                        -- faster completion (4000ms default)
-- vim.opt.laststatus = 3                          -- only the last window will always have a status line
-- vim.opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
-- vim.opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
-- vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
-- vim.opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
-- vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
-- vim.opt.fillchars.eob=" "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
-- vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
-- vim.opt.iskeyword:append("-")                   -- treats words with `-` as single words
-- vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
-- vim.opt.linebreak = true
