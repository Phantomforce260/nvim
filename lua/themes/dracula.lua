return require("functions.git").plugin("Dracula", {
    lazy = false,
    priority = 1000,
    config = function()
        require("dracula").setup({
            transparent_bg = true
        })
    end
})