return {
  {
    "3rd/image.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
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
    "HakonHarnes/img-clip.nvim",
    opts = {
      default = {
        dir_path = "images",
        file_name = "%Y-%m-%d-%H-%M-%S",
        prompt_for_file_name = false,
      },
    },
    keys = {
      {
        "<leader>ip",
        "<cmd>PasteImage<cr>",
        desc = "Paste clipboard image",
      },
    },
  },

  -- Which-key group for image commands
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>i", group = "image" },
      },
    },
  },
}
