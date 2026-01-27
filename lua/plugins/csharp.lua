return {
  -- Easy .NET development with Roslyn LSP and netcoredbg debugging
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      local dotnet = require("easy-dotnet")
      dotnet.setup({
        -- Use Roslyn LSP (modern, official Microsoft language server)
        roslyn = true,
        -- Auto-bootstrap Roslyn LSP
        auto_bootstrap_namespace = true,
      })

      -- Keymaps for common .NET operations
      vim.keymap.set("n", "<leader>dr", function()
        dotnet.run_default()
      end, { desc = "Run .NET project" })

      vim.keymap.set("n", "<leader>db", function()
        dotnet.build_default()
      end, { desc = "Build .NET project" })

      vim.keymap.set("n", "<leader>dt", function()
        dotnet.test_default()
      end, { desc = "Test .NET project" })

      vim.keymap.set("n", "<leader>dp", function()
        dotnet.restore()
      end, { desc = "Restore .NET packages" })
    end,
  },

  -- Which-key group for .NET commands
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>d", group = "dotnet" },
      },
    },
  },

  -- Ensure nvim-dap is loaded for debugging support
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_installation = true,
          handlers = {},
          ensure_installed = {
            "netcoredbg", -- .NET Core debugger
          },
        },
      },
    },
  },
}
