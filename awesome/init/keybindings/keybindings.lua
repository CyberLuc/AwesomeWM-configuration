-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
                awful.button({ }, 3, function () mymainmenu:toggle() end),
                awful.button({ }, 4, awful.tag.viewnext),
                awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

------------------------------------------------------------------------
-- {{{ Key bindings
globalkeys = awful.util.table.join(
   awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
   awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
   awful.key({ modkey,           }, "i",      awful.tag.viewprev       ),
   awful.key({ modkey,           }, "o",      awful.tag.viewnext       ),
   awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
   --awful.key({ modkey,           }, "x",      awful.tag.history.restore),
   awful.key({ modkey,           }, "w", function() mymainmenu:show() end),

   ----------------------------------------------------------------------
   -- {{ Shortcut Key Bindings }} --
   awful.key({ modkey   , altkey}, "l",
      function() awful.util.spawn("slimlock") end),

   awful.key({ "Control", modkey}, "a",
      function() awful.util.spawn(browser) end),

   awful.key({ "Control", modkey}, "b",
      function() awful.util.spawn("/opt/sublime_text_3/sublime_text") end),

   awful.key({ "Control", modkey}, "c",
      function() awful.util.spawn("codeblocks") end),

   awful.key({ "Control", modkey}, "d",
      function() awful.util.spawn("nautilus") end),

   awful.key({ "Control", modkey}, "e",
      function() awful.util.spawn("emacs") end),

   awful.key({ "Control", modkey}, "p",
      function() awful.util.spawn("shutter --section -n") end),

   awful.key({ "Control", modkey}, "v",
      function() awful.util.spawn("virtualbox") end),

   awful.key({ modkey, altkey}, "k",
      function()
         local oldspawn = awful.util.spawn
         awful.util.spawn = function (s)
            oldspawn(s, false)
         end
         awful.util.spawn("/home/twtwtw/Bin/autoKeyboardLayout.sh &")
      end
   ),
   ----------------------------------------------------------------------
   awful.key({ modkey, altkey}, "n",
      function()
         local oldspawn = awful.util.spawn
         awful.util.spawn = function (s)
            oldspawn(s, false)
         end
         awful.util.spawn(
            scripts_dir .. "changeWallpaper.sh next")
      end
   ),
   awful.key({ modkey, altkey}, "p",
      function()
         local oldspawn = awful.util.spawn
         awful.util.spawn = function (s)
            oldspawn(s, false)
         end
         awful.util.spawn(
            scripts_dir .. "changeWallpaper.sh previous")
      end
   ),
   awful.key({ modkey, altkey}, "d",
      function()
         local oldspawn = awful.util.spawn
         awful.util.spawn = function (s)
            oldspawn(s, false)
         end
         awful.util.spawn(
            scripts_dir .. "changeWallpaper.sh delete")
      end
   ),
   awful.key({ modkey, altkey}, "r",
      function()
         local oldspawn = awful.util.spawn
         awful.util.spawn = function (s)
            oldspawn(s, false)
         end
         awful.util.spawn(
            scripts_dir .. "changeWallpaper.sh init")
      end
   ),
   ----------------------------------------------------------------------
   -- awful.key({ modkey , "Mod3"}, "s",
   --    function() awful.util.spawn(scripts_dir .. "setScreen.sh") end),
   ----------------------------------------------------------------------
   -- {{ Volume Control }} --
   --awful.key({     }, "XF86AudioRaiseVolume",
   --    function() awful.util.spawn("amixer set Master 5%+", false) end),
   --awful.key({     }, "XF86AudioLowerVolume",
   --    function() awful.util.spawn("amixer set Master 5%-", false) end),
   --awful.key({     }, "XF86AudioMute",
   --    function() awful.util.spawn("amixer set Master toggle", false) end),
   ----------------------------------------------------------------------
   -- {{ Print Screen }}
   awful.key({         }, "Print",
      function() awful.util.spawn("gnome-screenshot") end),
   awful.key({ "Shift" }, "Print",
      function() awful.util.spawn("gnome-screenshot -i") end),

   --awful.key({ modkey }, "Print",
   --    function() awful.util.spawn("scrot -s") end),
   -- awful.key({ modkey, altkey_r }, "s",
   --    function() awful.util.spawn("scrot -s") end),
   ----------------------------------------------------------------------
   -- {{ Vim-like controls:
   awful.key({ modkey,           }, "l",
      function ()
         awful.client.focus.bydirection("right")
         if client.focus then client.focus:raise() end
   end),
   awful.key({ modkey,           }, "h",
      function ()
         awful.client.focus.bydirection("left")
         if client.focus then client.focus:raise() end
   end),
   -- awful.key({ modkey,           }, "j",
   --     function ()
   --         awful.client.focus.bydirection("down")
   --         if client.focus then client.focus:raise() end
   --     end),
   -- awful.key({ modkey,           }, "k",
   --     function ()
   --         awful.client.focus.bydirection("up")
   --         if client.focus then client.focus:raise() end
   --     end),
   ----------------------------------------------------------------------
   awful.key({ modkey,           }, "j",
      function ()
         awful.client.focus.byidx(1)
         if client.focus then client.focus:raise() end
   end),
   awful.key({ modkey,           }, "k",
      function ()
         awful.client.focus.byidx(-1)
         if client.focus then client.focus:raise() end
   end),
   ----------------------------------------------------------------------
   -- Layout manipulation
   awful.key({ modkey, "Shift"   }, "j",
      function () awful.client.swap.byidx(  1)
   end),
   awful.key({ modkey, "Shift"   }, "k",
      function () awful.client.swap.byidx( -1)    end),
   awful.key({ modkey, "Control" }, "j",
      function () awful.screen.focus_relative( 1) end),
   awful.key({ modkey, "Control" }, "k",
      function () awful.screen.focus_relative(-1) end),
   awful.key({ modkey,           }, "Tab",
      function ()
         awful.client.focus.history.previous()
         if client.focus then
            client.focus:raise()
         end
   end),
   awful.key({ altkey,           }, "Tab",
      function ()
         awful.client.focus.byidx(1)
         if client.focus then client.focus:raise() end
   end),
   ----------------------------------------------------------------------
   ----------------------------------------------------------------------
   -- Standard program
   awful.key({ modkey,           }, "Return",
      function () awful.util.spawn(terminal) end),
   awful.key({ modkey, "Control" }, "r", awesome.restart),
   awful.key({ modkey, "Shift"   }, "q", awesome.quit),
   awful.key({ modkey, "Shift"   }, "i",
      function () awful.tag.incmwfact( 0.05)    end),
   awful.key({ modkey, "Shift"   }, "o",
      function () awful.tag.incmwfact(-0.05)    end),
   awful.key({ modkey, "Shift"   }, "h",
      function () awful.tag.incnmaster( 1)      end),
   awful.key({ modkey, "Shift"   }, "l",
      function () awful.tag.incnmaster(-1)      end),
   awful.key({ modkey, "Control" }, "h",
      function () awful.tag.incncol( 1)         end),
   awful.key({ modkey, "Control" }, "l",
      function () awful.tag.incncol(-1)         end),
   awful.key({ modkey,           }, "space",
      function () awful.layout.inc(layouts,  1) end),
   awful.key({ modkey, "Shift"   }, "space",
      function () awful.layout.inc(layouts, -1) end),
   awful.key({ modkey, "Control" }, "n", awful.client.restore),
   ----------------------------------------------------------------------
   -- Prompt
   awful.key({ modkey },            "r",
      function () mypromptbox[mouse.screen]:run() end)
   ----------------------------------------------------------------------
   -- awful.key({ modkey }, "x",
   --           function ()
   --               awful.prompt.run({ prompt = "Run Lua code: " },
   --               mypromptbox[mouse.screen].widget,
   --               awful.util.eval, nil,
   --               awful.util.getdir("cache") .. "/history_eval")
   --           end),
   -- Menubar
   --awful.key({ modkey }, "p", function() menubar.show() end)
)
----------------------------------------------------------------------
root.keys(globalkeys)
