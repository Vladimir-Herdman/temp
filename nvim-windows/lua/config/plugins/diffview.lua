return {
    {
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
        keys = "<Leader>gd",
        config = function()
            require("diffview").setup({
                use_icons = false,

                view = {
                    default = {
                        layout = "diff2_horizontal", -- top/bottom layout
                    },
                },
            })

            local diffOpen = true
            vim.keymap.set("n", "<Leader>gd", function()
                diffOpen = not diffOpen
                if diffOpen == false then
                    return "<cmd>DiffviewOpen --layout=diff2_horizontal<CR>"
                else
                    return "<cmd>DiffviewClose<CR>"
                end
            end, { desc = "Toggle Diffview open/close", expr=true })
        end,
    }
}
