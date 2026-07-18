-- Potentially checkout out canola.nvim as maintained replacement for oil functionality
return {
    {
        'stevearc/oil.nvim',
        keys = { "-" },
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                view_options = {
                    show_hidden = true,
                },
                delete_to_trash = true,
                keymaps = {
                    ["q"] = "actions.close",
                },
            })

            vim.keymap.set("n", "-", "<cmd>Oil<CR>")
        end,
    }
}
