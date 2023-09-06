local util = require("formatter.util")

require("formatter").setup({
	logging = false,
	filetype = {
		javascript = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		javascriptreact = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		typescript = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},

		typescriptreact = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		html = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		css = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		python = {
			function()
				return {
					exe = "black",
					args = { "-q", "-" },
					stdin = true,
				}
			end,
		},
		sh = {
			function()
				local shiftwidth = vim.opt.shiftwidth:get()
				local expandtab = vim.opt.expandtab:get()

				if not expandtab then
					shiftwidth = 0
				end

				return {
					exe = "shfmt",
					args = { "-i", shiftwidth },
					stdin = true,
				}
			end,
		},

		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		-- other formatters ...
	},
})

-- require("formatter").setup({
--     logging = true,
--     log_level = vim.log.levels.WARN,
--     filetype = {
--
--          ["*"] = {
--             -- prettierd
--             function()
--                 return {
--                     exe = "prettierd",
--                     args = {
--                         "--tab-width=4",
--                         "--print-width=80",
--                         "--plugin=prettier-plugin-tailwindcss",
--                         vim.api.nvim_buf_get_name(0),
--                     },
--                     stdin = true,
--                 }
--             end,
--         },
-- }
-- auto format on save
-- vim.cmd([[augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost * FormatWrite
-- augroup END]])
--
-- })
-- Key mapping to format the current buffer
vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", { noremap = true, silent = true })

-- Auto-format on save for TypeScript and TypeScriptReact files
-- vim.cmd([[
--     autocmd BufWritePre *.ts,*.tsx FormatWrite
-- ]])
