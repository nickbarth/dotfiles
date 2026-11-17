-- ============================================================================
-- 1. Core Options
-- ============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.number = true
opt.relativenumber = false
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.signcolumn = "yes"
opt.termguicolors = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.clipboard = ""
opt.wrap = false
opt.mouse = ""
vim.g.netrw_banner = 0

-- Disable swapfiles and backup files
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- ============================================================================
-- 2. Plugins (vim-plug)
-- ============================================================================
vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')
  
  " Colorschemes
  Plug 'nanotech/jellybeans.vim'
  Plug 'dracula/vim'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

  " File Explorer & Dependencies
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'MunifTanjim/nui.nvim'

  " Status Line
  Plug 'nvim-lualine/lualine.nvim'

  " Fuzzy Finder (FZF + Bat + Ripgrep)
  Plug 'ibhagwan/fzf-lua'

  " LSP Config
  Plug 'neovim/nvim-lspconfig'

  " Tim Pope Classics & Workflow
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sleuth'

  " Git & Cursors
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'dandavison/delta'

  " Auto close
  Plug 'm4xshen/autoclose.nvim'

  call plug#end()
]]

-- ============================================================================
-- 3. Plugin Configurations
-- ============================================================================
-- Apply colorscheme
vim.cmd.colorscheme("jellybeans")

-- Configure Lualine
require("lualine").setup({
  options = { theme = "jellybeans" }
})

-- Configure Fzf-Lua
require("fzf-lua").setup({
  winopts = {
    preview = { default = "bat" }
  }
})

-- ============================================================================
-- 4. Modern Neovim 0.11+ Native LSP Setup (PHP)
-- ============================================================================
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf, remap = false }
    
    -- Code Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    
    -- Code Formatting (Applies PSR-12 via Intelephense)
    vim.keymap.set("n", "<leader>fm", function() 
      vim.lsp.buf.format { async = true } 
    end, vim.tbl_extend("force", opts, { desc = "Format file to PSR-12" }))
  end,
})

-- Initialize and enable Intelephense for PHP
vim.lsp.config("intelephense", {})
vim.lsp.enable("intelephense")

-- ============================================================================
-- 5. Keymaps
-- ============================================================================
local keymap = vim.keymap.set

-- ----------------------------------------------------------------------------
-- FZF-Lua (Replaces Telescope & legacy fzf.vim commands)
-- ----------------------------------------------------------------------------
keymap("n", "<leader>f", "<cmd>FzfLua files<CR>")
keymap("n", "<leader>;", "<cmd>FzfLua live_grep<CR>")
keymap("n", "<leader>a", "<cmd>FzfLua grep_cword<CR>")
keymap("n", "<leader>l", "<cmd>FzfLua buffers<CR>")
keymap("n", "<leader>/", "<cmd>FzfLua lines<CR>")
keymap("n", "<leader>i", "<cmd>FzfLua git_bcommits<CR>")
keymap("n", "<leader>gs", "<cmd>FzfLua git_status<CR>")

-- ----------------------------------------------------------------------------
-- Git / Fugitive / GitGutter
-- ----------------------------------------------------------------------------
keymap("n", "<leader>gi", "<cmd>Git<CR>")
keymap("n", "<leader>gc", "<cmd>Git commit<CR>")
keymap("n", "<leader>ge", "<cmd>Gedit<CR>")
keymap("n", "<leader>gr", "<cmd>Gread<CR>")
keymap("n", "<leader>gw", "<cmd>Gwrite<CR>")
keymap("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>")
keymap("n", "<leader>gl", "<cmd>0Gclog<CR>")
keymap("n", "<leader>go", "<cmd>Git browse<CR>")
keymap("n", "<leader>gp", "<cmd>Git push<CR>")

-- GitGutter (<Plug> mappings don't use <cmd>)
keymap("n", "<leader>ga", "<Plug>(GitGutterStageHunk)")
keymap("n", "<leader>gu", "<Plug>(GitGutterUndoHunk)")
keymap("n", "<leader>]", "<cmd>GitGutterNextHunk<CR>")
keymap("n", "<leader>[", "<cmd>GitGutterPrevHunk<CR>")

-- ----------------------------------------------------------------------------
-- Convenience & UI
-- ----------------------------------------------------------------------------
keymap("n", "<leader><leader>", "<cmd>e#<CR>")
keymap("n", "<leader>~", "<cmd>set invnumber<CR>")
keymap("n", "<leader>`", "<cmd>set invpaste paste?<cr>")
keymap("n", "<leader>=", "<cmd>set expandtab<CR><cmd>retab<cr>")
keymap("n", "<leader>e", "<cmd>Explore<CR>") -- Native Netrw

-- Buffer & Window Management
keymap("n", "<leader>d", "<cmd>bd<CR>")
keymap("n", "<leader>j", "<cmd>bn<CR>")
keymap("n", "<leader>k", "<cmd>bp<CR>")
keymap("n", "<leader>q", "<cmd>q!<CR>")
keymap("n", "<leader>w", "<cmd>w<CR>")
keymap("n", "<leader>x", "<cmd>x<CR>")
keymap("n", "<leader>t", ":let l = line('.')<CR>:tabnew %<CR>:exec l<CR>")

-- Clear search highlights
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- Split Navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Run build in right tmux pane
vim.keymap.set("n", "<leader>r", function()
  vim.fn.system({ "tmux", "send-keys", "-t", "{right-of}", "make", "Enter" })
end, { desc = "Run build in right tmux pane" })

-- ============================================================================
-- 6. PSR-12 PHP Strict Formatting Rules
-- ============================================================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    -- PSR-12 Section 2.4: Code MUST use 4 spaces for indenting, not tabs.
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
    
    -- PSR-12 Section 2.2: All PHP files MUST use the Unix LF line ending.
    vim.opt_local.fileformat = "unix"
  end,
})

-- PSR-12 Section 2.3: There MUST NOT be trailing whitespace at the end of lines.
-- This automatically strips trailing whitespace every time you save a PHP file.
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.php",
  command = "%s/\\s\\+$//e",
})

-- autoclose
require("autoclose").setup()
