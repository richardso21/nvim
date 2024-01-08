local wk = require("which-key")

-- keybind hints
wk.register({
	-- buffers
	K = "next buffer",
	J = "prev buffer",
	-- windows
	-- ["<C-|>"] = "create vert split",
	-- ["<C-_>"] = "create horiz split",
	["<C-h>"] = "focus left window",
	["<C-j>"] = "focus bottom window",
	["<C-k>"] = "focus top window",
	["<C-l>"] = "focus right window",
	["<C-up>"] = "vert grow window",
	["<C-down>"] = "vert shrink window",
	["<C-left>"] = "horiz shrink window",
	["<C-right>"] = "horiz grow window",
	-- ["<C-=>"] = "equalize window size",
	-- ["<C-+>"] = "maximize current window",
	-- lsp
	["<M-k>"] = "code hover",
	g = {
		d = "goto definition",
	},
	-- neoscroll
	["<C-B>"] = "1 page up",
	["<C-F>"] = "1 page down",
	["<C-U>"] = "1/2 page up",
	["<C-D>"] = "1/2 page down",
	["<C-E>"] = "nudge up",
	["<C-Y>"] = "nudge down",
})

-- leader hints
wk.register({
	y = "clipboard yank",
	e = "file explorer",
	u = "undo tree",
	b = {
		name = "+buffer",
		b = "buffer selection",
		q = "buffer close selection",
		Q = "buffer close others",
		p = "buffer toggle pin",
	},
	f = {
		name = "+find",
		f = "find file",
		g = "find file (git tracked)",
		p = "find recent/prev files",
		s = "find sessions",
		b = "find buffers",
		t = "find text",
		v = "find variables",
		h = "find help!",
	},
	l = {
		name = "+lang",
		d = "code diagnostic",
		w = "code workspace symbols",
		r = "code references",
		n = "code rename",
		a = "code action",
		m = "mason",
	},
	w = {
		name = "+write",
		w = "write",
		W = "write w/o formatting",
	},
	m = {
		name = "+comment",
	},
	q = {
		name = "+quit",
		q = "close buffer.",
		f = "close buffer!",
		Q = "quit vim.",
		F = "quit vim!",
	},
	o = {
		name = "+toggles",
		h = "toggle highlight",
		s = "toggle spellcheck",
		i = "toggle illuminate under cursor",
	},
	n = {
		name = "+window",
		t = "new vert window",
		s = "new horiz window",
		e = "equalize all window sizes",
		n = "maximize current window",
		q = "close current window",
	},
	z = {
		name = "zzz",
		z = "lazy",
		p = "config",
	},
}, { prefix = "<leader>" })

wk.setup({})
