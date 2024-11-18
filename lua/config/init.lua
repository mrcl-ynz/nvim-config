return {
    options = require("config.options"),

    setup = function(self)
        vim.iter(self.options):each(function(k, v) vim.opt[k] = v end)
    end,
}
