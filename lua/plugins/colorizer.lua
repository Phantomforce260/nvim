return require("functions.git").plugin("Colorizer", {
    config = function()
        require("colorizer").setup({
            "*",
            css = { css = true },
            scss = { css = true }
        })
    end
})
