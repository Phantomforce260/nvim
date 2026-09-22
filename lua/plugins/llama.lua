return {
    "ggml-org/llama.vim",
    init = function()
        vim.g.llama_config = {
            endpoint_fim = "http://127.0.0.1:8012/infill",

            -- Automatically request completions as you type/move.
            auto_fim = true,

            -- Maximum generated tokens.
            n_predict = 128,

            max_line_suffix = 128,

            -- How long to allow generation.
            t_max_predict_ms = 3000,

            show_info = false,
        }
    end
}
