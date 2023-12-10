local function restore_nvim_tree()
  local nvim_tree = require('nvim-tree')
  nvim_tree.change_dir(vim.fn.getcwd())
end

require('auto-session').setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  post_restore_cmds = { restore_nvim_tree },
  -- auto_session_use_git_branch = true,
}
