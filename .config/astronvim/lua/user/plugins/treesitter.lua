local utils = require "astrocommunity.utils"
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if not opts.ensure_installed then
      opts.ensure_installed = {}
    elseif opts.ensure_installed == "all" then
      return
    end
    utils.list_insert_unique(opts.ensure_installed, { "python" })
  end
}
