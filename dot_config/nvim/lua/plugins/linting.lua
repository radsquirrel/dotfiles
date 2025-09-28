return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      c = { "codespell" },
      cpp = { "codespell" },
      gitcommit = { "gitlint", "codespell", "cspell" },
      rst = { "rstcheck", "codespell" },
      systemd = { "systemdlint", "codespell" },
      bitbake = { "oelint-adv", "codespell" },
      sh = { "codespell" },
    },
  },
}
