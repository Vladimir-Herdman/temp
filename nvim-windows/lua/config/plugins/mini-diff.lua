return {
    {
        'echasnovski/mini.diff',
        version = '*',
        config = function()
            require("mini.diff").setup({
                mappings = {
                    --Go to hunk range in corresponding direction
                    goto_prev = '<Leader>gN',
                    goto_next = '<Leader>gn',
                },

                options = {
                    wrap_goto = true,
                }
            })
        end
    }
}
