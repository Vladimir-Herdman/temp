return {
    {
        "sainnhe/everforest",
        config = function()
            vim.cmd([[
                let g:everforest_better_performance = 1
                let g:everforest_enable_italic = 1
                let g:everforest_transparent_background = 1
                set termguicolors
                colorscheme everforest
            ]])
        end,
    }
}
