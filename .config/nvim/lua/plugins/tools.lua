return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        { "mason-org/mason.nvim", opts = {} },
        { "mason-org/mason-lspconfig.nvim", opts = {} },
    },
    config = function()
        local tools = {}
        vim.list_extend(tools, require("config.lsp").server_names)
        vim.list_extend(tools, require("config.formatting").formatter_names)
        vim.list_extend(tools, {
            -- other tools
        })

        local skip = {
            rust_analyzer = true,
            rustfmt = true,
        }
        tools = vim.tbl_filter(function(name)
            return not skip[name]
        end, tools)

        require("mason-tool-installer").setup({
            ensure_installed = tools,
        })
    end,
}
