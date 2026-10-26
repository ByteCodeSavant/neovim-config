return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      overrides = function(colors)
        local p = colors.palette
        return {
          SnacksPicker = { bg = colors.theme.ui.bg },
          SnacksDashboardHeader = { fg = p.crystalBlue, bold = true },
          SnacksDashboardIcon = { fg = p.roninYellow },
          SnacksDashboardDesc = { fg = p.fujiWhite },
          SnacksDashboardKey = { fg = p.carpYellow, bold = true },
          SnacksDashboardFooter = { fg = p.fujiGray, italic = true },
          GitSignsAddLn = { bg = "#2d5a3f" },
          GitSignsChangeLn = { bg = "#5d5530" },
          GitSignsDeleteLn = { bg = "#5d2f34" },
        }
      end,
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "kanagawa" } },
}
