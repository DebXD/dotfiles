local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
	"lua_ls",
	"eslint",
	"pyright",
})

-- Fix Undefined global 'vim'
-- lsp.nvim_workspace()

-- always select first item
local cmp = require("cmp")
cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu, menuone, noinsert",
	},
})

-- use enter key to confirm the selection
cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
})
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<CR>'] = cmp.mapping.confirm({ select = false }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
--
-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })

-- lsp.set_preferences({
-- 	suggest_lsp_servers = false,
-- 	sign_icons = {
-- 		error = "X",
-- 		warn = "W",
-- 		hint = "H",
-- 		info = "I",
-- 	},
-- })
lsp.set_sign_icons({
	error = "",
	warn = "",
	info = "",
	hint = "󰌵",
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	-- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	-- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	-- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	-- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	-- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- EXAMPLE HOW TO SETUP CUSTOM CONFIG --
--
-- require('mason-lspconfig').setup({
--     ensure_installed = {'tsserver', 'rust_analyzer'},
--     handlers = {
--       lsp_zero.default_setup,
--       tsserver = function()
--         require('lspconfig').tsserver.setup({
--           settings = {
--             completions = {
--               completeFunctionCalls = true
--             }
--           }
--         })
--       end,
--     },
--   })
--
lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
