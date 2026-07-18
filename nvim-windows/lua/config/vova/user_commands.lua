-- Wipe buffers that are unedited and hidden
local function wipeout_inactive_bufs()
    local tablist = {}
    local tabcount = vim.fn.tabpagenr('$')

    for i = 1, tabcount do
        local buflist = vim.fn.tabpagebuflist(i)
        for _, b in ipairs(buflist) do
            tablist[b] = true
        end
    end

    local wiped = 0
    for i = 1, vim.fn.bufnr('$') do
        if vim.fn.bufexists(i) == 1
            and vim.fn.getbufvar(i, '&mod') == 0
            and not tablist[i]
            then
                vim.cmd('silent! bwipeout! ' .. i)
                wiped = wiped + 1
            end
        end

        vim.notify(wiped .. ' buffer(s) wiped out')
    end
vim.api.nvim_create_user_command('LsWipeInactive', wipeout_inactive_bufs, {})
vim.keymap.set("n", "<leader>b", "<cmd>LsWipeInactive<CR>", { desc="clean out hidden unedited buffers" })

vim.api.nvim_create_user_command("VHcdcur", function() vim.cmd("cd %:h") end, {})
