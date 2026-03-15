return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "│",
            highlight = "IblIndent",
        },
    },
    config = function(_, opts)
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#777777" })
        require("ibl").setup(opts)
    end,
}
