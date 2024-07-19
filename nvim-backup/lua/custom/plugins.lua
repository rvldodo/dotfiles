local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  { "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.formatter"
  --   end
  -- },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwindcss-language-server",
        "lua-language-server",
        "eslint-lsp",
        "js-debug-adapter",
        "prettierd",
        "gopls",
        "gofumpt",
        "golines",
        "gomodifytags",
        "goimports",
        "goimports-reviser",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      vim.api.nvim_create_autocmd("FileType", {
          pattern = {"markdown"},
          callback = function(ev)
                -- treesitter-context is buggy with Markdown files
              require("treesitter-context").disable()
          end
      })
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "json",
        "markdown",
        "proto",
        "sql",
        "yaml"
      }
      opts.auto_install = true
      opts.sync_install = false
      opts.highlight = {
            enable = true,
            disable = {"csv"} -- preferring chrisbra/csv.vim
      }
      opts.textobjects = {select = {enable = true, lookahead = true}}
      return opts
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    'simondrake/gomodifytags',
    dependencies = { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    vim.api.nvim_create_user_command('GoAddTags', function(opts) require('gomodifytags').GoAddTags(opts.fargs[1], opts.args) end, { nargs = "+" }),
    opts = {
      transformation = "snakecase",
      skip_unexported = true,
      override = true,
      options = { "json=omitempty" }
    },
  },
  -- {
  --   "dreamsofcode-io/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup({
  --       async_api_key_cmd = "pass show chatgpt/nvim",
  --     })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   },
  -- },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    init = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>sc"] = { ":Silicon<CR>", "Snapshot Code" },
      }, { mode = "v" })
    end,
    config = function()
      require("silicon").setup({
        font = "MesloLGL Nerd Font=20;MesloLGL Nerd Font Mono=20",
        theme = "Monokai Extended",
        background = "#fefefe",
        no_line_number = false,
        shadow_offset_x = 8,
	      shadow_offset_y = 8,
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
        end
      })
    end
  },
  {
    "wakatime/vim-wakatime",
    lazy = false
  },
  {
    "ray-x/navigator.lua",
    dependencies = {
        {"hrsh7th/nvim-cmp"}, {"nvim-treesitter/nvim-treesitter"},
        {"ray-x/guihua.lua", run = "cd lua/fzy && make"}, {
            "ray-x/go.nvim",
            event = {"CmdlineEnter"},
            ft = {"go", "gomod"},
            build = ':lua require("go.install").update_all_sync()'
        }, {
            "ray-x/lsp_signature.nvim", -- Show function signature when you type
            event = "VeryLazy",
            config = function() require("lsp_signature").setup() end
        }
    },
    config = function()
        require("go").setup()
        require("navigator").setup({
            lsp_signature_help = true, -- enable ray-x/lsp_signature
            lsp = {format_on_save = true}
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"go"},
            callback = function(ev)
                -- CTRL/control keymaps
                vim.api
                    .nvim_buf_set_keymap(0, "n", "<C-i>", ":GoImport<CR>", {})
                vim.api.nvim_buf_set_keymap(0, "n", "<C-b>", ":GoBuild %:h<CR>",
                                            {})
                vim.api.nvim_buf_set_keymap(0, "n", "<C-t>", ":GoTestPkg<CR>",
                                            {})
                vim.api.nvim_buf_set_keymap(0, "n", "<C-c>",
                                            ":GoCoverage -p<CR>", {})

                -- Opens test files
                vim.api.nvim_buf_set_keymap(0, "n", "A",
                                            ":lua require('go.alternate').switch(true, '')<CR>",
                                            {}) -- Test
                vim.api.nvim_buf_set_keymap(0, "n", "V",
                                            ":lua require('go.alternate').switch(true, 'vsplit')<CR>",
                                            {}) -- Test Vertical
                vim.api.nvim_buf_set_keymap(0, "n", "S",
                                            ":lua require('go.alternate').switch(true, 'split')<CR>",
                                            {}) -- Test Split
            end,
            group = vim.api.nvim_create_augroup("go_autocommands",
                                                {clear = true})
        })
    end
  },
  {
    "rhysd/vim-clang-format",
    init = function()
        vim.cmd([[
          autocmd FileType proto ClangFormatAutoEnable
        ]])
    end
  },
  {
    "kylechui/nvim-surround",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    event = "VeryLazy",
    version = "2.1.7",
    config = function() require("nvim-surround").setup() end
  }
}
return plugins
