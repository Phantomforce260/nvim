local M = {}

local base = "ssh://git@ssh.git.lunarflame.dev:2222/Neovim/"

function M.plugin(repo, opts)
    opts = opts or {}

    return vim.tbl_extend("force", {
        url = base .. repo .. ".git",
        name = repo
    }, opts)
end

return M
