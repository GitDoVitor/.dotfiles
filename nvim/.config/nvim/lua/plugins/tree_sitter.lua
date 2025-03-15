return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { 
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml", 
        "c",
        "vimdoc",
        "xml", 
      },
      sync_install = true,
      highlight = { enable = true, },
      indent = { enable = true, },
    })
  end
}
