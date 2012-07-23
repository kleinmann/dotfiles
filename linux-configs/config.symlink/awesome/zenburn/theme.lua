-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
theme.wallpaper_cmd = { "" }
-- }}}

-- {{{ Styles
theme.font      = "Inconsolata 10"

-- {{{ Colors
theme.fg_normal = "#DCDCCC"
theme.fg_focus  = "#F0DFAF"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#3F3F3F"
theme.bg_focus  = "#1E2320"
theme.bg_urgent = "#3F3F3F"
-- }}}

-- {{{ Borders
theme.border_width  = "2"
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "18"
theme.menu_width  = "100"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "~/.config/awesome/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = "~/.config/awesome/zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "~/.config/awesome/zenburn/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "~/.config/awesome/zenburn/layouts/tile.png"
theme.layout_tileleft   = "~/.config/awesome/zenburn/layouts/tileleft.png"
theme.layout_tilebottom = "~/.config/awesome/zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = "~/.config/awesome/zenburn/layouts/tiletop.png"
theme.layout_fairv      = "~/.config/awesome/zenburn/layouts/fairv.png"
theme.layout_fairh      = "~/.config/awesome/zenburn/layouts/fairh.png"
theme.layout_spiral     = "~/.config/awesome/zenburn/layouts/spiral.png"
theme.layout_dwindle    = "~/.config/awesome/zenburn/layouts/dwindle.png"
theme.layout_max        = "~/.config/awesome/zenburn/layouts/max.png"
theme.layout_fullscreen = "~/.config/awesome/zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = "~/.config/awesome/zenburn/layouts/magnifier.png"
theme.layout_floating   = "~/.config/awesome/zenburn/layouts/floating.png"
-- }}}

-- {{{ Widget icons
theme.widget_cpu    = "~/.config/awesome/zenburn/icons/cpu.png"
theme.widget_bat    = "~/.config/awesome/zenburn/icons/bat.png"
theme.widget_mem    = "~/.config/awesome/zenburn/icons/mem.png"
theme.widget_fs     = "~/.config/awesome/zenburn/icons/disk.png"
theme.widget_music  = "~/.config/awesome/zenburn/icons/music.png"
theme.widget_net    = "~/.config/awesome/zenburn/icons/down.png"
theme.widget_netup  = "~/.config/awesome/zenburn/icons/up.png"
theme.widget_wifi   = "~/.config/awesome/zenburn/icons/wifi.png"
theme.widget_mail   = "~/.config/awesome/zenburn/icons/mail.png"
theme.widget_vol    = "~/.config/awesome/zenburn/icons/vol.png"
theme.widget_org    = "~/.config/awesome/zenburn/icons/cal.png"
theme.widget_date   = "~/.config/awesome/zenburn/icons/time.png"
theme.widget_crypto = "~/.config/awesome/zenburn/icons/crypto.png"
theme.widget_sep    = "~/.config/awesome/zenburn/icons/separator.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "~/.config/awesome/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "~/.config/awesome/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "~/.config/awesome/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
