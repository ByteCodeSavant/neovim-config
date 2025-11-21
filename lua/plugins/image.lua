return {
  {
    "3rd/image.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear = true,
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = false,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
      rocks = {
        hererocks = true,
      },
    },
    keys = {
      {
        "<leader>io",
        function()
          require("image").toggle()
        end,
        desc = "Toggle image",
      },
      {
        "<leader>ir",
        function()
          require("image").render()
        end,
        desc = "Render image",
      },
      {
        "<leader>ic",
        function()
          require("image").clear()
        end,
        desc = "Clear images",
      },
    },
  },
  {
    "ekickx/clipboard-image.nvim",
    opts = {
      default = {
        img_dir = "images",
        img_name = function()
          return os.date("%Y-%m-%d-%H-%M-%S")
        end,
        affix = "![](images/%s)",
      },
    },
    keys = {
      {
        "<leader>ip",
        "<CMD>PasteIMG<CR>",
        desc = "Paste clipboard image",
      },
    },
  },
}