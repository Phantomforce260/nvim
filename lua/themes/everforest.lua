return require("functions.git").plugin("Everforest", {
    lazy = false,
    priority = 1000,
    config = function()
        require("everforest").setup({
            italics = false,
            transparent_background_level = 2
        })
    end
})
