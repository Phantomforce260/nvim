-- Markdown is a plugin that provides enhanced markdown editing capabilities,
-- including syntax highlighting, formatting, and possibly preview features.

local git = require("functions.git")

return git.plugin("Markdown", {
    -- Dependencies for markdown support: Treesitter for syntax highlighting,
    -- Web-Devicons for file icons
    dependencies = { git.plugin("Treesitter"), git.plugin("Web-Devicons") },

    -- Use default options for the Markdown plugin
    opts = {},
})
