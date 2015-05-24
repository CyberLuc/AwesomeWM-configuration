-- Standard awesome librar
gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- require("myplacesmenu")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")
vicious = require("vicious")
lain = require("lain")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
   naughty.notify({ preset = naughty.config.presets.critical,
                    title = "Oops, there were errors during startup!",
                    text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
   local in_error = false
   awesome.connect_signal("debug::error",
      function (err)
         -- Make sure we don't go into an endless error loop
         if in_error then return end
         in_error = true

         naughty.notify({ preset = naughty.config.presets.critical,
                          title = "Oops, an error happened!",
                          text = err })
         in_error = false
      end
   )
end
-- }}}

----------------------------------------------------------------------
dofile(os.getenv("HOME").."/.config/awesome/init/variables.lua")
----------------------------------------------------------------------
-- {{{ Wallpaper
-- if beautiful.wallpaper then
--    for s = 1, screen.count() do
--       gears.wallpaper.maximized(beautiful.wallpaper, s, true)
--    end
-- end
-- awful.util.spawn(scripts_dir .. "changeWallpaper.sh init")
-- }}}
----------------------------------------------------------------------
for s = 1, screen.count() do
   -- Each screen has its own tag table.
   tags[s] = awful.tag(tags.names, s, tags.layouts)
end
----------------------------------------------------------------------
dofile(init_dir .. "initWidgets.lua")
----------------------------------------------------------------------
dofile(init_dir .. "initKeybindings.lua")
dofile(init_dir .. "rules.lua")
dofile(init_dir .. "signals.lua")
dofile(init_dir .. "autostart.lua")
----------------------------------------------------------------------
