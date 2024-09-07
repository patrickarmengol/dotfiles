-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- colorschemes
  { import = "astrocommunity.colorscheme.catppuccin" },


  -- data/markup languages
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.html-css" },


  -- programming languages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { "ray-x/go.nvim", enabled = false }, -- remove bloat from go pack
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },

  -- utility
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.search.nvim-spectre" },
}
