return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.parsers = opts.parsers or {}
      opts.parsers.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "blade", "php_only" })
      vim.filetype.add({ pattern = { [".*%.blade%.php"] = "blade" } })
    end,
  },
}
