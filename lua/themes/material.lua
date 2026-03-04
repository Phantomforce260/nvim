return require("functions.git").plugin("Material", {
    lazy = false,
    priority = 1000,
    config = function()
        require("material").setup({
            disable = { background = true }
        })
    end
})