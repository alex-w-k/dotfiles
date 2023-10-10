local neorgc = require("neorg.core")
local config = neorgc.config

require('neorg').setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {
      }, -- Adds pretty icons to your documents
      ["core.export"] = {},
      -- ["core.ui.calendar"] = {},
      ["core.summary"] = {},
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = 'notes',
        },
      },
      ["core.journal"] = {
        config = {
          strategy = 'nested'
        }
      },
      ["core.esupports.metagen"] = {
        config = {
          type = "auto",
          -- template = {
          --   {
          --     "title",
          --     function()
          --       return  vim.fn.expand("%:p:t:r")
          --     end
          --   },
          --   { "description", "" },
          --   { "authors", "Alex Koch" },
          --   { "categories", "" },
          --   { "created", os.date("%Y-%m-%d"), },
          --   { "updated", os.date("%Y-%m-%d"), },
          --   {
          --     "version",
          --     function()
          --       return config.norg_version
          --     end,
          --   }
          -- },
        }
      },
    },
  }
  vim.wo.conceallevel = 2
