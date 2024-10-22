local util = require("lspconfig.util")

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    lazy = false,
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Add clippy lints for Rust.
            checkOnSave = true,
            -- checkOnSave = {
            --   allFeatures = true,
            --   command = "clippy-driver",
            --   extraArgs = {
            --     "--",
            --     "--no-deps",
            --     "-Dclippy::correctness",
            --     "-Dclippy::complexity",
            --     "-Wclippy::perf",
            --     "-Wclippy::pedantic",
            --   },
            -- },
            procMacro = {
              enable = true,
              ignored = {
                -- ["async-trait"] = { "async_trait" },
                -- ["napi-derive"] = { "napi" },
                -- ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
      if vim.fn.executable("rust-analyzer") == 0 then
        LazyVim.error(
          "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
          { title = "rustaceanvim" }
        )
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = {
          -- cmd = {
          --   "tsx",
          --   "/Users/pjtatlow/projects/graphql/graphiql/packages/graphql-language-service-cli/src/cli.ts",
          --   "server",
          --   "-m",
          --   "stream",
          -- },
          cmd = { "graphql-lsp", "server", "-m", "stream" },
          filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
          root_dir = util.root_pattern(".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
        },
        prismals = {
          cmd = { "prisma-language-server", "--stdio" },
          filetypes = { "prisma" },
          root_dir = util.root_pattern(".git", "package.json"),
        },
        zls = {
          cmd = { "zls" },
          filetypes = { "zig" },
          root_dir = util.root_pattern(".git", "zig.json"),
          settings = {},
        },
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 16384,
              },
            },
          },
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },

      -- setup = {
      --   function()
      --     require("lspconfig").graphql.setup({
      --       on_attach = require("lazyvim.util").lsp.on_attach,
      --     })
      --     return true
      --   end,
      -- },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "prisma",
        "graphql",
        "zig",
      },
    },
  },
}
