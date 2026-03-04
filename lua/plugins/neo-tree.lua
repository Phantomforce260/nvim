-- Neo-tree is a file explorer plugin that provides a
-- sidebar tree view of the filesystem, buffers, and git status.

local git = require("functions.git")

return git.plugin("Neo-Tree", {
    -- Load Neo-tree when the :Neotree command is run or when <leader>z is pressed
    cmd = "Neotree",

    -- Use the v3.x branch for stability
    branch = "v3.x",
    -- Neo-tree dependencies: plenary, devicons, nui
    dependencies = {
        git.plugin("Plenary"),
        git.plugin("Web-Devicons"),
        git.plugin("NUI")
    },

    -- Configure Neo-tree with custom settings
    config = function()
        require("neo-tree").setup({
            -- Enable viewing git status and invisible files
            enable_git_status = true,
            open_on_setup = false,
            filesystem = {
                filtered_items = { visible = true }
            }
        })
    end
})