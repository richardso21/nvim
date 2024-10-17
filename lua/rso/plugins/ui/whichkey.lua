-- Which Key
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "helix",
		win = {
			border = "rounded",
		},
		spec = {
			{
				{ "<C-B>", desc = "1 page up" },
				{ "<C-D>", desc = "1/2 page down" },
				{ "<C-E>", desc = "nudge up" },
				{ "<C-F>", desc = "1 page down" },
				{ "<C-U>", desc = "1/2 page up" },
				{ "<C-Y>", desc = "nudge down" },
				{ "<C-down>", desc = "vert shrink window" },
				{ "<C-h>", desc = "focus left window" },
				{ "<C-j>", desc = "focus bottom window" },
				{ "<C-k>", desc = "focus top window" },
				{ "<C-l>", desc = "focus right window" },
				{ "<C-left>", desc = "horiz shrink window" },
				{ "<C-right>", desc = "horiz grow window" },
				{ "<C-up>", desc = "vert grow window" },
				{ "<M-k>", desc = "code hover" },
				{ "J", desc = "prev buffer" },
				{ "K", desc = "next buffer" },
				{ "gd", desc = "goto definition" },
			},
			{
				{ "<leader>b", group = "buffer" },
				{ "<leader>bQ", desc = "buffer close others" },
				{ "<leader>bb", desc = "buffer selection" },
				{ "<leader>bp", desc = "buffer toggle pin" },
				{ "<leader>bn", desc = "buffer new empty" },
				{ "<leader>bq", desc = "buffer close selection" },
				{ "<leader>e", desc = "file explorer" },
				{ "<leader>E", desc = "file explorer find file" },
				{ "<leader>f", group = "find" },
				{ "<leader>fb", desc = "find buffers" },
				{ "<leader>ff", desc = "find file" },
				{ "<leader>fg", desc = "find file (git tracked)" },
				{ "<leader>fh", desc = "find help!" },
				{ "<leader>fn", desc = "find notifications" },
				{ "<leader>fp", desc = "find recent/prev files" },
				{ "<leader>fs", desc = "find sessions" },
				{ "<leader>ft", desc = "find text (live grep)" },
				{ "<leader>fT", desc = "find text (query)" },
				{ "<leader>fv", desc = "find variables" },
				{ "<leader>l", group = "lang" },
				{ "<leader>la", desc = "code action" },
				{ "<leader>lm", desc = "mason" },
				{ "<leader>ln", desc = "code rename" },
				{ "<leader>lr", desc = "code references" },
				{ "<leader>n", group = "window" },
				{ "<leader>ne", desc = "equalize all window sizes" },
				{ "<leader>nn", desc = "maximize current window" },
				{ "<leader>nq", desc = "close current window" },
				{ "<leader>ns", desc = "new horiz window" },
				{ "<leader>nt", desc = "new vert window" },
				{ "<leader>o", group = "toggles" },
				{ "<leader>oa", desc = "toggle aerial view" },
				{ "<leader>oc", desc = "toggle AI auto-suggestions" },
				{ "<leader>oh", desc = "toggle highlight" },
				{ "<leader>oi", desc = "toggle illuminate under cursor" },
				{ "<leader>os", desc = "toggle spellcheck" },
				{ "<leader>ow", desc = "toggle word wrapping" },
				{ "<leader>p", desc = "clipboard paste" },
				{ "<leader>q", group = "quit" },
				{ "<leader>qF", desc = "quit vim!" },
				{ "<leader>qQ", desc = "quit vim." },
				{ "<leader>qf", desc = "close buffer!" },
				{ "<leader>qq", desc = "close buffer." },
				{ "<leader>u", desc = "undo tree" },
				{ "<leader>w", desc = "write" },
				{ "<leader>W", desc = "write w/o formatting" },
				{ "<leader>y", desc = "clipboard yank" },
				{ "<leader>z", group = "zzz" },
				{ "<leader>zp", desc = "config" },
				{ "<leader>zz", desc = "lazy" },
			},
		},
	},
}
