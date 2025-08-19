return {
	-- Multi-select (VSCode Cmd/Ctrl+D)
	-- {
	-- 	"mg979/vim-visual-multi",
	-- 	init = function()
	-- 		vim.g.VM_maps = {
	-- 			["Add Cursor Down"] = "<C-S-Down>",
	-- 			["Add Cursor Up"] = "<C-S-Up>",
	-- 		}
	-- 	end,
	-- 	event = "BufReadPost",
	-- },
	{
		"jake-stewart/multicursor.nvim",
		event = "BufReadPost",
		config = function()
			local mc = require("multicursor-nvim")
			mc.setup()

			local set = vim.keymap.set

			-- enhanced line add cursor that deletes cursors when going back
			-- to the original position
			local stickyLineAddCursor = function(dir)
				local top, bot
				mc.action(function(ctx)
					local query = { enabledCursors = true }
					top = ctx:mainCursor() == ctx:firstCursor(query)
					bot = ctx:mainCursor() == ctx:lastCursor(query)
				end)
				if top == bot or (top and dir == -1) or (bot and dir == 1) then
					mc.lineAddCursor(dir)
				else
					mc.deleteCursor()
				end
			end

			-- Add cursors above/below current position
			set({ "n", "x" }, "<c-s-up>", function()
				stickyLineAddCursor(-1)
			end)
			set({ "n", "x" }, "<c-s-down>", function()
				stickyLineAddCursor(1)
			end)

			-- Add cursor at current position
			set({ "n", "x" }, "<c-s-enter>", mc.addCursor)

			-- regex split cursors
			set("x", "S", mc.splitCursors)

			-- Add/skip cursors matching current element
			set({ "n", "x" }, "<c-p>", function()
				mc.matchAddCursor(-1)
			end)
			set({ "n", "x" }, "<c-n>", function()
				mc.matchAddCursor(1)
			end)
			set({ "n", "x" }, "<c-s-p>", function()
				mc.matchSkipCursor(-1)
			end)
			set({ "n", "x" }, "<c-s-n>", function()
				mc.matchSkipCursor(1)
			end)

			mc.addKeymapLayer(function(layerSet)
				-- cycle through placed cursors
				layerSet({ "n", "x" }, "p", mc.prevCursor)
				layerSet({ "n", "x" }, "n", mc.nextCursor)

				-- delete current cursor
				layerSet({ "n", "x" }, "q", mc.deleteCursor)

				-- Enable or Clear cursors using escape.
				layerSet("n", "<esc>", function()
					if not mc.cursorsEnabled() then
						mc.enableCursors()
					else
						mc.clearCursors()
					end
				end)
			end)

			-- Customize how cursors look.
			local hl = vim.api.nvim_set_hl
			hl(0, "MultiCursorCursor", { reverse = true })
			hl(0, "MultiCursorVisual", { link = "Visual" })
			hl(0, "MultiCursorSign", { link = "SignColumn" })
			hl(0, "MultiCursorMatchPreview", { link = "Visual" })
			hl(0, "MultiCursorDisabledCursor", { reverse = true })
			hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
			hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
		end,
	},
}
