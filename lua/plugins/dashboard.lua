return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
  ad888                                                                888ba    
  88'       a8"            d8  88           88b           d88  "8a       `88    
  88      a8"            ,8P'  88           888b         d888    "8a      88    
  88    a8"             d8"    88           88`8b       d8'88      "8a    88    
 ,8P  a8"             ,8P'     88           88 `8b     d8' 88        "8a  Y8,   
88(   "8a            d8"       88           88  `8b   d8'  88        a8"   )88  
 "8b    "8a        ,8P'        88           88   `8b d8'   88      a8"    d8"   
  88      "8a     d8"          88           88    `888'    88    a8"      88    
  88        "8a  8P'           88888888888  88     `8'     88  a8"        88    
  88,                                                                    ,88    
  "Y888                                                                888P"    
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
}
