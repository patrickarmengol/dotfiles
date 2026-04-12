return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = require("config.formatting").formatters_by_ft,
        format_on_save = { timeout = 500, lsp_format = "fallback" },
    },
}
