-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.winbar = "%=%m %f" -- Show modified flag and file path in window bar (LazyVim default)

-- Scrolling behavior - keep more context around cursor
opt.scrolloff = 8 -- Lines of context above/below cursor
opt.sidescrolloff = 8 -- Columns of context to left/right of cursor

-- Line numbers - relative with current line absolute
opt.number = true -- Show line numbers (LazyVim default)
opt.relativenumber = true -- Show relative line numbers (LazyVim default)

-- Clipboard integration - sync with system clipboard
opt.clipboard = "unnamedplus" -- Use system clipboard (LazyVim default)

-- Search behavior
opt.ignorecase = true -- Case-insensitive search (LazyVim default)
opt.smartcase = true -- Override ignorecase if search has uppercase (LazyVim default)

-- Indentation
opt.tabstop = 2 -- Number of spaces tabs count for (LazyVim default: 2)
opt.shiftwidth = 2 -- Size of indent (LazyVim default: 2)
opt.expandtab = true -- Use spaces instead of tabs (LazyVim default)
opt.smartindent = true -- Insert indents automatically (LazyVim default)

-- Performance
opt.updatetime = 250 -- Faster CursorHold events (LazyVim default: 200)
opt.timeoutlen = 300 -- Time to wait for mapped sequence (LazyVim default: 300)

-- Persistent undo
opt.undofile = true -- Save undo history (LazyVim default)
opt.undolevels = 10000 -- Maximum number of changes that can be undone (LazyVim default)

-- Splitting behavior
opt.splitbelow = true -- Put new windows below current (LazyVim default)
opt.splitright = true -- Put new windows right of current (LazyVim default)

-- Completion
opt.completeopt = "menu,menuone,noselect" -- Better completion experience (LazyVim default)

-- Display
opt.conceallevel = 2 -- Hide markdown syntax (LazyVim default for markdown)
opt.cursorline = true -- Highlight current line (LazyVim default)
opt.list = true -- Show some invisible characters (LazyVim default)
opt.signcolumn = "yes" -- Always show sign column (LazyVim default)
opt.termguicolors = true -- True color support (LazyVim default)
opt.wrap = false -- Disable line wrap (LazyVim default)

-- Note: Most options above are LazyVim defaults, documented here for reference
-- Custom overrides are minimal to maintain LazyVim's sensible defaults
