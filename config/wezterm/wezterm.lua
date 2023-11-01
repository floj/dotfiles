local wezterm = require("wezterm")

local keybind = {
	{ key = "\\", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "]", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "[", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "/", mods = "LEADER", action = wezterm.action({ Search = { CaseSensitiveString = "" } }) },
	{ key = "+", mods = "CTRL|SHIFT", action = "IncreaseFontSize" },
	{ key = "_", mods = "CTRL|SHIFT", action = "DecreaseFontSize" },
	{ key = ")", mods = "CTRL|SHIFT", action = "ResetFontSize" },
	{ key = "r", mods = "LEADER", action = "ReloadConfiguration" },
	{ key = "C", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
	{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "LeftArrow", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "RightArrow", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "UpArrow", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "DownArrow", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "D", mods = "LEADER|SHIFT", action = "ShowDebugOverlay" },
}

for i = 1, 9 do
	-- ctrl+a; <number> to activate that tab
	table.insert(keybind, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = i - 1 }),
	})
end

wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	font = wezterm.font("Fira Code", {}),

	scrollback_lines = 50000,

	exit_behavior = "Close",
	check_for_updates = false,
	warn_about_missing_glyphs = false,

	use_fancy_tab_bar = false,
	automatically_reload_config = false,
	-- hide_tab_bar_if_only_one_tab = false,
	tab_bar_at_bottom = true,

	-- color_scheme = "midnight-in-mojave",
	-- color_scheme = "Monokai Remastered",
	-- color_scheme = "Monokai Vivid",
	color_scheme = "Monokai Soda",

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	initial_cols = 220,
	initial_rows = 60,

	audible_bell = "Disabled",

	inactive_pane_hsb = {
		brightness = 0.75,
	},

	-- term = "wezterm",

	-- disable_default_key_bindings = true,
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 },

	disable_default_key_bindings = true,

	keys = keybind,
}
