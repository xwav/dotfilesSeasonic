return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    enabled = true,
    config = function()
      require("nvim-web-devicons").setup({
        color_icons = true,
        default = true,
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- Set up Neo-tree
      require("neo-tree").setup({
        window = {
          mappings = {
            ["P"] = {
              "toggle_preview",
              config = {
                use_float = false,
                -- use_image_nvim = true,
                -- use_snacks_image = true,
                -- title = 'Neo-tree Preview',
              },
            },
          },
        },
      })

      -- Keymap to toggle Neo-tree sidebar
      vim.keymap.set("n", "<leader>\\", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree", silent = true })
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
