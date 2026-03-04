local function quit_to_oil(oil)
    -- Close all other buffers
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and buf ~= current_buf then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end

    -- Open Oil in the directory of the current buffer
    oil.open()
end

local function focus_neotree()
    vim.cmd.Neotree("focus")
end

local function up_dir()
    local ft = vim.bo.filetype
    if ft == "oil" then
        vim.cmd("Oil")
    end
end

local function lualine_theme(opts)
    require('lualine').setup({
        options = {
            theme = opts.args
        }
    })
end

local function transparent()
    vim.cmd [[
        hi Normal guibg=none ctermbg=none
        hi NonText guibg=none ctermbg=none
        hi NormalNC guibg=none ctermbg=none
        hi SignColumn guibg=none ctermbg=none
        hi VertSplit guibg=none ctermbg=none
        hi StatusLine guibg=none ctermbg=none
        hi TabLine guibg=none ctermbg=none
        hi LineNr guibg=none ctermbg=none
        hi EndOfBuffer guibg=none ctermbg=none
    ]]
end

local active_themes = require("config.active-themes")

local function theme_picker()
    local function pick_theme()
        local selection = require("telescope.actions.state").get_selected_entry()

        if not selection then
            return false
        end

        local theme = selection.value
        vim.cmd("colorscheme " .. theme[1])
        require("lualine").setup({
            options = { theme = theme[2] }
        })
        return true
    end

    vim.api.nvim_create_user_command("ThemePicker", function()
        local actions = require("telescope.actions")

        local reversed_themes = {}
        for i = #active_themes.allThemes, 1, -1 do
            table.insert(reversed_themes, active_themes.allThemes[i])
        end

        local current_colorscheme = vim.g.colors_name  -- Get the current colorscheme
        local current_lualine_theme = require('lualine').get_config().options.theme  -- Get the current lualine theme

        require("telescope.pickers").new({}, {
            prompt_title = "Select Colorscheme and Lualine",
            finder = require("telescope.finders").new_table({
                results = reversed_themes,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry[1] .. " - " .. entry[2],
                        ordinal = entry[1] .. entry[2],
                    }
                end,
            }),
            sorter = require("telescope.config").values.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, map)

                local function preview_prev()
                    actions.move_selection_previous(prompt_bufnr)
                    pick_theme()
                end

                local function preview_next()
                    actions.move_selection_next(prompt_bufnr)
                    pick_theme()
                end

                -- Select on hover
                map("i", "<Up>", preview_prev)

                -- Move selection down and apply theme
                map("i", "<Down>", preview_next)

                -- Tab for next selection, apply theme
                map("i", "<Tab>", preview_next)

                -- Shift-Tab for previous selection, apply theme
                map("i", "<S-Tab>", preview_prev)

                -- On Enter, select and close picker
                map("i", "<CR>", function()
                    if pick_theme() then
                        actions.close(prompt_bufnr)
                    end
                end)

                map("i", "<ESC>", function()
                    -- Restore the previous colorscheme and lualine theme
                    if current_colorscheme then
                        vim.cmd("colorscheme " .. current_colorscheme)
                    end
                    if current_lualine_theme then
                        require("lualine").setup({
                            options = { theme = current_lualine_theme }
                        })
                    end
                    actions.close(prompt_bufnr)
                end)
                return true
            end,
        }):find()
    end, {})
end

vim.api.nvim_create_user_command("LualineTheme", lualine_theme, { nargs = 1 })

return {
    theme_picker = theme_picker,
    transparent = transparent,
    quit_to_oil = quit_to_oil,
    focus_neotree = focus_neotree,
    up_dir = up_dir,
    lualine_theme = lualine_theme,
}
