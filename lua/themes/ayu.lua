return require("functions.git").plugin("Ayu", {
    lazy = false,
    priority = 1000,
    config = function()
        require("ayu").setup({
            overrides = {
                Normal = { bg = "None" },
                NormalFloat = { bg = "none" },
                ColorColumn = { bg = "None" },
                SignColumn = { bg = "None" },
                Folded = { bg = "None" },
                FoldColumn = { bg = "None" },
                CursorLine = { bg = "None" },
                CursorColumn = { bg = "None" },
                VertSplit = { bg = "None" },
                Comment = {italic = false }
            }
        })
    end
})