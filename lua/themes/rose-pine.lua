return require("functions.git").plugin("Rose-Pine", {
    lazy = false,
    priority = 1000,
	config = function()
        require("rose-pine").setup({
            styles = { transparency = true }
        })
	end
})