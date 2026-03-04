-- Lualine is a statusline plugin. It provides a highly customizable
-- and visually appealing statusline that can display various information
-- about the current editing session, such as file name, mode, branch, diagnostics, etc

return require("functions.git").plugin("Lualine", {
    -- Lualine depends on 'nvim-web-devicons' for file type icons
    -- However, since we already have it installed via other plugins,
    -- we don't need to specify it again here.
    -- dependencies = { "nvim-tree/nvim-web-devicons" },

    -- Configure Lualine with a specific theme
    config = function()
        require("lualine").setup({
            options = {
                theme = ActiveThemes.lualineTheme
            }
        })
    end
})