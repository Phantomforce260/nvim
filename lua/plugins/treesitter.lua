--  Treesitter provides incremental parsing for many languages which enables
--  more accurate syntax highlighting, better indentation rules, and the
--  foundation for advanced editor features (textobjects, refactoring, etc.).

return require("functions.git").plugin("Treesitter", {
    --name = "nvim-treesitter",
    lazy = false,
    -- Run :TSUpdate after installing/updating the plugin to update parsers
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.config")

        -- Configure Treesitter modules and parser installation
        configs.setup({
            -- List of parsers to ensure are installed. Parsers are the language
            -- grammars Treesitter uses to parse files. Keep this list focused
            -- on languages you work with to avoid long install times.
            ensure_installed = {
                -- Common / required languages
                "lua",
                "c",
                "javascript",
                "vim",
                "vimdoc",
                "query",
                -- Additional languages (optional) — add or remove as needed
                "html",
                "css",
                "php",
                "typescript",
                "c_sharp",
                "java",
                "json",
                "svelte"
            },

            -- Automatically install missing parsers when entering a buffer.
            -- NOTE: This requires `tree-sitter` CLI tooling to be available on
            -- some systems. Set to false if you prefer manual parser management.
            auto_install = true,

            -- Enable syntax highlighting using Treesitter
            highlight = { enable = true },

            -- Enable indentation based on the parsed syntax tree. This can be
            -- more accurate than regex-based indentation for some languages.
            indent = { enable = true }
        })

         vim.api.nvim_create_autocmd("FileType", {
             callback = function(args)
                 local lang = args.match
                 if vim.treesitter.language.add(lang) then
                     vim.treesitter.start(args.buf, lang)
                 end
             end,
         })

         vim.opt.rtp:append(vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "Treesitter", "runtime"))
     end
})
