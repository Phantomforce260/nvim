return require("functions.git").plugin("Kanagawa", {
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
            statementStyle = { bold = false },
            transparent = true
        })
    end
})
