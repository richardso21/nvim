if vim.g.vscode then
	require("rso.vscode.remap")
	require("rso.vscode.set")
else
	require("rso.remap")
	require("rso.set")
end
require("rso.lazy")

if vim.g.neovide then
	require("rso.neovide")
end
