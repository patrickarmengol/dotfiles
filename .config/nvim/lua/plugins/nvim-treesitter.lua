return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	lazy = false,
	config = function()
		local treesitter = require("nvim-treesitter")

		-- manually add to this list instead of auto-install
		local ensure_installed = {
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

		treesitter.install(ensure_installed)

		-- Ensure tree-sitter enabled after opening a file for target language
		local filetypes = {}
		for _, lang in ipairs(ensure_installed) do
			for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
				table.insert(filetypes, ft)
			end
		end
		local ts_start = function(ev) vim.treesitter.start(ev.buf) end
		

		local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Start treesitter",
			group = group,
			pattern = filetypes,
			callback = ts_start,
		})
	end,
}
