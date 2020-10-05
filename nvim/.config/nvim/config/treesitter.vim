" TREESITTER CONFIG

lua << EOF
local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
    ensure_installed = "all",
    -- enable semantic highlighting
    highlight = {
       enable = true
    },
    -- enable incremental selection
    -- 'vit' for 'visual inner tree'
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "vit",
            node_incremental = "t",
            scope_incremental = "",
            node_decremental = "T",
        }
    }
})
EOF
