-- Autopairs automatically inserts matching closing characters 
-- (like parentheses, brackets, quotes, etc.) as you type.

return require("functions.git").plugin("Autopairs", {
    -- Load the plugin when entering Insert mode for better startup time
    event = "InsertEnter",
    -- Use default configuration settings
    config = true
})
