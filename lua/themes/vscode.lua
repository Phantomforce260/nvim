return require("functions.git").plugin("VSCode", {
    lazy = false,
    priority = 1000,
    config = function()
        require('vscode').setup({
            transparent = true
        })
    end
})