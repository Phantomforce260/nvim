-- Colorizer highlights color codes in files,
-- allowing users to visualize colors directly in the editor.

return require("functions.git").plugin("Colorizer", {
    -- Configure Colorizer to highlight colors in all file types (*),
    -- and enable CSS-specific color highlighting for CSS and SCSS files
    config = function()
        require("colorizer").setup({
            "*",
            css = { css = true },
            scss = { css = true }
        })
    end
})
