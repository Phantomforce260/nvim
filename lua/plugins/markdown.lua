local git = require("functions.git")

return git.plugin("Markdown", {
    dependencies = { git.plugin("Treesitter"), git.plugin("Web-Devicons") }, -- if you prefer nvim-web-devicons
    opts = {},
})
