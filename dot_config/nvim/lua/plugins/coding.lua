return {
  {
    "ruifm/gitlinker.nvim",
    config = function()
      local statusOk, gitlinker = pcall(require, "local.gitlinker")
      local callbacks = {}
      if statusOk then
        callbacks = {
          [gitlinker.host] = gitlinker.hostType,
        }
      end
      require("gitlinker").setup({ callbacks = callbacks, mappings = "<leader>gy" })
    end,
  },
}
