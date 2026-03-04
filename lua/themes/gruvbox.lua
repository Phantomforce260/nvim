return require("functions.git").plugin("Gruvbox", {
    lazy = false,
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            transparent_mode = true
        })
    end,
    opts = ...
})