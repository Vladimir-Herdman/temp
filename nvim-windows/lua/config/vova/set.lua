-- text
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.incsearch = true
vim.opt.syntax = "on"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)
vim.o.breakindent = true
vim.opt.timeoutlen = 400

-- text folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({fold = "~"})

-- windows/screens
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 999
vim.opt.virtualedit = "block"
vim.cmd("filetype plugin indent on")
vim.opt.signcolumn = "auto"
vim.opt.laststatus = 1

-- file
vim.o.updatetime = 1000
vim.o.confirm = true

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("config") .. "/undo"

-- colors
local vova_ErrorMsg_hl = vim.api.nvim_get_hl(0, {name = "ErrorMsg"})
vova_ErrorMsg_hl.underline = false
vim.api.nvim_set_hl(0, "vova_ErrorMsg_hl", vova_ErrorMsg_hl)

---@param hl_group_name string the hl group to copy, modify, and return
---@return string
local function genCustomHlCopy(hl_group_name)
    local hl_custom_name = "vova_" .. hl_group_name
    local hl_copy = vim.api.nvim_get_hl(0, {name = hl_group_name})
    hl_copy.underline = false
    vim.api.nvim_set_hl(0, hl_custom_name, hl_copy)
    return hl_custom_name
end

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT]  = "",
            [vim.diagnostic.severity.INFO]  = "",
        },
        numhl = {
            --[vim.diagnostic.severity.ERROR] = "vova_ErrorMsg_hl",
            [vim.diagnostic.severity.ERROR] = genCustomHlCopy("ErrorMsg"),
            [vim.diagnostic.severity.WARN]  = genCustomHlCopy("WarningMsg"),
            [vim.diagnostic.severity.HINT]  = genCustomHlCopy("DiagnosticHint"),
            [vim.diagnostic.severity.INFO]  = genCustomHlCopy("DiagnosticInfo"),
        },
    },
})
