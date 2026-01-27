-- This file overrides LazyVim's default gitsigns configuration
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = function()
      -- Define highlight groups with high-contrast colors
      vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = "#2d5a3f" })
      vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = "#5d5530" })
      vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = "#5d2f34" })

      -- Also set them on colorscheme change
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = "#2d5a3f" })
          vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = "#5d5530" })
          vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = "#5d2f34" })
        end,
      })

      return {
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = true, -- Enable line highlights by default
        word_diff = false,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 500,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = " <author> • <author_time:%Y-%m-%d> • <summary>",
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          -- Navigation
          map("n", "]h", gs.next_hunk, "Next Hunk")
          map("n", "[h", gs.prev_hunk, "Prev Hunk")

          -- Actions
          map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
          map("v", "<leader>gs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "Stage Hunk")
          map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
          map("v", "<leader>gr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "Reset Hunk")
          map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
          map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
          map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
          map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
          map("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end, "Blame Line")
          map("n", "<leader>gB", function()
            gs.blame()
          end, "Blame File")
          map("n", "<leader>gd", gs.diffthis, "Diff This")
          map("n", "<leader>gD", function()
            gs.diffthis("~")
          end, "Diff This ~")

          -- Toggle
          map("n", "<leader>gtb", gs.toggle_current_line_blame, "Toggle Blame")
          map("n", "<leader>gtd", gs.toggle_deleted, "Toggle Deleted")
          map("n", "<leader>gth", gs.toggle_linehl, "Toggle Line Highlights")

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
        end,
      }
    end,
  },

  -- Which-key groups for git commands
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>g", group = "git" },
        { "<leader>gt", group = "toggle" },
      },
    },
  },
}
