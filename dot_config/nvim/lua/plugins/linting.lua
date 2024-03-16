return {
    "mfussenegger/nvim-lint",
    opts = {
        linters_by_ft = {
            c = { "cppcheck", "codespell" },
            cpp = { "cppcheck", "codespell" },
            gitcommit = { "gitlint", "codespell", "cspell" },
            rst = { "rstcheck", "codespell" },
            systemd = { "systemdlint" },
        },
    },
}
