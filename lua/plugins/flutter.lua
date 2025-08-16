return {
  -- Flutter Tools - Main Flutter development plugin
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
          notification_style = "nvim-notify",
        },
        decorations = {
          statusline = {
            app_version = false,
            device = true,
          },
        },
        debugger = {
          enabled = false,
          run_via_dap = false,
        },
        flutter_path = nil, -- <-- this takes priority over the lookup
        flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
        fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
        widget_guides = {
          enabled = false,
        },
        closing_tags = {
          highlight = "ErrorMsg", -- highlight for the closing tag
          prefix = "// ", -- character to use for close tag e.g. > Widget
          enabled = true, -- set to false to disable
        },
        dev_log = {
          enabled = true,
          notify_errors = false, -- if there is an error whilst running then notify the user
          open_cmd = "tabedit", -- command to use to open the log buffer
        },
        dev_tools = {
          autostart = false, -- autostart devtools server if not detected
          auto_open_browser = false, -- Automatically opens devtools in the browser
        },
        outline = {
          open_cmd = "30vnew", -- command to use to open the outline buffer
          auto_open = false, -- if true this will open the outline automatically when it is first populated
        },
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = false, -- highlight the background
            background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = false, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to use
          },
          on_attach = function(client, bufnr)
            -- Custom keymaps for Flutter
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Run" }))
            vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Restart" }))
            vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Quit" }))
            vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Devices" }))
            vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Emulators" }))
            vim.keymap.set("n", "<leader>fl", "<cmd>FlutterReload<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Reload" }))
            vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Outline" }))
            vim.keymap.set("n", "<leader>ft", "<cmd>FlutterDevTools<cr>", vim.tbl_extend("force", opts, { desc = "Flutter DevTools" }))
            vim.keymap.set("n", "<leader>fc", "<cmd>FlutterLogClear<cr>", vim.tbl_extend("force", opts, { desc = "Flutter Clear Logs" }))
            
            -- Add formatting keymap
            vim.keymap.set("n", "<leader>fm", function()
              require("conform").format({ bufnr = bufnr })
            end, vim.tbl_extend("force", opts, { desc = "Format Buffer" }))
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
            },
          },
        },
      })
    end,
  },

  -- Dart language support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "dart" })
    end,
  },

  -- LSP configuration for Dart
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {
          cmd = { "dart", "language-server", "--protocol=lsp" },
          filetypes = { "dart" },
          init_options = {
            onlyAnalyzeProjectsWithOpenFiles = true,
            suggestFromUnimportedLibraries = true,
            closingLabels = true,
            outline = true,
            flutterOutline = true,
          },
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
            },
          },
        },
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
      formatters = {
        dart_format = {
          command = "dart",
          args = { "format" },
        },
      },
    },
  },

  -- Which-key mappings for Flutter commands
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>f", group = "flutter", mode = { "n", "v" } },
      },
    },
  },
}