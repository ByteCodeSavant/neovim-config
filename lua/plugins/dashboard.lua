return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
                                                                     
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                     
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
  config = function(_, opts)
    -- Setup dashboard with theme-aware colors
    require("snacks").setup(opts)
    
    -- Set custom highlights for dashboard that match Kanagawa theme
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Get current colorscheme colors
        local colors = {}
        if vim.g.colors_name == "kanagawa" then
          -- Kanagawa theme colors
          colors = {
            header = "#7E9CD8",      -- Kanagawa blue
            icon = "#FF9E3B",        -- Kanagawa orange
            desc = "#DCD7BA",        -- Kanagawa foreground
            key = "#E6C384",         -- Kanagawa yellow
            footer = "#727169",      -- Kanagawa comment
          }
        else
          -- Fallback colors
          colors = {
            header = "#7aa2f7",      -- Tokyo Night blue
            icon = "#ff9e64",        -- Tokyo Night orange
            desc = "#c0caf5",        -- Tokyo Night foreground
            key = "#e0af68",         -- Tokyo Night yellow
            footer = "#565f89",      -- Tokyo Night comment
          }
        end
        
        -- Apply custom highlights
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = colors.header, bold = true })
        vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = colors.icon })
        vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = colors.desc })
        vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = colors.key, bold = true })
        vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = colors.footer, italic = true })
      end,
    })
  end,
}
