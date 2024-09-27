return {
    "numToStr/Comment.nvim",
    opts = {},
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<leader>cl"
            },
            opleader = {
                line = "<leader>cl"
            }
        })
    end
}
