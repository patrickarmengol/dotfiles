---@type table<string, vim.lsp.Config>
local servers = {
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

for name, cfg in pairs(servers) do
    vim.lsp.config(name, cfg)
end

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

local M = {}
M.servers = servers
M.server_names = vim.tbl_keys(servers)
return M
