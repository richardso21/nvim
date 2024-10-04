local function restore_nvim_tree()
	local nvim_tree = require("nvim-tree")
	nvim_tree.change_dir(vim.fn.getcwd())
end

---@diagnostic disable-next-line: missing-fields
require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	post_restore_cmds = { restore_nvim_tree },
})
