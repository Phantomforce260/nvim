return require("functions.git").plugin("Tokyonight", {
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            transparent = true
        })
    end
})