local keymap = vim.keymap.set

-- Clear highlights
keymap("n", "<Leader>n", function()
    vim.cmd('noh')

    if (_G.ORIGINAL_CURSORLINE_HL) then
        vim.api.nvim_set_hl(0, "CursorLine", {bg = _G.ORIGINAL_CURSORLINE_HL.bg, fg = _G.ORIGINAL_CURSORLINE_HL.fg})
    end
end, { desc = "turn off hlsearch to clear search highlights" })

-- Enter expression register
keymap("n", "<Leader>c", "<Cmd>cope<CR>", { desc = "Open quickfix list" })

-- Substitutions
keymap("n", "s", "<cmd>&&<CR>", { desc = "Repeat last substitution with flags" })
keymap("n", "<Leader>sg", ":%s/\\<<C-r><C-w>\\>//gcI<Left><Left><Left><Left>", { desc = "Globally replace under cursor" })
keymap("n", "ciw", "\"_ciw", { desc = "ciw doesn't interact with unnamed register" })

-- jump on screen buffers
keymap("n", "<C-h>", "<C-w>h", { desc = "jump to left onscreen window/buffer" })
keymap("n", "<C-j>", "<C-w>j", { desc = "jump to below onscreen window/buffer" })
keymap("n", "<C-k>", "<C-w>k", { desc = "jump to above onscreen window/buffer" })
keymap("n", "<C-l>", "<C-w>l", { desc = "jump to right onscreen window/buffer" })

-- move tabs
keymap("n", "<leader>h", "<cmd>tabprevious<CR>", { desc = "Move to left tab" })
keymap("n", "<leader>l", "<cmd>tabnext<CR>", { desc = "Move to right tab" })

-- split screen
keymap("n", "<Leader>sv", "<cmd>vsplit<CR>", { desc = "Split screen vertically" })
keymap("n", "<Leader>sh", "<cmd>split<CR>", { desc = "Split screen horizontally" })

-- line movements
keymap("n", "<Up>", "<Cmd>m -2<CR>")
keymap("n", "<Down>", "<Cmd>m +1<CR>")
keymap("n", "<Left>", "<Cmd>tabprevious<CR>")
keymap("n", "<Right>", "<Cmd>tabnext<CR>")

keymap("n", "<C-CR>", "o<Esc>k", { desc = "newline below without entering insert mode" })

keymap("n", "<Leader>;", "mrA;<Esc>`r", { desc = "enter ; at end of line, start new one" })
keymap("n", "<Leader>,", "mrA,<Esc>`r", { desc = "enter , at end of line, start new one" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "When in visual mode, move highlighted up" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "When in visual mode, move highlighted down" })

-- Function stuff and lsp interaction
keymap("n", "<leader>fd", vim.lsp.buf.definition, { desc = "Go to function definition" })
keymap("n", "<leader>fh", vim.lsp.buf.hover, { desc = "Displays hover information" })
keymap("n", "<leader>fs", vim.lsp.buf.signature_help, { desc = "Displays signature information" })
keymap("n", "<Leader>gw", function() vim.diagnostic.jump({ count=1, float=true }) end, { desc = "Go to warning (diagnostic)" })
keymap("n", "<leader>fw", vim.lsp.buf.code_action, { desc = "Fix warning" })
--grn:  Rename variable and it's references (vim.lsp.buf.rename)
--grr:  Get all variable references in file (vim.lsp.buf.references)
--gri:  Get implementation of symbol under cursor, so definition location of word under cursor (vim.diagnostic.implementation)
--gra:  Get all actions on this code piece, fix warning options (vim.lsp.buf.code_action)

keymap("n", "gt", "<C-]>", { desc = "shortcut gt to ctrl-]" })

keymap("n", "<Leader>w", "<Cmd>w<CR>", { desc = "faster :w" })
keymap("n", "<Leader>q", function()
    if (vim.api.nvim_buf_get_name(0) == "") then return "<Cmd>q!<CR>" end
    return "<Cmd>q<CR>"
end, { desc = "faster :q", expr = true })
keymap("n", "<Leader>x", "<Cmd>wq<CR>", { desc = "faster :wq" })
keymap("n", "H", "^", { desc = "Move to line beginning" })
keymap("v", "H", "^", { desc = "Move to line beginning" })
keymap("n", "<leader>h", "<Cmd>tabprevious<CR>", { desc = "go previous tab" })
keymap("n", "L", "$", { desc = "Move to line end" })
keymap("v", "L", "$", { desc = "Move to line end" })
keymap("n", "<leader>l", "<Cmd>tabnext<CR>", { desc = "go next tab" })

keymap("n", "ya", "mrggVGy`r", { desc = "Yank whole buffer" })
keymap("i", "jj", "<Esc>", { desc = "Leave insert mode with jj" })
keymap("x", "<leader>c", "gc", {remap=true})
keymap("n", "<leader>o", function()
    local file = vim.fn.expand("<cfile>")
    local path = vim.fn.expand("%:h")
    if #file == 0 then return end
    vim.fn.jobstart({"open", path.."/"..file}, {detach = true})
end, {desc = "open file under cursor"})

keymap("n", "K", function()
    local cmd = vim.fn.expand("<cword>")
    if cmd == "" then return end
    vim.cmd("Man "..cmd)
end, {desc="Open the man page for word underneath cursor."})

--testing for harpoon-idea stuff
--  Mainly, <leader>` will open a buffer telescope-like list of saved files to
--  jump to, and you can fzf search through it to go to the files you've saved,
--  instead of cding to it and changing around the pwd, or traveling to it, so
--  more from nvim for previously set stuff.
--local count = 0;
--keymap("n", "<leader>`", function() count=count+1; print("test"..count) end, {desc="playing around with mark stuff"})

vim.api.nvim_create_autocmd("FileType", {
    pattern="markdown",
    callback = function()
        keymap("n", "<leader>.", "mrA.`r", { buffer=true })
    end
})

keymap("n", "<leader>m", "<cmd>make<cr>")
