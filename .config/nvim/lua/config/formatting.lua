local M = {}

M.formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    markdown = { "prettierd" },
}

-- Deduplicated flat list of all formatter names
M.formatter_names = vim.fn.uniq(vim.tbl_flatten(vim.tbl_values(M.formatters_by_ft)))

return M
