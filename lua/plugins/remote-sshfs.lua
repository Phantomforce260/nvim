-- Remote SSHFS: mount and browse remote files over SSH
-- Integrates with Telescope for browsing and uses Plenary utilities.
-- This plugin lets you manage connections and work on remote files
-- without manually mounting SSHFS outside Neovim.
local git = require("functions.git")

return git.plugin("Remote-SSHFS", {

    -- Dependencies: Telescope for the UI, Plenary for helper functions
    dependencies = {
        git.plugin("Telescope"),
        git.plugin("Plenary")
    },

    -- Configure the plugin: register known connections and file locations
    config = function()
        require('remote-sshfs').setup({
            connections = {
                -- Path to the SSH known_hosts file (expanded from $HOME)
                ssh_known_hosts = vim.fn.expand "$HOME" .. "/.ssh/known_hosts",
            }
        })
    end
})