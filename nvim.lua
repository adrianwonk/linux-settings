vim.g.mapleader = " "
vim.g.maplocalleader = " "

local data_dir = vim.fn.stdpath("data") .. "/site"
if vim.fn.empty(vim.fn.glob(data_dir .. "/autoload/plug.vim")) == 1 then
    vim.fn.system({
        "curl", "-fLo", data_dir .. "/autoload/plug.vim", "--create-dirs",
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
    })
    vim.api.nvim_create_autocmd("VimEnter", {
        command = "PlugInstall --sync | source $MYVIMRC",
    })
end

vim.cmd([[
    call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
    call plug#end()
]])

vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.cmd.colorscheme("rose-pine")
vim.opt.laststatus = 2

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.linebreak = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 10

vim.opt.cmdheight = 1
vim.opt.shortmess:append("aoOtT")

vim.opt.guicursor = "a:block"

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal",       { bg = "NONE", ctermbg = "NONE" })
hi("NonText",      { bg = "NONE", ctermbg = "NONE" })
hi("EndOfBuffer",  { bg = "NONE", ctermbg = "NONE" })
hi("LineNr",       { bg = "NONE", ctermbg = "NONE" })
hi("SignColumn",   { bg = "NONE", ctermbg = "NONE" })

hi("CursorLine",   { bg = "#3a3a3a", ctermbg = 237 })
hi("CursorLineNr", { italic = true, fg = "#af0000", ctermfg = 124, bg = "#3a3a3a", ctermbg = 237 })
hi("LineNrAbove",  { italic = true, fg = "#6c7a89", ctermfg = 66 })
hi("LineNrBelow",  { italic = true, fg = "#ffafd7", ctermfg = 218 })

vim.api.nvim_create_augroup("netrw_silent", { clear = true })
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro cul"

vim.keymap.set("n", "<leader>q", ":w<CR>:Explore<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "<C-j>", function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>" end, { expr = true })
vim.keymap.set("i", "<C-k>", function() return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>" end, { expr = true })

vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
})
vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf = args.buf
        vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local map = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, { buffer = buf }) end
        map("gd", vim.lsp.buf.definition)
        map("gD", vim.lsp.buf.declaration)
        map("gr", vim.lsp.buf.references)
        map("gi", vim.lsp.buf.implementation)
        map("K",  vim.lsp.buf.hover)
        map("<leader>rn", vim.lsp.buf.rename)
        map("<leader>ca", vim.lsp.buf.code_action)
        map("<leader>f",  function() vim.lsp.buf.format({ async = true }) end)
        map("[d", function() vim.diagnostic.jump({ count = -1 }) end)
        map("]d", function() vim.diagnostic.jump({ count =  1 }) end)
    end,
})
