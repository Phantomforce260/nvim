-- Telescope is a highly extendable fuzzy finder that can search files, buffers,
-- help tags, live grep, LSP locations and more.
local git = require("functions.git")

return {
    git.plugin("Telescope", {
        lazy = false,

        branch = "master",
        -- Telescope depends on plenary for utility functions
        dependencies = { git.plugin("Plenary") },
        -- Configure Telescope: set up a couple of default keybindings
        init = function()
            require("functions.commands").theme_picker()
        end
    }),

    -- Optional UI extension: replaces some default vim.ui.select prompts
    -- with Telescope's picker UI for a more consistent UX.
    git.plugin("Telescope-UI-Select")
}
