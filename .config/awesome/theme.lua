local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local colors = require("colors")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}

theme.dir = os.getenv("HOME") .. "/.config/awesome/theme/"
-- theme.wallpaper = "~/pictures/wallpapers/new_york_night.jpg"
theme.wallpaper = "~/pictures/wallpapers/anime-rain-girl.jpg"
-- theme.font                                      = "Noto Sans Mono Bold 13"
-- theme.font = "MesloLGS Nerd Font Regular 13"
theme.font = "Liga SFMono Nerd Font Regular 13"
theme.fg_normal = colors.tokyonight.fg_normal
theme.fg_focus = colors.tokyonight.fg_focus
theme.fg_urgent = colors.tokyonight.fg_urgent
theme.bg_normal = colors.tokyonight.bg_normal

theme.bg_focus = colors.tokyonight.bg_normal

theme.border_marked = colors.tokyonight.border_marked

-- do not set these to use the fg vars
theme.border_normal = colors.tokyonight.bg_focus
theme.border_focus = colors.tokyonight.fg_focus

theme.tasklist_bg_focus = theme.bg_focus
theme.bg_urgent = theme.fg_urget
theme.titlebar_bg_focus = theme.bg_focus
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_focus = theme.fg_focus
theme.border_width = dpi(3)
theme.menu_height = dpi(16)
theme.menu_width = dpi(140)
theme.menu_disable_icon = true
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true

local markup = lain.util.markup
-- local separators = lain.util.separators

-- local keyboardlayout = awful.widget.keyboardlayout:new()
theme.useless_gap = 8
-- Textclock
-- local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch("date +'%a %d %b %R'", 60, function(widget, stdout)
	widget:set_markup(" " .. markup.font(theme.font, stdout))
end)

theme.icon_size = 16
theme.icon_font = "Font Awesome 6 Free-Solid-900 " -- attention to space at the end!
theme.icon_color = theme.fg_focus

-- Fonts Awesome Icons
local function make_fa_icon(code)
	return wibox.widget({
		font = theme.icon_font .. theme.icon_size,
		markup = ' <span color="' .. theme.icon_color .. '">' .. code .. "</span> ",
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox,
	})
end

local facpuicon = make_fa_icon("\u{f2db}")
local famemicon = make_fa_icon("\u{f538}")
local fatempicon = make_fa_icon("\u{f2c9}")
-- local faweathericon = make_fa_icon('\u{f6c4}')
-- local facalicon = make_fa_icon('\u{f783}' )
local fatimeicon = make_fa_icon("\u{f017}")
local famusicicon = make_fa_icon("\u{f025}")

-- local favolmut = make_fa_icon('\u{f204}' )
-- local favoloff = make_fa_icon('\u{f715}' )
-- local favollow = make_fa_icon('\u{f105}' )
-- local favolhig = make_fa_icon('\u{f101}' )

local favolmut = make_fa_icon("\u{f6a9}")
-- local favolmut = make_fa_icon('\u{f410}' )
local favoloff = make_fa_icon("\u{f026}")
local favollow = make_fa_icon("\u{f027}")
local favolhig = make_fa_icon("\u{f028}")

local batempty = make_fa_icon("\u{f244}")
local batfull = make_fa_icon("\u{f240}")
local batlow = make_fa_icon("\u{f243}")
local batmed = make_fa_icon("\u{f242}")
local batsemi = make_fa_icon("\u{f241}")
local batna = make_fa_icon("\u{f0e7}")
local batplug = make_fa_icon("\u{f1e6}")

-- MEM
-- local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
	end,
})

-- CPU
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
	end,
})

-- Coretemp
-- local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
	end,
})

-- Battery
local baticon = batna

local bat = lain.widget.bat({
	settings = function()
		if bat_now.status and bat_now.status ~= "N/A" then
			if bat_now.ac_status == 1 then
				baticon:set_markup_silently(batplug.markup)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
				baticon:set_markup_silently(batempty.markup)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
				baticon:set_markup_silently(batlow.markup)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 65 then
				baticon:set_markup_silently(batmed.markup)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 90 then
				baticon:set_markup_silently(batsemi.markup)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 90 then
				baticon:set_markup_silently(batfull.markup)
			else
				baticon:set_markup_silently(batsemi.markup)
			end
			widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
		else
			widget:set_markup(markup.font(theme.font, " AC "))
			baticon:set_markup_silently(batplug.markup)
		end
	end,
})

local volicon = famusicicon
theme.volume = lain.widget.alsa({
	settings = function()
		if volume_now.status == "off" then
			-- volicon:set_markup(markup.font(theme.font, favolmut))
			--
			volicon:set_markup_silently(favolmut.markup)
			-- volicon:set_markup(markup.font(theme.font, favolmut.markup))
		elseif tonumber(volume_now.level) == 0 then
			volicon:set_markup_silently(favoloff.markup)
			-- volicon:set_markup(markup.font(theme.font, "OFF"))
		elseif tonumber(volume_now.level) <= 50 then
			-- volicon:set_markup(markup.font(theme.font, "LOW"))
			volicon:set_markup_silently(favollow.markup)
		else
			-- favolmut:set_markup_silently(favolhig)
			-- volicon:set_markup(markup.font(theme.font, "HIGH"))
			volicon:set_markup_silently(favolhig.markup)
		end

		widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
	end,
})

theme.volume.widget:buttons(awful.util.table.join(
	awful.button({}, 4, function()
		awful.util.spawn("amixer set Master 1%+")
		theme.volume.update()
	end),
	awful.button({}, 5, function()
		awful.util.spawn("amixer set Master 1%-")
		theme.volume.update()
	end)
))

-- Separators
local spr = wibox.widget.textbox(" ")
-- local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
-- local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)

function theme.at_screen_connect(s)
	-- Quake application
	s.quake = lain.util.quake({ app = awful.util.terminal })

	-- If wallpaper is a function, call it with the screen
	local wallpaper = theme.wallpaper
	if type(wallpaper) == "function" then
		wallpaper = wallpaper(s)
	end
	gears.wallpaper.maximized(wallpaper, s, true)

	-- Tags
	awful.tag(awful.util.tagnames, s, awful.layout.layouts)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)

	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 2, function()
			awful.layout.set(awful.layout.layouts[1])
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist(
		s,
		awful.widget.taglist.filter.all,
		-- arrl_ld,
		awful.util.taglist_buttons
	)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

	-- Create the wibox
	s.mywibox = awful.wibar({
		shape = gears.shape.rounded_rect,
		ontop = false,
		border_width = 4,
		position = "bottom",
		screen = s,
		height = dpi(24),
		opacity = 0.9,
		bg = theme.bg_normal,
		fg = theme.fg_normal,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			spr,
			spr,
			-- wibox.widget.systray(),
			volicon,
			theme.volume.widget,
			famemicon,
			mem.widget,
			facpuicon,
			cpu.widget,
			fatempicon,
			temp.widget,
			fatimeicon,
			clock,
			baticon,
			bat.widget,
			s.mylayoutbox,
			spr,
			spr,
		},
	})
end

return theme
