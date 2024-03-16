vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<F5>",
            ":w<CR>:split<CR>:te time python %<CR> i",
            { silent = true, noremap = true }
        )
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<F5>",
            "<ESC>:w<CR>:split<CR>:te g++ -g -std=c++11 -Wshadow -Wall -Wextra % -o %<.out && time ./%<.out<CR> i",
            -- "<ESC>:w<CR>:split<CR>:te g++ -g -std=c++11 -Wshadow -Wall -Wextra % -o %<.out && time ./%<.out < ./%<.in<CR>",
            -- "<ESC>:w<CR>:split<CR>:te g++ -g -std=c++11 -Wshadow -Wall -Wextra % -o %<.out && gdb %<.out<CR>",
            { silent = true, noremap = true }
        )
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<F5>",
            "<ESC>:w<CR>:split<CR>:te javac % && java %< <CR> i",
            { silent = true, noremap = true }
        )
    end,
})
