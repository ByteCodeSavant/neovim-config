return {
  -- Molten for Jupyter kernel integration
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    ft = { "python", "markdown" },
    config = function()
      -- Image rendering with your existing image.nvim
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<CR>", desc = "Initialize Molten" },
      { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate operator", mode = "n" },
      { "<leader>ml", ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
      { "<leader>mr", ":MoltenReevaluateCell<CR>", desc = "Re-evaluate cell" },
      { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Evaluate visual", mode = "v" },
      { "<leader>md", ":MoltenDelete<CR>", desc = "Delete Molten cell" },
      { "<leader>mo", ":MoltenHideOutput<CR>", desc = "Hide output" },
      { "<leader>ms", ":MoltenShowOutput<CR>", desc = "Show output" },
    },
  },

  -- Jupytext for .ipynb file handling
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    lazy = true,
    ft = { "ipynb", "jupyter" }, -- Load only for notebook files
  },

  -- Which-key group for Molten/Jupyter commands
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>m", group = "molten/jupyter", mode = { "n", "v" } },
      },
    },
  },
}
