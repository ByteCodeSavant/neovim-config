return {
  -- Git commit history and file annotations
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gbt", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
      { "<leader>gbe", "<cmd>GitBlameEnable<cr>", desc = "Enable Git Blame" },
      { "<leader>gbd", "<cmd>GitBlameDisable<cr>", desc = "Disable Git Blame" },
      { "<leader>gbo", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open Commit URL" },
      { "<leader>gbc", "<cmd>GitBlameCopyCommitURL<cr>", desc = "Copy Commit URL" },
    },
    config = function()
      require("gitblame").setup({
        enabled = true, -- enable by default
        message_template = " <summary> • <date> • <author>",
        date_format = "%r",
        virtual_text_column = 80,
        highlight_group = "Question",
      })
    end,
  },
}

