return {
	"hrsh7th/nvim-cmp",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "onsails/lspkind.nvim" },
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")

		-- helper functions for custom autocomplete functionality
		local has_words_before = function()
			---@diagnostic disable-next-line: deprecated
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		local toggle_completion = function()
			if cmp.visible() then
				cmp.close()
			else
				cmp.complete()
			end
		end

		local cmp_select_behavior = { behavior = cmp.SelectBehavior.Select }

		local mappings = cmp.mapping.preset.insert({
			-- `Enter` key to confirm completion
			["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.replace, select = true }),

			["<Tab>"] = vim.schedule_wrap(function(fallback)
				if cmp.visible() and has_words_before() then
					cmp.select_next_item(cmp_select_behavior)
				else
					fallback()
				end
			end),
			["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select_behavior),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select_behavior),
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select_behavior),

			-- Ctrl+Space to trigger completion menu
			["<C-Space>"] = toggle_completion,

			-- Scroll up and down in the completion documentation
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
		})

		cmp.setup({
			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "lazydev" },
			},
			mapping = mappings,
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			---@diagnostic disable-next-line: missing-fields
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 70,
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"
					return kind
				end,
			},
		})
	end,
}
