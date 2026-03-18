return require("functions.git").plugin("Andromeda", {
    lazy = false,
    priority = 1000,
    config = function()
        require("andromeda").setup({
            transparent = true,

            styles = {
                comments = { italic = false },
                keywords = { italic = false },
            }
        })
    end
})
