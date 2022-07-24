local M = {}

local override = require "custom.override"

M.plugins = {

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },

    statusline = {
      separator_style = "round",
    },
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    ["nvim-telescope/telescope.nvim"] = {
      defaults = {
        initial_mode = "normal",
        prompt_prefix = " 🔍 ",
      },
    },
    ["lewis6991/gitsigns.nvim"] = {
      -- 显示最近修改
      current_line_blame = true,
      -- 修改行行号颜色标记
      numhl = true,
      -- 修改行行标记
      linehl = true,
      -- 变更文本标记
      word_diff = false,
      current_line_blame_opts = {
        delay = 300,
      },
    },
  },

  user = require "custom.plugins",

  remove = {
    -- "folke/which-key.nvim",
  },
}

M.ui = {
  theme = "gruvchad",
  hl_override = require "custom.highlights",
}

M.mappings = require "custom.mappings"

return M
