-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "Manual", terminal .. " -e man awesome" },
   { "Edit config", editor_cmd .. " " .. awesome.conffile },
   { "Restart", awesome.restart },
   { "Lock", function() awful.util.spawn("slimlock") end},
   { "Quit", awesome.quit },
}

myPowerMenu = {
   { "Logout", awesome.quit },
   { "Reboot", function() awful.util.spawn("systemctl reboot") end},
   { "Suspend", function() awful.util.spawn("sudo pm-suspend") end},
   { "Hibernate", function() awful.util.spawn("sudo pm-hibernate") end},
   { "Poweroff", function() awful.util.spawn("systemctl poweroff") end}
}

mymainmenu = awful.menu(
   { items =
        {
           { "Awesome", myawesomemenu, beautiful.awesome_icon },
           { "Open terminal", terminal },
           { "Power", myPowerMenu, beautiful.awesome_icon },
        }
   }
)
----------------------------------------------------------------------
--mylauncher = awful.widget.launcher({ menu = mymainmenu })
mylauncher = awful.widget.launcher({
      image = beautiful.awesome_icon, menu = mymainmenu })
----------------------------------------------------------------------
-- Menubar configuration
-- Set the terminal for applications that require it
menubar.utils.terminal = terminal
-- }}}