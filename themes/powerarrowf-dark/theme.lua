---------------------------
-- Default awesome theme --
---------------------------

theme = {}
theme.name = "PowerArrowf-Dark"

-- Setup Paths
themes_dir = os.getenv("HOME") .. "/.config/awesome/themes/powerarrowf-dark"

-- theme.font          = "YaHei Consolas Hybrid 10"
theme.font          = "Hiragino Sans GB W3 8"

-- theme.wallpaper     = themes_dir .. "/wallpaper.png"

theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/wallpaper.png"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#1E2320"
theme.bg_urgent     = "#3F3F3F"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#AAAAAA"
theme.fg_focus      = "#0099CC"
theme.fg_urgent     = "#3F3F3F"

theme.notify_fg     = theme.fg_normal
theme.notify_bg     = theme.bg_normal
theme.notify_border                 = theme.border_focus

theme.border_width  = 0
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel = themes_dir .. "/icons/square_unsel.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"


-- You can use your own layout icons like this:
theme.layout_floating  = themes_dir .. "/layouts/floating.png"
theme.layout_tilebottom = themes_dir  .. "/layouts/tilebottom.png"
theme.layout_tileleft   = themes_dir .. "/layouts/tileleft.png"
theme.layout_tile = themes_dir .. "/layouts/tile.png"
theme.layout_tiletop = themes_dir .. "/layouts/tiletop.png"

--{{ For the Dark Theme }} --

theme.arrl = themes_dir .. "/icons/arrl.png"
theme.arrl_ld = themes_dir .. "/icons/arrl_ld.png"
theme.arrl_dl = themes_dir .. "/icons/arrl_dl.png"

--{{ For the time and date clock icon }} --
theme.clock = themes_dir .. "/icons/myclocknew.png"

--{{ For the wifi icon }} --
theme.netlow = themes_dir .. "/icons/netlow.png"
theme.netmed = themes_dir .. "/icons/netmedium.png"
theme.nethigh = themes_dir .. "/icons/nethigh.png"

--{{ For the charging (AC adaptor) icon }} --
theme.ac = themes_dir .. "/icons/ac.png"

--{{ For the hard drive icon }} --
theme.hdd = themes_dir .. "/icons/hdd.png"

--{{ For the volume icons }} --
theme.mute = themes_dir .. "/icons/mute.png"
theme.music = themes_dir .. "/icons/music.png"

--{{ For the CPU icon }} --
theme.cpu = themes_dir .. "/icons/cpu.png"

--{{ For the Memory icon }} --
theme.mem = themes_dir .. "/icons/mem.png"

--{{ For the mail icons }} --
theme.mail = themes_dir .. "/icons/mail.png"
theme.mailopen = themes_dir .. "/icons/mailopen.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.awesome_icon = themes_dir .. "/icons/awesome_icon.png"
theme.menu_icon = themes_dir .. "/icons/menu_icon.png"
theme.icon_theme = "Faience-Claire"

return theme
