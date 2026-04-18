return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("git-conflict").setup({
      default_mappings = true, -- enable buffer local mapping created by this plugin
      default_commands = true, -- enable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      list_opener = "copen", -- command or function to open the conflicts list
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
      debug = false, -- set to true to enable debug logging
    })
  end,
  keys = {
    { "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose Ours" },
    { "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose Theirs" },
    { "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose Both" },
    { "<leader>gc0", "<cmd>GitConflictChooseNone<cr>", desc = "Choose None" },
    { "]x", "<cmd>GitConflictNextConflict<cr>", desc = "Next Conflict" },
    { "[x", "<cmd>GitConflictPrevConflict<cr>", desc = "Prev Conflict" },
    { "<leader>gcl", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts" },
  },
}
