---@diagnostic disable-next-line: missing-fields
require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})
