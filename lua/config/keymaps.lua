return {
    n = {
        { "<Leader>e", "<Cmd>Ex<CR>", desc = "Open file explorer" },

        { "<Esc>", "<Cmd>nohlsearch<CR>", desc = "Clear search highlights" },

        -- move up/down inside wrapped lines
        {
            "j",
            function() return vim.v.count == 0 and "gj" or "j" end,
            expr = true
        },
        {
            "k",
            function() return vim.v.count == 0 and "gk" or "k" end,
            expr = true
        },

        { "<A-j>", "<Cmd>move .+1<CR>==", desc = "Move line down" },
        { "<A-k>", "<Cmd>move .-2<CR>==", desc = "Move line up" },

        { "<C-h>", "<C-w>h", desc = "Move to left window" },
        { "<C-j>", "<C-w>j", desc = "Move to lower window" },
        { "<C-k>", "<C-w>k", desc = "Move to upper window" },
        { "<C-l>", "<C-w>l", desc = "Move to right window" },

        { "<A-Left>", "<C-w><S-h>", desc = "Move window left" },
        { "<A-Down>", "<C-w><S-j>", desc = "Move window down" },
        { "<A-Up>", "<C-w><S-k>", desc = "Move window up" },
        { "<A-Right>", "<C-w><S-l>", desc = "Move window right" },

        { "<C-Left>", "<C-w><", desc = "Decrease window width" },
        { "<C-Down>", "<C-w>-", desc = "Decrease window height" },
        { "<C-Up>", "<C-w>+", desc = "Increase window height" },
        { "<C-Right>", "<C-w>>", desc = "Increase window width" },
    },
    v = {
        { "<A-j>", ":move '>+1<CR>gv=gv", desc = "Move selection down" },
        { "<A-k>", ":move '<-2<CR>gv=gv", desc = "Move selection up" },

        { "<", "<gv", desc = "Shift selection left" },
        { ">", ">gv", desc = "Shift selection right" },
    },
    i = {
        { "<A-j>", "<Cmd>move .+1<CR><Esc>==gi", desc = "Move line down" },
        { "<A-k>", "<Cmd>move .-2<CR><Esc>==gi", desc = "Move line up" },
    },
}
