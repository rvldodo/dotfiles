return {
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
         -- add any options here
      },
      dependencies = {
         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
         "MunifTanjim/nui.nvim",
         -- OPTIONAL:
         --   `nvim-notify` is only needed, if you want to use the notification view.
         --   If not available, we use `mini` as the fallback
         "rcarriga/nvim-notify",
      },
      require("noice").setup({
         views = {
            cmdline_popup = {
               position = {
                  row = 5,
                  col = "50%",
               },
               size = {
                  width = 60,
                  height = "auto",
               },
            },
            popupmenu = {
               relative = "editor",
               position = {
                  row = 8,
                  col = "50%",
               },
               size = {
                  width = 60,
                  height = 10,
               },
               border = {
                  style = "rounded",
                  padding = { 0, 1 },
               },
               win_options = {
                  winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
               },
            },
         },
         lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
               ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
               ["vim.lsp.util.stylize_markdown"] = true,
               ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
         },
         -- you can enable a preset for easier configuration
         presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
         },

         focused = true,
         vim.api.nvim_create_autocmd("FocusGained", {
            callback = function()
               focused = true
            end,
         }),
         vim.api.nvim_create_autocmd("FocusLost", {
            callback = function()
               focused = false
            end,
         }),
      }),
   },
   -- {
   --    "nvimdev/dashboard-nvim",
   --    enabled = false,
   -- },
   {
      "nvim-lualine/lualine.nvim",
      enabled = false,
   },
   {
      "rcarriga/nvim-notify",
      opts = {
         timeout = 5000,
         background_colour = "#000000",
         render = "wrapped-compact",
      },
   },
   -- {
   --    "echasnovski/mini.animate",
   --    event = "VeryLazy",
   --    opts = function(_, opts)
   --       opts.scroll = {
   --          enable = false,
   --       }
   --    end,
   -- },
   -- {
   --    "b0o/incline.nvim",
   --    dependencies = {},
   --    event = "BufReadPre",
   --    priority = 1200,
   --    config = function()
   --       local helpers = require("incline.helpers")
   --       local devicons = require("nvim-web-devicons")
   --       require("incline").setup({
   --          window = {
   --             padding = 0,
   --             margin = { horizontal = 0 },
   --          },
   --          render = function(props)
   --             local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
   --             if filename == "" then
   --                filename = "[No Name]"
   --             end
   --             local ft_icon, ft_color = devicons.get_icon_color(filename)
   --             local modified = vim.bo[props.buf].modified
   --             return {
   --                ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
   --                " ",
   --                { filename, gui = modified and "bold,italic" or "bold" },
   --                " ",
   --                guibg = "#44406e",
   --             }
   --          end,
   --       })
   --    end,
   -- },
}
