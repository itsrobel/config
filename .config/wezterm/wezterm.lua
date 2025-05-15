-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()
-- config.unix_domains = {
-- 	{ name = "unix" },
-- }
-- config.default_gui_startup_args = { "connect", "unix" }
config.default_cursor_style = "SteadyBar"
config.adjust_window_size_when_changing_font_size = false
-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.color_scheme = "Catppuccin Mocha"

--config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 13
config.enable_tab_bar = false
config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10
config.native_macos_fullscreen_mode = false
--TODO: swap this out for control s, using the neovim config from arch
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {

	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	{ mods = "LEADER", key = "x", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	-- {
	-- 	mods = "LEADER",
	-- 	key = "-",
	-- 	action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	-- },
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},

	{
		mods = "LEADER",
		key = "Space",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	-- show the pane selection mode, but have it swap the active and selected panes
	{
		mods = "LEADER",
		key = "0",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
}

return config
