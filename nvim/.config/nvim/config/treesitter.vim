" TREESITTER CONFIG

lua << EOF
 local treesitter = require('nvim-treesitter.configs')
 treesitter.setup({
    ensure_installed = "all",
    highlight = {
       enable = true
  }
})
EOF
