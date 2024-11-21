return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
    },
    init = function()
        local keymaps = {
            { "]d", "goto_next", desc = "Go to next diagnostic" },
            { "[d", "goto_prev", desc = "Go to previous diagnostic" },
            { "<Leader>d", "open_float", desc = "Show diagnostic in floating window" },
            { "<Leader>q", "setqflist", desc = "Show diagnostics in quick fix list" },
        }

        vim.diagnostic.config({
            float = { source = "if_many" },
            severity_sort = true,
        })

        vim.iter(keymaps):each(function(x)
            vim.keymap.set("n", x[1], vim.diagnostic[x[2]], { desc = x.desc })
        end)
    end,
    config = function()
        local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp");

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = cmp_ok and cmp.default_capabilities() or {},
                    })
                end,
            },
        })

        local keymaps = {
            { "<Leader>ca", "code_action", desc = "Code actions", mode = {"n", "v" } },
            { "gD", "declaration", desc = "Go to declaration" },
            { "gd", "definition", desc = "Go to definition" },
            { "K", "hover", desc = "Show hover documentation" },
            { "gI", "implementation", desc = "Show implementations" },
            { "gR", "references", desc = "Show references" },
            { "<Leader>rn", "rename", desc = "Rename symbol" },
            { "<Leader>K", "signature_help", desc = "Show signature information" },
        }

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                vim.iter(keymaps):each(function(x)
                    vim.keymap.set(x.mode or "n", x[1], vim.lsp.buf[x[2]], {
                        desc = x.desc,
                        buffer = args.buf,
                    })
                end)
            end,
        })
    end,
}
