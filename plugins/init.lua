return {
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },
    ["goolord/alpha-nvim"] = {
      after = "base46",
      disable = false,
      config = function()
         require "custom.plugins.alpha"
      end,
    },
}
