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
  -- { import = "astrocommunity.pack.python" },
  {
    "linux-cultist/venv-selector.nvim",
    enabled = false,
  },
}
