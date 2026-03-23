-- Barbar provides a tabline interface for managing buffers. 
-- It allows users to easily switch between open buffers, close buffers,
-- and view buffer information in a visually appealing tabline at the 
-- top of the Neovim window.

local git = require("functions.git")

return git.plugin("Barbar", {
    -- Dependencies for Barbar: Gitsigns for file changes, web-devicons for file icons
    dependencies = {
        git.plugin("Gitsigns"),
        git.plugin("Web-Devicons")
    },

    -- Disable automatic setup to allow custom configuration
    init = function()
        vim.g.barbar_auto_setup = false
    end,

    -- Configuration options for Barbar
    opts = {},
    -- Version constraint to ensure compatibility
    version = "^1.0.0"
})
