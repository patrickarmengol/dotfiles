return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "catppuccin",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      ruff_lsp = {
        on_attach = function(client, bufnr)
          -- disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
          -- organize imports via code action on save
          -- vim.api.nvim_create_autocmd("BufWritePre", {
          --   callback = function()
          --     local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
          --     params.context = { only = { "source.organizeImports" } }
          --
          --     local timeout = 1000 -- ms
          --     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout)
          --     for _, res in pairs(result or {}) do
          --       for _, r in pairs(res.result or {}) do
          --         if r.edit then
          --           vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
          --         else
          --           vim.lsp.buf.execute_command(r.command)
          --         end
          --       end
          --     end
          --   end,
          -- })
          -- vim.api.nvim_create_autocmd("BufWritePre", {
          --   buffer = bufnr,
          --   callback = function()
          --     vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
          --     vim.wait(100)
          --   end,
          -- })
        end,
      },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
