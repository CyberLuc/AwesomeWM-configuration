-- | Clock / Calendar | --

--{{-- Time and Date Widget }} --
--man strftime
--%b     The abbreviated month name according to the current locale.
--%d     The day of the month as a decimal number (range 01 to 31).
--%I     The hour as a decimal number using a 12-hour clock (range 01 to 12).
--%H     The hour as a decimal number using a 24-hour clock (range 00 to 23).
--%M     The minute as a decimal number (range 00 to 59).
--%S     The second as a decimal number (range 00 to 60).

mytextclock    = awful.widget.textclock(markup(clockgf, space3 .. "%H:%M" .. markup.font("Tamsyn 3", " ")))
mytextcalendar = awful.widget.textclock(markup(clockgf, space3 .. "%A %d %B"))

widget_clock = wibox.widget.imagebox()
widget_clock:set_image(beautiful.widget_clock)

clockwidget = wibox.widget.background()
clockwidget:set_widget(mytextclock)
clockwidget:set_bgimage(beautiful.widget_display)

local index = 1
local loop_widgets = { mytextclock, mytextcalendar }
local loop_widgets_icons = { beautiful.widget_clock, beautiful.widget_cal }

clockwidget:buttons(awful.util.table.join(awful.button({}, 1,
    function ()
        index = index % #loop_widgets + 1
        clockwidget:set_widget(loop_widgets[index])
        widget_clock:set_image(loop_widgets_icons[index])
    end)))