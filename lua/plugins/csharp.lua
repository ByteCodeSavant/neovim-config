return {
  -- Easy .NET: bundled Roslyn LSP, solution/project pickers, test runner, and DAP integration
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    ft = { "cs", "vb", "fsharp" },
    cmd = { "Dotnet", "EasyDotnet" },
    opts = {
      lsp = {
        enabled = true,
        preload_roslyn = true,
      },
      debugger = {
        auto_register_dap = true,
      },
      auto_bootstrap_namespace = true,
    },
    keys = {
      {
        "<leader>cnr",
        function()
          local client = require("easy-dotnet.rpc.rpc").global_rpc_client
          client:initialize(function()
            client.workspace:run({
              use_default = true,
              use_launch_profile = true,
              file_path = vim.api.nvim_buf_get_name(0),
            })
          end)
        end,
        desc = "Run .NET project",
      },
      { "<leader>cnb", function() require("easy-dotnet").build_default() end, desc = "Build .NET project" },
      { "<leader>cnt", function() require("easy-dotnet").test_default() end,  desc = "Test .NET project" },
      { "<leader>cnp", function() require("easy-dotnet").restore() end,       desc = "Restore .NET packages" },
      {
        "<leader>cnx",
        function()
          local terminal = require("easy-dotnet.terminal")
          local job_id = terminal.state.job_id
          if job_id then
            vim.fn.jobstop(job_id)
            vim.defer_fn(function() terminal.hide() end, 200)
          else
            vim.notify("No running .NET process", vim.log.levels.WARN)
          end
        end,
        desc = "Stop .NET project",
      },
    },
  },

  -- which-key: register .NET subgroup under "code"
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>cn", group = ".net" },
      },
    },
  },

  -- Treesitter parser for C#
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c_sharp" } },
  },

  -- Mason: install csharpier formatter and netcoredbg debugger
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "csharpier", "netcoredbg" } },
  },

  -- conform.nvim: format .cs files with csharpier
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
    },
  },
}
