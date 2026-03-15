local opt = vim.opt

opt.clipboard = "unnamedplus"

opt.nu = true
opt.relativenumber = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8

opt.updatetime = 50

opt.colorcolumn = "80"

-- Remove trailing spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
    signs = {
        text = {
            [severity.ERROR] = " ",
            [severity.WARN] = " ",
            [severity.HINT] = "󰠠 ",
            [severity.INFO] = " ",
        }
    }
})
