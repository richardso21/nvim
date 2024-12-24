vim.o.guifont = "MesloLGS Nerd Font Mono:h17"
vim.g.neovide_scroll_animation_length = 0.05
vim.g.neovide_cursor_animation_length = 0.03
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_input_macos_option_key_is_meta = "only_left"
-- bug where neovide doesn't focus on startup on macOS
vim.defer_fn(function()
	vim.cmd("NeovideFocus")
end, 250)
