-- {{{ Wibox
mywibox           = {}
mypromptbox       = {}
mylayoutbox       = {}

for s = 1, screen.count() do
   -- Create a promptbox for each screen
   mypromptbox[s] = awful.widget.prompt()
   -- Create an imagebox widget which will contains an icon
   -- indicating which layout we're using.
   -- We need one layoutbox per screen.
   mylayoutbox[s] = awful.widget.layoutbox(s)
   mylayoutbox[s]:buttons(awful.util.table.join(
      awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
      awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
      awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
      awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
   -- Create a taglist widget
   mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
   -- Create a tasklist widget
   mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

   -- Create the wibox
   mywibox[s] = awful.wibox({ position = "top", screen = s, height = "22" })

   -- Widgets that are aligned to the left
   local left_layout = wibox.layout.fixed.horizontal()
   left_layout:add(mylauncher)
   left_layout:add(spr5px)
   left_layout:add(mytaglist[s])
   left_layout:add(spr5px)

   -- Widgets that are aligned to the right
   local right_layout = wibox.layout.fixed.horizontal()
   if s == 1 then
      right_layout:add(spr)
      right_layout:add(spr5px)
      right_layout:add(mypromptbox[s])
      right_layout:add(wibox.widget.systray())
      right_layout:add(spr5px)
   end

   right_layout:add(spr)

   right_layout:add(prev_icon)
   right_layout:add(spr)
   right_layout:add(stop_icon)
   right_layout:add(spr)
   right_layout:add(play_pause_icon)
   right_layout:add(spr)
   right_layout:add(next_icon)
   right_layout:add(mpd_sepl)
   right_layout:add(musicwidget)
   right_layout:add(mpd_sepr)

   right_layout:add(spr)

   right_layout:add(widget_mail)
   right_layout:add(widget_display_l)
   right_layout:add(mailwidget)
   right_layout:add(widget_display_r)
   right_layout:add(spr5px)

   right_layout:add(spr)

   right_layout:add(widget_cpu)
   right_layout:add(widget_display_l)
   right_layout:add(cpuwidget)
   right_layout:add(widget_display_r)
   -- right_layout:add(widget_display_c)
   -- right_layout:add(tmpwidget)
   -- right_layout:add(widget_tmp)
   -- right_layout:add(widget_display_r)
   right_layout:add(spr5px)

   right_layout:add(spr)

   right_layout:add(widget_mem)
   right_layout:add(widget_display_l)
   right_layout:add(memwidget)
   right_layout:add(widget_display_r)
   right_layout:add(spr5px)

   right_layout:add(spr)

   right_layout:add(widget_fs)
   right_layout:add(widget_display_l)
   right_layout:add(fswidget)
   right_layout:add(widget_display_r)
   right_layout:add(spr5px)

   right_layout:add(spr)

   right_layout:add(widget_netdl)
   right_layout:add(widget_display_l)
   right_layout:add(netwidgetdl)
   right_layout:add(widget_display_c)
   right_layout:add(netwidgetul)
   right_layout:add(widget_display_r)
   right_layout:add(widget_netul)

   right_layout:add(spr)

   right_layout:add(widget_clock)
   right_layout:add(widget_display_l)
   right_layout:add(clockwidget)
   right_layout:add(widget_display_r)
   right_layout:add(spr5px)

   right_layout:add(spr)

   right_layout:add(mylayoutbox[s])

   local layout = wibox.layout.align.horizontal()
   layout:set_left(left_layout)
   layout:set_middle(mytasklist[s])
   layout:set_right(right_layout)

   mywibox[s]:set_bg(beautiful.panel)

   mywibox[s]:set_widget(layout)
end
-- }}}