-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- lvim.colorscheme = "gruvbox-material"
lvim.colorscheme = "peachpuff"
-- lvim.colorscheme = "catppuccin-macchiato"

lvim.plugins = {
    "lambdalisue/suda.vim",
    "pocco81/AutoSave.nvim",
    "git@github.com:sainnhe/gruvbox-material.git",
    "git@github.com:morhetz/gruvbox.git",
    "git@github.com:NTBBloodbath/sweetie.nvim",
    "git@github.com:catppuccin/nvim.git",
    "git@github.com:mstcl/dmg.git",
}

-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
  "bash",
}
