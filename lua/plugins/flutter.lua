return {
  -- Flutter Tools - Main Flutter development plugin
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    ft = "dart", -- Load only for Dart files
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
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
          on_attach = function(_, bufnr)
            local maps = {
              r = { "FlutterRun", "Flutter Run" },
              R = { "FlutterRestart", "Flutter Restart" },
              q = { "FlutterQuit", "Flutter Quit" },
              d = { "FlutterDevices", "Flutter Devices" },
              e = { "FlutterEmulators", "Flutter Emulators" },
              l = { "FlutterReload", "Flutter Reload" },
              o = { "FlutterOutlineToggle", "Flutter Outline" },
              t = { "FlutterDevTools", "Flutter DevTools" },
              c = { "FlutterLogClear", "Flutter Clear Logs" },
            }
            for key, m in pairs(maps) do
              vim.keymap.set(
                "n",
                "<leader>F" .. key,
                "<cmd>" .. m[1] .. "<cr>",
                { buffer = bufnr, silent = true, desc = m[2] }
              )
            end
            require("which-key").add({ "<leader>F", group = "flutter", buffer = bufnr })
          end,
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
          args = { "format", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
}
