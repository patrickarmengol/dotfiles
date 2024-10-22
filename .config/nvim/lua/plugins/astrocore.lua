-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 2, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        shiftwidth = 4, -- number of spaces for each level of indentation
        softtabstop = 4, -- number of spaces for backspace/delete operations
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["<A-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<A-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<A-1>"] = { function() require("astrocore.buffer").nav_to(1) end, desc = "Go to tab 1" },
        ["<A-2>"] = { function() require("astrocore.buffer").nav_to(2) end, desc = "Go to tab 2" },
        ["<A-3>"] = { function() require("astrocore.buffer").nav_to(3) end, desc = "Go to tab 3" },
        ["<A-4>"] = { function() require("astrocore.buffer").nav_to(4) end, desc = "Go to tab 4" },
        ["<A-5>"] = { function() require("astrocore.buffer").nav_to(5) end, desc = "Go to tab 5" },
        ["<A-6>"] = { function() require("astrocore.buffer").nav_to(6) end, desc = "Go to tab 6" },
        ["<A-7>"] = { function() require("astrocore.buffer").nav_to(7) end, desc = "Go to tab 7" },
        ["<A-8>"] = { function() require("astrocore.buffer").nav_to(8) end, desc = "Go to tab 8" },
        ["<A-9>"] = { function() require("astrocore.buffer").nav_to(9) end, desc = "Go to tab 9" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<C-/>"] = {
          function() require("Comment.api").toggle.linewise.count(vim.v.count1) end,
          desc = "Toggle comment line",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        ["<C-/>"] = {
          "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
          desc = "Toggle comment for selection",
        },
      },
    },
  },
}
