return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup{
      auto_install     = true,
      ensure_installed = {
        "c", "cpp", "lua", "python", "java", "ruby", "rust",
        "markdown", "markdown_inline", "query", "vim", "vimdoc"
      },
    }
  end,
}

