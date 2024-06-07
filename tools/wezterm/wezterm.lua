local wezterm = require "wezterm"
local act = wezterm.action

return {
	color_scheme = "Relaxed",
	font = wezterm.font("Fira Code"),
	font_size = 15.0,
	harfbuzz_features = { "zero", "kern", "liga", "clig" },
	window_background_opacity = 0.95,
	window_padding = {
		left = 25, right = 25,
		top = 25, bottom = 25,
	},
	keys = {
		{
			key = "LeftArrow",
			mods = "SUPER",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "RightArrow",
			mods = "SUPER",
			action = act.ActivateTabRelative(1),
		},
	},
}
