return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bufdelete = {
            enabled = true,
        },
        explorer = {
            enabled = true,
            replace_netrw = true,
        },
        indent = {
            enabled = true,
            indent = { char = "▏" },
            scope = { char = "▏" },
        },
        lazygit = {
            enabled = true,
        },
        notifier = {
            enabled = true,
        },
        picker = {
            enabled = true,
            sources = { explorer = {
                auto_close = true,
            } },
        },
        scope = {
            enabled = true,
        },
        words = {
            enabled = true,
        },
    },
    keys = {
        {
            "<leader>c",
            function()
                Snacks.bufdelete()
            end,
            desc = "Delete buffer",
        },
        {
            "<leader>bd",
            function()
                Snacks.bufdelete()
            end,
            desc = "Delete buffer",
        },
        -- explorer
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
            desc = "Open explorer",
        },
        -- find general
        {
            "<leader>f<CR>",
            function()
                Snacks.picker.resume()
            end,
            desc = "Resume previous find",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Find buffers",
        },
        {
            "<leader>fn",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Find notifications",
        },
        {
            "<leader>fc",
            function()
                Snacks.picker.commands()
            end,
            desc = "Find commands",
        },
        {
            "<leader>fh",
            function()
                Snacks.picker.help()
            end,
            desc = "Find help",
        },
        {
            "<leader>fk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "Find keymaps",
        },
        {
            '<leader>f"',
            function()
                Snacks.picker.registers()
            end,
            desc = "Find registers",
        },
        {
            "<leader>fu",
            function()
                Snacks.picker.undo()
            end,
            desc = "Find undo history",
        },
        {
            "<leader>fd",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "Find diagnostics",
        },
        {
            "<leader>fD",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "Find buffer diagnostics",
        },
        -- find files
        {
            "<leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "Find files",
        },
        {
            "<leader>fF",
            function()
                Snacks.picker.files({ hidden = true, ignored = true })
            end,
            desc = "Find files (all files)",
        },
        {
            "<leader>fp",
            function()
                Snacks.picker.projects()
            end,
            desc = "Find projects",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Find recent",
        },
        -- find patterns
        {
            "<leader>fl",
            function()
                Snacks.picker.lines()
            end,
            desc = "Search current buffer lines",
        },
        {
            "<leader>f/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Search grep",
        },
        {
            "<leader>f?",
            function()
                Snacks.picker.grep({ hidden = true, ignored = true })
            end,
            desc = "Search grep (all files)",
        },
        {
            "<leader>fw",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Search word or visual selection",
            mode = { "n", "x" },
        },
        {
            "<leader>fo",
            function()
                Snacks.picker.grep_buffers()
            end,
            desc = "Search grep on open buffers",
        },
        -- lsp
        -- TODO: think abouth hiding these behind an autocommand for lsp attach
        {
            "<leader>ld",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto definition",
        },
        {
            "<leader>lD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto declaration",
        },
        {
            "<leader>lr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "<leader>li",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto implementation",
        },
        {
            "<leader>lt",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto type Definition",
        },
        {
            "<leader>lci",
            function()
                Snacks.picker.lsp_incoming_calls()
            end,
            desc = "Calls incoming",
        },
        {
            "<leader>lco",
            function()
                Snacks.picker.lsp_outgoing_calls()
            end,
            desc = "Calls outgoing",
        },
        {
            "<leader>ls",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>lS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },

        -- git
        {
            "<leader>gb",
            function()
                Snacks.picker.git_branches()
            end,
            desc = "Git branches",
        },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log()
            end,
            desc = "Git log",
        },
        {
            "<leader>gL",
            function()
                Snacks.picker.git_log({ current_file = true, follow = true })
            end,
            desc = "Git log (current file)",
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Delete buffer",
        },
    },
}
