local util = require("lspconfig.util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = {
          cmd = {
            "tsx",
            "/Users/pjtatlow/projects/graphql/graphiql/packages/graphql-language-service-cli/src/cli.ts",
            "server",
            "-m",
            "stream",
          },
          -- cmd = { "graphql-lsp", "server", "-m", "stream" },
          filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
          root_dir = util.root_pattern(".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
        },
        prismals = {
          cmd = { "prisma-language-server", "--stdio" },
          filetypes = { "prisma" },
          root_dir = util.root_pattern(".git", "package.json"),
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
      },
    },
  },
}
