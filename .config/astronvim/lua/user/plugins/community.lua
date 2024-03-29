return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- colorschemes
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- languages
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.html-css" },
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.go" },
  { "ray-x/go.nvim", enabled = false },

  -- utility
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.project.nvim-spectre" },
}
