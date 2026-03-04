return require("functions.git").plugin("Nord", {
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.nord_disable_background = true
        vim.cmd("colorscheme nord")
    end
})