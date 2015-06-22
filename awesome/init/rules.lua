-- {{{ Rules
awful.rules.rules = {
   -- All clients will match this rule.
   { rule = { },
     properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        keys = clientkeys,
        buttons = clientbuttons,
        size_hints_honor = false,
        border_width = 0,
        border_color = "#252525" },
     --callback = awful.placement.centered
 },
   ----------------------------------------------------------------------
   { rule_any = {
        class = { "LilyTerm" } },
     properties = {
        border_width = 1,
        border_color = "#252525",
        focus = true } },
   ----------------------------------------------------------------------
   -- floating group --
   {
      rule_any = {
         class = {
            "MPlayer", "gimp", "Thunar",
            "guake", "smplayer", "Gnome-system-monitor",
            "Wine", "PointDownload", "Shutter", "Tilda", "Yad"
         }
      },
      properties = { floating = true }
   },
   ----------------------------------------------------------------------
   -- place centered --
   {
      rule_any = {
         class = {
            "terminology", "LilyTerm"
         }
      },
      properties = { focus = true },
      callback = awful.placement.centered
   },
   ----------------------------------------------------------------------
   -- floating and centered --
   {
      rule_any = {
         instance = {
            "copyq", "eog", "cbconsole",
            "feh", "file_properties",
            "file-roller", "Places"
         },
         class = {
            "Nautilus", "CopyQ", "Eog", "file-roller",
            "Compress", "Gthumb", "feh"
         }
      },
      properties = { floating = true },
      callback = awful.placement.centered
   },
   ----------------------------------------------------------------------
   -- always on top
     { rule_any = {
          instance = { "tilda" },
          class = { "Tilda" } },
       properties = {
          floating = true,
          ontop = true,
          border_width = 1
       }
   },
   ----------------------------------------------------------------------
   -- no border --
   {
      rule_any = {
         instance = {
            "synapse"
         },
         class = {
            "Firefox", "Nautilus", "Bcloud-gui",
            "smplayer", "Gnome-system-monitor", "Wine",
            "PointDownload", "Deepin-music-player", "Synapse"
         }
      },
      properties = { border_width = 0 },
      callback = awful.placement.no_offscreen
   },
   ----------------------------------------------------------------------
   -- specific placement on tag --
   ----------------------------------------------------------------------
   -- [1][1] --
      { rule_any = {
        class = {"Firefox", "Google-chrome-stable"} },
     properties = {
        tag = tags[1][1] },
     callback = awful.placement.no_offscreen },

      { rule = {
        class = "Firefox",
        instance = "Navigator" },
     properties = {
        maximized_vertical = true,
        maximized_horizontal = true },
     callback = awful.placement.no_offscreen },

      { rule = {
        class = "Google-chrome-stable",
        instance = "Google-chrome-stable" },
     properties = {
        maximized_vertical = true,
        maximized_horizontal = true },
     callback = awful.placement.no_offscreen },

   ----------------------------------------------------------------------
   -- [1][2] --
   { rule = {
        class = "Emacs" },
     properties = {
        tag = tags[1][2] } },
   ----------------------------------------------------------------------
   --
   { --[1][4]
      rule_any = {
        class = {
           "CodeBlocks", "Wps", "Et", "Wpp",
           "xfreerdp", "QtCreator", "Gimp"
        }
      },
     properties = { tag = tags[1][4] } },
   --
   { --Maximized
      rule_any = {
        class = {
           "CodeBlocks", "Wps", "Et", "Wpp",
           "xfreerdp", "QtCreator"
        }
      },
     properties = {
        maximized_vertical = true,
        maximized_horizontal = true  } },
   --
   { rule = {
        class = "Codeblocks",
        instance = "codeblocks",
        name = "Start here - Code::Blocks 13.12" },
     properties = {
        maximized_vertical = true,
        maximized_horizontal = true },
     callback = awful.placement.no_offscreen },

   { rule = {
        class = "QtCreator",
        instance = "qtcreator-bin" },
     properties = {
        maximized_vertical = true,
        maximized_horizontal = true },
     callback = awful.placement.no_offscreen },

   ----------------------------------------------------------------------
   -- [1][5] --
   { rule_any = {
        class = { "Deepin-music-player" } },
     properties = {
        tag = tags[1][5] } },

   { rule = {
        class = "FoxitReader" },
     properties = {
        tag = tags[1][5],
        maximized_vertical = true,
        maximized_horizontal = true  } },

   { rule = {
        instance = "Foxit Reader.exe",
        class = "Wine" },
     properties = {
        tag = tags[1][5],
        maximized_vertical = true,
        maximized_horizontal = true  } },
   ----------------------------------------------------------------------
   -- [1][6] --
   { rule = {
        class = "Wine",
        instance = "QQ.exe" },
     properties = {
        tag = tags[1][6],
        x = 0
     },
     callback = awful.placement.no_offscreen },

   { rule = {
        class = "VirtualBox" },
     properties = {
        tag = tags[1][6] } },

   { rule = {
        class = "VirtualBox",
        instance = "Qt-subapplication" },
     properties = {
        -- maximized_vertical = true,
        -- maximized_horizontal = true
     },
     callback = awful.placement.no_offscreen },

   { rule = {
        class = "VirtualBox",
        instance = "Qt-subapplication",
        name="Oracle VM VirtualBox Manager" },
     properties = {
        maximized_vertical = false,
        maximized_horizontal = false
     },
     callback = awful.placement.no_offscreen },
   ----------------------------------------------------------------------
   { rule_any = {
        type = { "dialog", "popup_menu"},
        instance = {"Ehh"},
        class = { "Volumeicon", "Fcitx-config-gtk3", "Nautilus" } },
     properties = {
        focus = true,
        maximized_vertical = false,
        maximized_horizontal = false,
        floating = true },
     callback = awful.placement.centered },
   ----------------------------------------------------------------------
   --{ rule_any = { instance = {"Dialog", "Mozilla"} },
   -- properties = { maximized_vertical = false, maximized_horizontal = false }, callback = awful.placement.centered },
   ----------------------------------------------------------------------
   -- show title bar to specific application
   --
   --{  rule = { class = "Gimp" },
   --   callback = awful.titlebar.add },
}
-- }}}
