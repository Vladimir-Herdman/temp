--_G.LAZY_LOAD_ON_FILE = { "lua", "python", "cpp", "c", "javascript", "typescript", "java", "sh", "zsh", "markdown", "html", "css", }
--TODO: on <leader>l or <leader>h, if only one current tab, then make a new one
--TODO: Look into vim.pack in place of lazy.lua, and how it's different or not, anything noticeable.
--CHECKOUT: https://github.com/barrettruth/preview.nvim
--CHECKOUT: JLS v0.4.0 is out: Java 25, faster signatures/references/hover, lower memory
require("config.lazy")
require("config.vova.set")
require("config.vova.keymap")
require("config.vova.autocmd")
require("config.vova.user_commands")
