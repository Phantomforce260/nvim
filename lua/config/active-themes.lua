-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md

local themes = {

    -- Neovim themes
    {
        "catppuccin",
        "dracula",
    },
    {
        "dracula",
        "dracula"
    },
    {
        "gruvbox",
        "gruvbox_dark",
    },
    {
        "tokyonight",
        "nightfly",
    },
    {
        "nord",
        "nord",
    },
    {
        "mellow",
        "seoul256"
    },
    {
        "onedark",
        "onedark"
    },
    {
        "vscode",
        "vscode"
    },
    {
        "rose-pine",
        "horizon"
    },
    {
        "material",
        "material"
    },
    {
        "material-deep-ocean",
        "material"
    },
    {
        "material-palenight",
        "palenight"
    },
    {
        "ayu",
        "ayu_dark"
    },
    {
        "andromeda",
        "ayu_mirage"
    },

    -- Vim themes
    {
        "slate",
        "auto"
    },
    {
        "habamax",
        "auto"
    },
    {
        "lunaperche",
        "auto"
    },

    -- Vim 9.1+ themes
    {
        "retrobox",
        "auto"
    },
    {
        "unokai",
        "auto"
    }
}

-- Change the index to switch themes
local useVimThemes = false
local randomTheme = true

math.randomseed(os.time())
local themeIndex = randomTheme and math.random(useVimThemes and #themes or #themes - 5) or 1

local vimTheme = randomTheme and themes[themeIndex][1] or "habamax"
local lualineTheme = randomTheme and themes[themeIndex][2] or "auto"

print("Using theme: " .. vimTheme)

return {
    vimTheme = vimTheme,
    lualineTheme = lualineTheme,
    allThemes = themes,
}
