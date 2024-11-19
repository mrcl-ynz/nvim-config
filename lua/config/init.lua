return {
    options = require("config.options"),
    keymaps = require("config.keymaps"),

    setup = function(self)
        vim.iter(self.options):each(function(k, v) vim.opt[k] = v end)

        vim.iter({ "mapleader", "maplocalleader" }):each(function(x)
            vim.g[x] = vim.keycode("<Space>")
        end)

        vim.iter(self.keymaps):each(function(mode, mappings)
            vim.iter(mappings):each(function(x)
                vim.keymap.set(mode, x[1], x[2], { desc = x.desc, expr = x.expr, silent = true })
            end)
        end)
    end,
}
