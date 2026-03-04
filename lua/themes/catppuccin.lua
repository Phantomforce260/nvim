return require("functions.git").plugin("Catppuccin", {
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true
        })
    end
})