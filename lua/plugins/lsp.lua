-- Keymaps

return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  -- {
  --   -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     'williamboman/mason.nvim',
  --     'williamboman/mason-lspconfig.nvim',
  --     -- { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
  --
  --     -- Additional lua configuration, makes nvim stuff amazing!
  --     'folke/neodev.nvim',
  --       "hrsh7th/cmp-nvim-lsp",
  --       "hrsh7th/cmp-buffer",
  --       "hrsh7th/cmp-path",
  --       "hrsh7th/cmp-cmdline",
  --       "hrsh7th/nvim-cmp",
  --       "L3MON4D3/LuaSnip",
  --       "saadparwaiz1/cmp_luasnip",
  --       "j-hui/fidget.nvim",
  --   },
  --   config = function()
  --     local on_attach = function(_, bufnr)
  --       local nmap = function(keys, func, desc)
  --         if desc then
  --           desc = 'LSP: ' .. desc
  --         end
  --
  --         vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  --       end
  --
  --       nmap('<leader>ra', vim.lsp.buf.rename, '[R]e[n]ame')
  --       nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  --
  --       nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  --       nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  --       nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  --       nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  --       nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  --       nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  --
  --       -- See `:help K` for why this keymap
  --       nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  --       -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  --
  --       -- Lesser used LSP functionality
  --       nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  --       nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  --       nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  --       nmap('<leader>wl', function()
  --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --       end, '[W]orkspace [L]ist Folders')
  --
  --       -- Create a command `:Format` local to the LSP buffer
  --       vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
  --         vim.lsp.buf.format()
  --       end, { desc = 'Format current buffer with LSP' })
  --     end
  --
  --     -- mason-lspconfig requires that these setup functions are called in this order
  --     -- before setting up the servers.
  --     require('mason').setup()
  --     require('mason-lspconfig').setup()
  --     -- Setup neovim lua configuration
  --     require('neodev').setup()
  --     local lsp = require('lspconfig')
  --
  --     local servers = {
  --       html = {},
  --       cssls = {},
  --       clangd = {},
  --       theme_check = {},
  --       emmet_ls = {
  --         filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'liquid' },
  --         init_options = {
  --           html = {
  --             options = {
  --               -- for possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#l79-l267
  --               ["bem.enabled"] = true,
  --             },
  --           },
  --         },
  --
  --       },
  --       marksman = {},
  --       tailwindcss = {},
  --       tsserver = {
  --         cmd = { "typescript-language-server", "--stdio" },
  --         filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  --         init_options = {
  --           hostInfo = "neovim"
  --         },
  --         root_dir = lsp.util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
  --         single_file_support = true,
  --       },
  --       -- html = { filetypes = { 'html', 'twig', 'hbs'} },
  --
  --       lua_ls = {
  --         Lua = {
  --           workspace = { checkThirdParty = false },
  --           telemetry = { enable = false },
  --         },
  --       },
  --     }
  --
  --     local border = {
  --       {"╭", "FloatBorder"},
  --       {"─", "FloatBorder"},
  --       {"╮", "FloatBorder"},
  --       {"│", "FloatBorder"},
  --       {"╯", "FloatBorder"},
  --       {"─", "FloatBorder"},
  --       {"╰", "FloatBorder"},
  --       {"│", "FloatBorder"},
  --     }
  --     -- LSP settings (for overriding per client)
  --     local handlers =  {
  --       ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  --       ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
  --     }
  --
  --     -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  --     local capabilities = vim.lsp.protocol.make_client_capabilities()
  --     capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  --
  --     -- Ensure the servers above are installed
  --     local mason_lspconfig = require 'mason-lspconfig'
  --
  --     mason_lspconfig.setup {
  --       ensure_installed = vim.tbl_keys(servers),
  --     }
  --
  --     mason_lspconfig.setup_handlers {
  --       function(server_name)
  --         require('lspconfig')[server_name].setup {
  --           capabilities = capabilities,
  --           on_attach = on_attach,
  --           settings = servers[server_name],
  --           filetypes = (servers[server_name] or {}).filetypes,
  --           handlers = handlers
  --         }
  --       end,
  --     }
  --
  --   end
  -- },


  -- theprimeagean's lsp file (w/o the cmp). Mine LSP was not working. 
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },

    config = function()
      -- local cmp = require('cmp')
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "emmet_ls"
        },
        handlers = {
          function(server_name) -- default handler (optional)

            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
            }
          end,

          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                  }
                }
              }
            }
          end,
          ["emmet_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.emmet_ls.setup {
              capabilities = capabilities,
              filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'liquid' },
              init_options = {
                html = {
                  options = {
                    -- for possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#l79-l267
                    ["bem.enabled"] = true,
                  },
                },
              },
            }
          end,
        }
      })


      -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
      --
      -- cmp.setup({
      --   snippet = {
      --     expand = function(args)
      --       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      --     end,
      --   },
      --   mapping = cmp.mapping.preset.insert({
      --     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      --     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      --     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      --     ["<C-Space>"] = cmp.mapping.complete(),
      --   }),
      --   sources = cmp.config.sources({
      --     { name = 'nvim_lsp' },
      --     { name = 'luasnip' }, -- For luasnip users.
      --   }, {
      --       { name = 'buffer' },
      --     })
      -- })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end
}
}
