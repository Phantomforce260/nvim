return require("functions.git").plugin("Nightfox", {
    lazy = false,
    priority = 1000,
    config = function()
        require("nightfox").setup({
            options = {
                transparent = true
            }
        })
    end
})
