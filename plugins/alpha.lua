local present, alpha = pcall(require, "alpha")

if not present then
   return
end

require("base46").load_highlight "alpha"

local function button(sc, txt, keybind)
   local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

   local opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 36,
      align_shortcut = "right",
      hl = "AlphaButtons",
   }

   if keybind then
      opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
   end

   return {
      type = "button",
      val = txt,
      on_press = function()
         local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
         vim.api.nvim_feedkeys(key, "normal", false)
      end,
      opts = opts,
   }
end

local options = {}

local ascii = {
  "                  _oo0oo_",
  "                 o8888888o",
  "                 88\" . \"88",
  "                 (| -_- |)",
  "                 0\\  =  /0",
  "               ___/`---'\\___",
  "             .' \\|     |// '.",
  "            / \\|||  :  |||// \\",
  "           / _||||| -:- |||||- \\",
  "          |   | \\  -  /// |     |",
  "          | \\_|  ''\\---/''  |_/ |",
  "          \\  .-\\__  '-'  ___/-. /",
  "        ___'. .'  /--.--\\  `. .'___",
  "     .\"\" '<  `.___\\_<|>_/___.' >' \"\".",
  "    | | :  `- \\`.;`\\ _ /`;.`/ - ` : | |",
  "    \\  \\ `_.   \\_ __\\ /__ _/   .-` /  /",
  "=====`-.____`.___ \\_____/___.-`___.-'=====",
  "                  `=---='",
  "",
  "                用代码改变世界",
}

options.header = {
  type = "text",
  val = ascii,
  opts = {
    position = "center",
    hl = "AlphaHeader",
  },
}

options.buttons = {
  type = "group",
  val = {
    button("SPC f f", "  查找文件", ":Telescope find_files<CR>"),
    button("SPC f o", "  最近打开", ":Telescope oldfiles<CR>"),
    button("SPC f w", "  查找文本", ":Telescope live_grep<CR>"),
    button("SPC b m", "  书签", ":Telescope marks<CR>"),
    button("SPC t h", "  主题", ":Telescope themes<CR>"),
    button("SPC e s", "  设置", ":e $MYVIMRC | :cd %:p:h <CR>"),
  },
  opts = {
    spacing = 1,
  },
}

options = require("core.utils").load_override(options, "goolord/alpha-nvim")

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

alpha.setup {
  layout = {
    { type = "padding", val = headerPadding },
    options.header,
    { type = "padding", val = 2 },
    options.buttons,
  },
  opts = {},
}
