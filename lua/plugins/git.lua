return {
  {
    "vincent178/nvim-github-linker",
    opts = {
      mappings = true,
      default_remote = "origin",
      copy_to_clipboard = true,
    },
    keys = {
      { "<leader>gy", "<cmd>GithubLink<cr>", desc = "GithubLink" },
    },
  },
  -- {
  --   "f-person/git-blame.nvim",
  --
  --   opts = {
  --     date_format = "%a %b %d %Y %X",
  --   },
  --   -- keys = {
  --   --   { "<leader>gu", "<cmd>GitBlameOpenFileURL<cr>", desc = "GitBlameOpenFileURL" },
  --   -- },
  -- },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      signs_staged_enable = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "]g", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]g", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Next Hunk" })

        map("n", "[g", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[g", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Prev Hunk" })

        map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
        map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end)
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
      end,
    },
    -- config = function()
    --   require("gitsigns").setup()
    -- end,
  },
}
