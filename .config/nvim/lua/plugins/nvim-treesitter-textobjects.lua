return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        vim.g.no_plugin_maps = true
    end,
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                selection_modes = {},
                include_surrounding_whitespace = false,
            },
            move = { set_jumps = true },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")
        local swap = require("nvim-treesitter-textobjects.swap")

        local sel = select.select_textobject
        local goto_next_start = move.goto_next_start
        local goto_next_end = move.goto_next_end
        local goto_prev_start = move.goto_previous_start
        local goto_prev_end = move.goto_previous_end
        local swap_next = swap.swap_next
        local swap_prev = swap.swap_previous

        -- select maps
        vim.keymap.set({ "x", "o" }, "af", function() sel("@function.outer") end,    { desc = "select around function" })
        vim.keymap.set({ "x", "o" }, "if", function() sel("@function.inner") end,    { desc = "select inside function" })
        vim.keymap.set({ "x", "o" }, "ac", function() sel("@class.outer") end,       { desc = "select around class" })
        vim.keymap.set({ "x", "o" }, "ic", function() sel("@class.inner") end,       { desc = "select inside class" })
        vim.keymap.set({ "x", "o" }, "ao", function() sel("@loop.outer") end,        { desc = "select around loop" })
        vim.keymap.set({ "x", "o" }, "io", function() sel("@loop.inner") end,        { desc = "select inside loop" })
        vim.keymap.set({ "x", "o" }, "an", function() sel("@conditional.outer") end, { desc = "select around conditional" })
        vim.keymap.set({ "x", "o" }, "in", function() sel("@conditional.inner") end, { desc = "select inside conditional" })
        vim.keymap.set({ "x", "o" }, "ak", function() sel("@block.outer") end,       { desc = "select around block" })
        vim.keymap.set({ "x", "o" }, "ik", function() sel("@block.inner") end,       { desc = "select inside block" })
        vim.keymap.set({ "x", "o" }, "aa", function() sel("@parameter.outer") end,   { desc = "select around argument" })
        vim.keymap.set({ "x", "o" }, "ia", function() sel("@parameter.inner") end,   { desc = "select inside argument" })
        vim.keymap.set({ "x", "o" }, "a/", function() sel("@comment.outer") end,   { desc = "select around comment" })
        vim.keymap.set({ "x", "o" }, "i/", function() sel("@comment.inner") end,   { desc = "select inside comment" })
        vim.keymap.set({ "x", "o" }, "a=", function() sel("@assignment.outer") end,   { desc = "select around assignment" })
        vim.keymap.set({ "x", "o" }, "i=", function() sel("@assignment.inner") end,   { desc = "select inside assignment" })
        vim.keymap.set({ "x", "o" }, "ah", function() sel("@header.outer") end,      { desc = "select around header" })
        vim.keymap.set({ "x", "o" }, "ih", function() sel("@header.inner") end,      { desc = "select inside header" })

        -- move maps
        vim.keymap.set({ "n", "x", "o" }, "]f", function() goto_next_start("@function.outer") end, { desc = "go to start of next function" })
        vim.keymap.set({ "n", "x", "o" }, "]F", function() goto_next_end("@function.outer") end, { desc = "go to end of next function" })
        vim.keymap.set({ "n", "x", "o" }, "[f", function() goto_prev_start("@function.outer") end, { desc = "go to start of previous function" })
        vim.keymap.set({ "n", "x", "o" }, "[F", function() goto_prev_end("@function.outer") end, { desc = "go to end of previous function" })
        vim.keymap.set({ "n", "x", "o" }, "]c", function() goto_next_start("@class.outer") end, { desc = "go to start of next class" })
        vim.keymap.set({ "n", "x", "o" }, "]C", function() goto_next_end("@class.outer") end, { desc = "go to end of next class" })
        vim.keymap.set({ "n", "x", "o" }, "[c", function() goto_prev_start("@class.outer") end, { desc = "go to start of previous class" })
        vim.keymap.set({ "n", "x", "o" }, "[C", function() goto_prev_end("@class.outer") end, { desc = "go to end of previous class" })
        vim.keymap.set({ "n", "x", "o" }, "]o", function() goto_next_start("@loop.outer") end, { desc = "go to start of next loop" })
        vim.keymap.set({ "n", "x", "o" }, "]O", function() goto_next_end("@loop.outer") end, { desc = "go to end of next loop" })
        vim.keymap.set({ "n", "x", "o" }, "[o", function() goto_prev_start("@loop.outer") end, { desc = "go to start of previous loop" })
        vim.keymap.set({ "n", "x", "o" }, "[O", function() goto_prev_end("@loop.outer") end, { desc = "go to end of previous loop" })
        vim.keymap.set({ "n", "x", "o" }, "]n", function() goto_next_start("@conditional.outer") end, { desc = "go to start of next conditional" })
        vim.keymap.set({ "n", "x", "o" }, "]N", function() goto_next_end("@conditional.outer") end, { desc = "go to end of next conditional" })
        vim.keymap.set({ "n", "x", "o" }, "[n", function() goto_prev_start("@conditional.outer") end, { desc = "go to start of previous conditional" })
        vim.keymap.set({ "n", "x", "o" }, "[N", function() goto_prev_end("@conditional.outer") end, { desc = "go to end of previous conditional" })
        vim.keymap.set({ "n", "x", "o" }, "]k", function() goto_next_start("@block.outer") end, { desc = "go to start of next block" })
        vim.keymap.set({ "n", "x", "o" }, "]K", function() goto_next_end("@block.outer") end, { desc = "go to end of next block" })
        vim.keymap.set({ "n", "x", "o" }, "[k", function() goto_prev_start("@block.outer") end, { desc = "go to start of previous block" })
        vim.keymap.set({ "n", "x", "o" }, "[K", function() goto_prev_end("@block.outer") end, { desc = "go to end of previous block" })
        vim.keymap.set({ "n", "x", "o" }, "]a", function() goto_next_start("@parameter.inner") end, { desc = "go to start of next argument" })
        vim.keymap.set({ "n", "x", "o" }, "]A", function() goto_next_end("@parameter.inner") end, { desc = "go to end of next argument" })
        vim.keymap.set({ "n", "x", "o" }, "[a", function() goto_prev_start("@parameter.inner") end, { desc = "go to start of previous argument" })
        vim.keymap.set({ "n", "x", "o" }, "[A", function() goto_prev_end("@parameter.inner") end, { desc = "go to end of previous argument" })
        vim.keymap.set({ "n", "x", "o" }, "]/", function() goto_next_start("@comment.outer") end, { desc = "go to start of next comment" })
        vim.keymap.set({ "n", "x", "o" }, "]?", function() goto_next_end("@comment.outer") end, { desc = "go to end of next comment" })
        vim.keymap.set({ "n", "x", "o" }, "[/", function() goto_prev_start("@comment.outer") end, { desc = "go to start of previous comment" })
        vim.keymap.set({ "n", "x", "o" }, "[?", function() goto_prev_end("@comment.outer") end, { desc = "go to end of previous comment" })
        vim.keymap.set({ "n", "x", "o" }, "]=", function() goto_next_start("@assignment.outer") end, { desc = "go to start of next assignment" })
        vim.keymap.set({ "n", "x", "o" }, "]+", function() goto_next_end("@assignment.outer") end, { desc = "go to end of next assignment" })
        vim.keymap.set({ "n", "x", "o" }, "[=", function() goto_prev_start("@assignment.outer") end, { desc = "go to start of previous assignment" })
        vim.keymap.set({ "n", "x", "o" }, "[+", function() goto_prev_end("@assignment.outer") end, { desc = "go to end of previous assignment" })
        vim.keymap.set({ "n", "x", "o" }, "]h", function() goto_next_start("@header.outer") end, { desc = "go to start of next header" })
        vim.keymap.set({ "n", "x", "o" }, "]H", function() goto_next_end("@header.outer") end, { desc = "go to end of next header" })
        vim.keymap.set({ "n", "x", "o" }, "[h", function() goto_prev_start("@header.outer") end, { desc = "go to start of previous header" })
        vim.keymap.set({ "n", "x", "o" }, "[H", function() goto_prev_end("@header.outer") end, { desc = "go to end of previous header" })

        -- swap maps
        vim.keymap.set("n", ">F", function() swap_next("@function.outer") end, { desc = "swap next function" })
        vim.keymap.set("n", "<F", function() swap_prev("@function.outer") end, { desc = "swap previous function" })
        vim.keymap.set("n", ">C", function() swap_next("@class.outer") end, { desc = "swap next class" })
        vim.keymap.set("n", "<C", function() swap_prev("@class.outer") end, { desc = "swap previous class" })
        vim.keymap.set("n", ">K", function() swap_next("@block.outer") end, { desc = "swap next block" })
        vim.keymap.set("n", "<K", function() swap_prev("@block.outer") end, { desc = "swap previous block" })
        vim.keymap.set("n", ">A", function() swap_next("@parameter.inner") end, { desc = "swap next argument" })
        vim.keymap.set("n", "<A", function() swap_prev("@parameter.inner") end, { desc = "swap previous argument" })

        local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

        -- TODO: try @code_cell for markdown code blocks
    end,
}
