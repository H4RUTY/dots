local function is_os_dark()
    local out = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
    return type(out) == "string" and out:match("Dark") ~= nil
end

return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false,
        config = function()
            local dark = is_os_dark()
            local scheme = dark and "github_dark" or "github_light"
            require("github-theme").setup({
                options = {
                    transparent = true,
                },
            })

            vim.o.background = dark and "dark" or "light"
            vim.cmd.colorscheme(scheme)
        end,
      },
}
