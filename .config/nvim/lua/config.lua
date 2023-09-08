require('lualine').setup {
  extensions = { chadtree },
  options = {
    theme = 'gruvbox_dark'
  },
  sections = {
    lualine_a = { 'g:coc_status', 'mode' },
    lualine_d = {
      {
        'branch', 'diff', 'diagnostics',
        -- Table of diagnostic sources, available sources are:
        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
        -- or a function that returns a table as such:
        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
        sources = { 'coc', 'ale', 'nvim_diagnostic' },

        -- Displays diagnostics for the defined severity types
        sections = { 'error', 'warn', 'info', 'hint' },

        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = 'DiagnosticError', -- Changes diagnostics' error color.
          warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
          info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
          hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
        },
        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
        colored = true,           -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false,   -- Show diagnostics even if there are none.
      }
    },
  },
}

require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
                default_workspace = 'notes',
            },
        },
         ["core.journal"] = {
           config = {
             strategy = 'flat'
           },
        },
    },
}

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "ansiblels", "bashls", "bicep", "efm", "dockerls", "docker_compose_language_service", "vale_ls", "ruby_ls", "terraformls", "vimls", "yamlls"},
  automatic_installation = true,
}

-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
local ansible_lint = require('efmls-configs.linters.ansible_lint')
local shellcheck = require('efmls-configs.linters.shellcheck')
local flake8 = require('efmls-configs.linters.flake8')
local terraform_fmt = require('efmls-configs.formatters.terraform_fmt')
local vint = require('efmls-configs.linters.vint')
local languages = {
  ['yaml.ansible'] = { ansible_lint },
  bash = { shellcheck },
  python = { flake8 },
  terraform = { terraform_fmt },
  vim = { vint },
}
local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}
require("lspconfig").ansiblels.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").bicep.setup {}
require("lspconfig").docker_compose_language_service.setup {}
require("lspconfig").dockerls.setup {}
require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
  -- Pass your custom lsp config below like on_attach and capabilities
  --
  -- on_attach = on_attach,
  -- capabilities = capabilities,
}))
require("lspconfig").lua_ls.setup {}
require("lspconfig").ruby_ls.setup {}
require("lspconfig").terraformls.setup {}
require("lspconfig").vale_ls.setup {
  filetypes = {
    "markdown",
    "text",
    "norg"
  }
}
require("lspconfig").vimls.setup {}
require("lspconfig").yamlls.setup {}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
