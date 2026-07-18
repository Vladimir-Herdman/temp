return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            "<Leader>tf", "<Leader>tc", "<Leader>tg", "<Leader>tt", "<Leader>th", "<leader>tr"
        },
        cmd = "Telescope",
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        "Library/*", "Pictures/*", "Applications/*",
                        ".gradle/*", "undo/*", ".vscode/*", ".DS_Store",
                        "node_modules/*", ".git/*", "%.scm", "%.png",
                        "%.webp", "%.jpeg",
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        no_ignore = true,
                    },
                    live_grep = {
                        hidden = true,
                        glob_pattern = {
                            "!Library/", "!Applications/", "!Pictures/",
                            "!.gradle/", "!.vscode/", "!.DS_Store",
                            "!node_modules/", "!.git/",
                        },
                    },
                    oldfiles = {
                        mappings = {
                            i = {
                                ["<CR>"] = function(prompt_bufnr) --if opening old file, cd to that files directory
                                    require("telescope.actions").select_default(prompt_bufnr)
                                    vim.cmd("lcd %:h") --sets 'cd' for current window
                                end
                            },
                        },
                    },
                    planets = {show_pluto=true, show_moon=true},
                },
            })

            local t_builtin = require("telescope.builtin")
            vim.keymap.set("n", "<Leader>tf", function() t_builtin.find_files({cwd = vim.fn.expand("%:h")}) end)
            vim.keymap.set("n", "<Leader>tc", function() t_builtin.find_files({cwd = "/Users/S5Y2/AppData/Local/nvim/"}) end)
            vim.keymap.set("n", "<Leader>tt", t_builtin.lsp_document_symbols, { desc = "Open current file declarations telescope" })
            vim.keymap.set("n", "<Leader>th", t_builtin.help_tags, { desc = "Search help pages"})
            vim.keymap.set("n", "<Leader>tr", t_builtin.oldfiles, { desc = "Search oldfiles"})
            vim.keymap.set("n", "<Leader>tg", function() t_builtin.live_grep({cwd = vim.fn.expand("%:h")}) end, { desc = "Live grep files"})
        end,
    }
}
