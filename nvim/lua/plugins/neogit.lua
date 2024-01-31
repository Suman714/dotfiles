local M = {
	"NeogitOrg/neogit",
}

function M.config()
	require("neogit").setup({
		disable_signs = false,
		-- disable_hint = true,
		disable_context_highlighting = false,
		disable_commit_confirmation = true,
		disable_insert_on_commit = "auto",
		-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
		-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
		auto_refresh = true,
		disable_builtin_notifications = false,
		use_magit_keybindings = false,
		-- Change the default way of opening neogit
		kind = "tab",
		-- Change the default way of opening the commit popup
		commit_popup = {
			kind = "split",
		},
		-- Change the default way of opening popups
		popup = {
			kind = "split",
		},
		-- customize displayed signs
		integrations = {
			diffview = true,
		},
	})
end

return M
