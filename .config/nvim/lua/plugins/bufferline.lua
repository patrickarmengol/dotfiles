return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close buffers to the left" },
        { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close buffers to the right" },
        { "<leader>bb", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer" },
        { "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Go to left buffer" },
        { "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Go to right buffer" },
        { "<b", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer left" },
        { ">b", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer right" },
    },
    opts = {
        options = {
            -- stylua: ignore
            close_command = function(n) Snacks.bufdelete(n) end,
            -- stylua: ignore
            right_mouse_command = function(n) Snacks.bufdelete(n) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            offsets = {
                {
                    filetype = "snacks_layout_box",
                    text = "󰙅  File Explorer",
                    separator = true,
                },
            },
        },
    },
}
