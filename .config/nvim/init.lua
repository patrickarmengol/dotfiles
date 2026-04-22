-- [[ globals ]]

-- set map leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ options ]]

-- enable relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- show which line your cursor is on
vim.o.cursorline = true

-- emable mouse mode for resizing splits
vim.o.mouse = "a"

-- disable mode display since covered by statusline
vim.o.showmode = false

-- sync clipboard between os and neovim
vim.o.clipboard = "unnamedplus"

-- enable break indent
vim.o.breakindent = true

-- store undo history between sessions
vim.o.undofile = true

-- case-insensitive searching unless \C or one or more capital letters in query
vim.o.ignorecase = true
vim.o.smartcase = true

-- enable signcolumn
vim.o.signcolumn = "yes"

-- decrease update time
vim.o.updatetime = 250

-- decrease mapped sequence wait time; displays which-key sooner
vim.o.timeoutlen = 300

-- configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- preview substitutions live, as you type!
vim.o.inccommand = "split"

-- set highlight on search
vim.o.hlsearch = true

-- tabs
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 4 -- amount to indent with << or >>
vim.o.tabstop = 4 -- how many spaces are shown per tab
vim.o.softtabstop = 4 -- how many spaces are applied when pressing tab
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true -- keep indentation from previous line

-- min num of lines above/below cursor on scroll
vim.o.scrolloff = 10

-- keep command line
vim.o.cmdheight = 1

-- enable true color support
vim.o.termguicolors = true

-- enable wrapping
vim.o.wrap = true

-- [[ keymaps ]]

vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<Cmd>confirm q<CR>", { desc = "Quit window" })
vim.keymap.set("n", "<leader>Q", "<Cmd>confirm qall<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>n", "<Cmd>enew<CR>", { desc = "New file" })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<A-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<A-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })
vim.keymap.set("n", "<A-Up>", "<Cmd>resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<A-Down>", "<Cmd>resize +2<CR>", { desc = "Resize split down" })

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Hover diagnostics" })

-- builtin lsp keymaps since 0.11
-- see :h lsp-defaults
-- gra : code actions
-- gri : implementation
-- grn : rename
-- grr : references
-- grt : type definition
-- gO : document symbols
-- <c-s> : signature help
-- <c-]> : definition

-- add missing useful lsp keymaps
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "vim.lsp.buf.definition()" })
vim.keymap.set("n", "grd", function()
	vim.lsp.buf.definition()
end, { desc = "vim.lsp.buf.definition()" })
vim.keymap.set("n", "grD", function()
	vim.lsp.buf.declaration()
end, { desc = "vim.lsp.buf.declaration()" })
vim.keymap.set("n", "gK", function()
	vim.lsp.buf.signature_help()
end, { desc = "vim.lsp.buf.signature_help()" })

-- [[ diagnostics ]]

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
})

-- [[ autocmds ]]

-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- [[ plugins ]]

--- catppuccin

vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }, { confirm = false })

vim.cmd.colorscheme("catppuccin-nvim")

--- snacks

vim.pack.add({ "https://github.com/folke/snacks.nvim" }, { confirm = false })

require("snacks").setup({
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
})

vim.keymap.set("n", "<leader>c", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })

vim.keymap.set("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "Toggle explorer" })

vim.keymap.set("n", "<leader>f<CR>", function()
	Snacks.picker.resume()
end, { desc = "Resume previous find" })
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fn", function()
	Snacks.picker.notifications()
end, { desc = "Find notifications" })
vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.commands()
end, { desc = "Find commands" })
vim.keymap.set("n", "<leader>fh", function()
	Snacks.picker.help()
end, { desc = "Find help" })
vim.keymap.set("n", "<leader>fk", function()
	Snacks.picker.keymaps()
end, { desc = "Find keymaps" })
vim.keymap.set("n", '<leader>f"', function()
	Snacks.picker.registers()
end, { desc = "Find registers" })
vim.keymap.set("n", "<leader>fu", function()
	Snacks.picker.undo()
end, { desc = "Find undo" })
vim.keymap.set("n", "<leader>fd", function()
	Snacks.picker.diagnostics()
end, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fD", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Find buffer diagnostics" })
vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fF", function()
	Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Find files (all)" })
vim.keymap.set("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { desc = "Find projects" })
vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Find recent" })
vim.keymap.set("n", "<leader>fl", function()
	Snacks.picker.lines()
end, { desc = "Search buffer lines" })
vim.keymap.set("n", "<leader>f/", function()
	Snacks.picker.grep()
end, { desc = "Search via grep" })
vim.keymap.set("n", "<leader>f?", function()
	Snacks.picker.grep({ hidden = true, ignored = true })
end, { desc = "Search via grep (all)" })
vim.keymap.set({ "n", "x" }, "<leader>fw", function()
	Snacks.picker.grep_word()
end, { desc = "Search word or visual selection" })
vim.keymap.set("n", "<leader>fo", function()
	Snacks.picker.grep_buffers()
end, { desc = "Search via grep in open buffers" })

vim.keymap.set("n", "<leader>ld", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto definition" })
vim.keymap.set("n", "<leader>lD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto declaration" })
vim.keymap.set("n", "<leader>lr", function()
	Snacks.picker.lsp_references()
end, { desc = "References" })
vim.keymap.set("n", "<leader>li", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto implementation" })
vim.keymap.set("n", "<leader>lt", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto type definition" })
vim.keymap.set("n", "<leader>lci", function()
	Snacks.picker.lsp_incoming_calls()
end, { desc = "Calls incoming" })
vim.keymap.set("n", "<leader>lco", function()
	Snacks.picker.lsp_outgoing_calls()
end, { desc = "Calls outgoing" })
vim.keymap.set("n", "<leader>ls", function()
	Snacks.picker.lsp_symbols()
end, { desc = "Symbols" })
vim.keymap.set("n", "<leader>lS", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "Workspace symbols" })

vim.keymap.set("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git log" })
vim.keymap.set("n", "<leader>gL", function()
	Snacks.picker.git_log({ current_file = true, follow = true })
end, { desc = "Git log (current file)" })
vim.keymap.set("n", "<leader>gg", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

--- nvim-treesitter

vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } }, { confirm = false })

-- manually add to this list instead of auto-install
local ts_parsers = {
	"bash",
	"c",
	"cpp",
	"css",
	"diff",
	"dockerfile",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"toml",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

require("nvim-treesitter").install(ts_parsers)

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Call TSUpdate on nvim-treesitter update",
	group = vim.api.nvim_create_augroup("nvim-treesitter-hook", { clear = true }),
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

-- ensure tree-sitter enabled after opening a file for target language
local filetypes = {}
for _, lang in ipairs(ts_parsers) do
	for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
		table.insert(filetypes, ft)
	end
end

vim.api.nvim_create_autocmd("FileType", {
	desc = "Start treesitter",
	group = vim.api.nvim_create_augroup("treesitter-config", { clear = true }),
	pattern = filetypes,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end, -- TODO: maybe add fold and indent
})

--- nvim-treesitter-textobjects

vim.pack.add(
	{ { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" } },
	{ confirm = false }
)

vim.g.no_plugin_maps = true

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
vim.keymap.set({ "x", "o" }, "af", function()
	sel("@function.outer")
end, { desc = "select around function" })
vim.keymap.set({ "x", "o" }, "if", function()
	sel("@function.inner")
end, { desc = "select inside function" })
vim.keymap.set({ "x", "o" }, "ac", function()
	sel("@class.outer")
end, { desc = "select around class" })
vim.keymap.set({ "x", "o" }, "ic", function()
	sel("@class.inner")
end, { desc = "select inside class" })
vim.keymap.set({ "x", "o" }, "ao", function()
	sel("@loop.outer")
end, { desc = "select around loop" })
vim.keymap.set({ "x", "o" }, "io", function()
	sel("@loop.inner")
end, { desc = "select inside loop" })
vim.keymap.set({ "x", "o" }, "ak", function()
	sel("@block.outer")
end, { desc = "select around block" })
vim.keymap.set({ "x", "o" }, "ik", function()
	sel("@block.inner")
end, { desc = "select inside block" })
vim.keymap.set({ "x", "o" }, "aa", function()
	sel("@parameter.outer")
end, { desc = "select around argument" })
vim.keymap.set({ "x", "o" }, "ia", function()
	sel("@parameter.inner")
end, { desc = "select inside argument" })
vim.keymap.set({ "x", "o" }, "a/", function()
	sel("@comment.outer")
end, { desc = "select around comment" })
vim.keymap.set({ "x", "o" }, "i/", function()
	sel("@comment.inner")
end, { desc = "select inside comment" })
vim.keymap.set({ "x", "o" }, "a=", function()
	sel("@assignment.outer")
end, { desc = "select around assignment" })
vim.keymap.set({ "x", "o" }, "i=", function()
	sel("@assignment.inner")
end, { desc = "select inside assignment" })
vim.keymap.set({ "x", "o" }, "ah", function()
	sel("@header.outer")
end, { desc = "select around header" })
vim.keymap.set({ "x", "o" }, "ih", function()
	sel("@header.inner")
end, { desc = "select inside header" })

-- move maps
vim.keymap.set({ "n", "x", "o" }, "]f", function()
	goto_next_start("@function.outer")
end, { desc = "go to start of next function" })
vim.keymap.set({ "n", "x", "o" }, "]F", function()
	goto_next_end("@function.outer")
end, { desc = "go to end of next function" })
vim.keymap.set({ "n", "x", "o" }, "[f", function()
	goto_prev_start("@function.outer")
end, { desc = "go to start of previous function" })
vim.keymap.set({ "n", "x", "o" }, "[F", function()
	goto_prev_end("@function.outer")
end, { desc = "go to end of previous function" })
vim.keymap.set({ "n", "x", "o" }, "]c", function()
	goto_next_start("@class.outer")
end, { desc = "go to start of next class" })
vim.keymap.set({ "n", "x", "o" }, "]C", function()
	goto_next_end("@class.outer")
end, { desc = "go to end of next class" })
vim.keymap.set({ "n", "x", "o" }, "[c", function()
	goto_prev_start("@class.outer")
end, { desc = "go to start of previous class" })
vim.keymap.set({ "n", "x", "o" }, "[C", function()
	goto_prev_end("@class.outer")
end, { desc = "go to end of previous class" })
vim.keymap.set({ "n", "x", "o" }, "]o", function()
	goto_next_start("@loop.outer")
end, { desc = "go to start of next loop" })
vim.keymap.set({ "n", "x", "o" }, "]O", function()
	goto_next_end("@loop.outer")
end, { desc = "go to end of next loop" })
vim.keymap.set({ "n", "x", "o" }, "[o", function()
	goto_prev_start("@loop.outer")
end, { desc = "go to start of previous loop" })
vim.keymap.set({ "n", "x", "o" }, "[O", function()
	goto_prev_end("@loop.outer")
end, { desc = "go to end of previous loop" })
vim.keymap.set({ "n", "x", "o" }, "]k", function()
	goto_next_start("@block.outer")
end, { desc = "go to start of next block" })
vim.keymap.set({ "n", "x", "o" }, "]K", function()
	goto_next_end("@block.outer")
end, { desc = "go to end of next block" })
vim.keymap.set({ "n", "x", "o" }, "[k", function()
	goto_prev_start("@block.outer")
end, { desc = "go to start of previous block" })
vim.keymap.set({ "n", "x", "o" }, "[K", function()
	goto_prev_end("@block.outer")
end, { desc = "go to end of previous block" })
vim.keymap.set({ "n", "x", "o" }, "]a", function()
	goto_next_start("@parameter.inner")
end, { desc = "go to start of next argument" })
vim.keymap.set({ "n", "x", "o" }, "]A", function()
	goto_next_end("@parameter.inner")
end, { desc = "go to end of next argument" })
vim.keymap.set({ "n", "x", "o" }, "[a", function()
	goto_prev_start("@parameter.inner")
end, { desc = "go to start of previous argument" })
vim.keymap.set({ "n", "x", "o" }, "[A", function()
	goto_prev_end("@parameter.inner")
end, { desc = "go to end of previous argument" })
vim.keymap.set({ "n", "x", "o" }, "]/", function()
	goto_next_start("@comment.outer")
end, { desc = "go to start of next comment" })
vim.keymap.set({ "n", "x", "o" }, "]?", function()
	goto_next_end("@comment.outer")
end, { desc = "go to end of next comment" })
vim.keymap.set({ "n", "x", "o" }, "[/", function()
	goto_prev_start("@comment.outer")
end, { desc = "go to start of previous comment" })
vim.keymap.set({ "n", "x", "o" }, "[?", function()
	goto_prev_end("@comment.outer")
end, { desc = "go to end of previous comment" })
vim.keymap.set({ "n", "x", "o" }, "]=", function()
	goto_next_start("@assignment.outer")
end, { desc = "go to start of next assignment" })
vim.keymap.set({ "n", "x", "o" }, "]+", function()
	goto_next_end("@assignment.outer")
end, { desc = "go to end of next assignment" })
vim.keymap.set({ "n", "x", "o" }, "[=", function()
	goto_prev_start("@assignment.outer")
end, { desc = "go to start of previous assignment" })
vim.keymap.set({ "n", "x", "o" }, "[+", function()
	goto_prev_end("@assignment.outer")
end, { desc = "go to end of previous assignment" })
vim.keymap.set({ "n", "x", "o" }, "]h", function()
	goto_next_start("@header.outer")
end, { desc = "go to start of next header" })
vim.keymap.set({ "n", "x", "o" }, "]H", function()
	goto_next_end("@header.outer")
end, { desc = "go to end of next header" })
vim.keymap.set({ "n", "x", "o" }, "[h", function()
	goto_prev_start("@header.outer")
end, { desc = "go to start of previous header" })
vim.keymap.set({ "n", "x", "o" }, "[H", function()
	goto_prev_end("@header.outer")
end, { desc = "go to end of previous header" })

-- swap maps
vim.keymap.set("n", ">F", function()
	swap_next("@function.outer")
end, { desc = "swap next function" })
vim.keymap.set("n", "<F", function()
	swap_prev("@function.outer")
end, { desc = "swap previous function" })
vim.keymap.set("n", ">C", function()
	swap_next("@class.outer")
end, { desc = "swap next class" })
vim.keymap.set("n", "<C", function()
	swap_prev("@class.outer")
end, { desc = "swap previous class" })
vim.keymap.set("n", ">K", function()
	swap_next("@block.outer")
end, { desc = "swap next block" })
vim.keymap.set("n", "<K", function()
	swap_prev("@block.outer")
end, { desc = "swap previous block" })
vim.keymap.set("n", ">A", function()
	swap_next("@parameter.inner")
end, { desc = "swap next argument" })
vim.keymap.set("n", "<A", function()
	swap_prev("@parameter.inner")
end, { desc = "swap previous argument" })

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- TODO: try @code_cell for markdown code blocks

vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
}, { confirm = false })

require("blink.cmp").setup({
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" }, -- TODO: maybe change to cancel
		["<CR>"] = { "accept", "fallback" },
		["<C-y>"] = { "select_and_accept", "fallback" },

		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "show" },
		["<C-n>"] = { "select_next", "show" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },

		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },

		["<C-f>"] = { "show_signature", "hide_signature", "fallback" },
	},

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = {
		documentation = { auto_show = false },
		-- Modify behavior for completion selection list
		list = { selection = { preselect = false, auto_insert = false } },
	},

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },

	signature = {
		enabled = false,
	},
})

--- lsp

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/j-hui/fidget.nvim", -- lsp progress; TODO: maybe override notify vs snacks
}, { confirm = false })

local language_servers = {
	-- bash
	bashls = {},
	-- lua
	lua_ls = {
		-- recommended in default config comments for vim support
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = { "lua/?.lua", "lua/?/init.lua" },
				},
				workspace = {
					checkThirdParty = false,
					library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
						"${3rd}/luv/library",
						"${3rd}/busted/library",
					}),
				},
			})
		end,
		settings = {
			Lua = {},
		},
	},
	-- rust
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				files = {
					excludeDirs = {
						".direnv",
						".git",
						"target",
					},
				},
				check = {
					command = "clippy",
					extraArgs = {
						"--no-deps",
					},
				},
			},
		},
	},
}

-- autocommand to set up stuff when lsp is attached
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		-- highlight references of word under cursor
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- toggle inlay hints
		if client and client:supports_method("textDocument/inlayHint", event.buf) then
			vim.keymap.set("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, { desc = "[T]oggle Inlay [H]ints" })
		end
	end,
})

--- conform

vim.pack.add({ "https://github.com/stevearc/conform.nvim" }, { confirm = false })

local formatters_by_ft = {
	lua = { "stylua" },
	rust = { "rustfmt" },
	markdown = { "prettierd" },
}

-- TODO: does this need to move to after mason?
require("conform").setup({
	formatters_by_ft = formatters_by_ft,
	format_on_save = { timeout = 500, lsp_format = "fallback" },
})

--- mason

vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
}, { confirm = false })

local tools = {}
vim.list_extend(tools, vim.tbl_keys(language_servers))
vim.list_extend(tools, vim.iter(vim.tbl_values(formatters_by_ft)):flatten():unique():totable())
vim.list_extend(tools, {
	-- other tools
})

local tools_to_skip = {
	rust_analyzer = true,
	rustfmt = true,
}
tools = vim.tbl_filter(function(entry)
	local name = type(entry) == "table" and entry[1] or entry
	return not tools_to_skip[name]
end, tools)

require("mason").setup({})
require("mason-lspconfig").setup({
	automatic_enable = false,
})
require("mason-tool-installer").setup({
	ensure_installed = tools,
	auto_update = true,
})

for name, cfg in pairs(language_servers) do
	vim.lsp.config(name, cfg)
	vim.lsp.enable(name)
end

--- bufferline

vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons", -- TODO: should this be pre-snacks?
	"https://github.com/akinsho/bufferline.nvim",
}, { confirm = false })

require("bufferline").setup({
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
})

vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers to the left in line" })
vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close buffers to the right in line" })
vim.keymap.set("n", "<leader>bb", "<Cmd>BufferLinePick<CR>", { desc = "Pick buffer in line" })
vim.keymap.set("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Go to left buffer in line" })
vim.keymap.set("n", "]b", "<Cmd>BufferLineCycleNext<CR>", { desc = "Go to right buffer in line" })
vim.keymap.set("n", "<b", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left in line" })
vim.keymap.set("n", ">b", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right in line" })

--- guess-indent

vim.pack.add({ "https://github.com/NMAC427/guess-indent.nvim" }, { confirm = false })

require("guess-indent").setup({})

--- mini-statusline

vim.pack.add({ "https://github.com/nvim-mini/mini.statusline" }, { confirm = false })

require("mini.statusline").setup({})

--- nvim-autopairs

vim.pack.add({ "https://github.com/windwp/nvim-autopairs" }, { confirm = false })

require("nvim-autopairs").setup({})

--- nvim-surround
vim.pack.add(
	{ { src = "https://github.com/kylechui/nvim-surround", version = vim.version.range("4.x") } },
	{ confirm = false }
)

require("nvim-surround").setup({})

--- which-key
-- TODO: move to end

vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

require("which-key").setup({})

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer local keymaps (which-key)" })
