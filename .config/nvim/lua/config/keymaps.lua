vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<Cmd>confirm q<CR>", { desc = "Quit window" })
vim.keymap.set("n", "<leader>Q", "<Cmd>confirm qall<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>n", "<Cmd>enew<CR>", { desc = "New file" })
vim.keymap.set("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<A-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<A-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })
vim.keymap.set("n", "<A-Up>", "<Cmd>resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<A-Down>", "<Cmd>resize +2<CR>", { desc = "Resize split down" })

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
