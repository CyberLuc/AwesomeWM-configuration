-- | NET | --

function get_device()
   f = io.popen("ip link show | cut -d' ' -f2,9")
   local isLo = false
   local ws = ""
   for line in f:lines() do
      if isLo then
         if string.len(line) > 0 then
            ws = ws .. line
         else
            ws = ws .. "\n"
         end

      else
         isLo = true
      end
   end
   f:close()
   ws = ws:match("%w+: UP") or ws:match("%w+: UNKNOWN")
   if ws ~= nil then
      return ws:match("(%w+):")
   else
      return "network off"
   end
end

net_widgetdl = wibox.widget.textbox()
net_widgetul = lain.widgets.net({
      --iface = "wlp8s0",
      -- iface = "enp7s0",
      iface = get_device(),
      settings = function()
         widget:set_markup(markup.font("Tamsyn 1", "  ") .. net_now.sent)
         net_widgetdl:set_markup(markup.font("Tamsyn 1", " ") .. net_now.received .. markup.font("Tamsyn 1", " "))
      end
})

widget_netdl = wibox.widget.imagebox()
widget_netdl:set_image(beautiful.widget_netdl)
netwidgetdl = wibox.widget.background()
netwidgetdl:set_widget(net_widgetdl)
netwidgetdl:set_bgimage(beautiful.widget_display)

widget_netul = wibox.widget.imagebox()
widget_netul:set_image(beautiful.widget_netul)
netwidgetul = wibox.widget.background()
netwidgetul:set_widget(net_widgetul)
netwidgetul:set_bgimage(beautiful.widget_display)
