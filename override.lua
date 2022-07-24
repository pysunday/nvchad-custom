-- 覆盖默认插件配置

local M = {}

-- 文件树显示git信息
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- 显示空格为" "
M.blankline = {
  show_end_of_line = true,
  space_char_blankline = " ",
}

return M
