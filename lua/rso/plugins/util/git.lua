return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, desc, opts)
				opts = opts or {}
				opts.desc = desc
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, "Next hunk")

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, "Prev hunk")

			map("n", "<leader>gs", gitsigns.stage_hunk, "Stage Hunk")
			map("n", "<leader>gr", gitsigns.reset_hunk, "Reset Hunk")
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage Hunk")
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset Hunk")
			map("n", "<leader>gS", gitsigns.stage_buffer, "Stage Buffer")
			map("n", "<leader>gu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
			map("n", "<leader>gR", gitsigns.reset_buffer, "Reset Buffer")
			map("n", "<leader>gp", gitsigns.preview_hunk, "Preview Hunk")
			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, "Blame Line")
			map("n", "<leader>ob", gitsigns.toggle_current_line_blame, "Toggle Blame Line")
			map("n", "<leader>gd", gitsigns.diffthis, "Diff")
			map("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end, "Diff Unstaged")
			map("n", "<leader>od", gitsigns.toggle_deleted, "Toggle Deleted")
		end,
	},
	event = "BufReadPost",
}
