-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers


config_dir = (os.getenv("HOME").."/.config/awesome/")
init_dir = (config_dir .. "init/")
widgets_dir = (init_dir .. "widgets/")
keybindings_dir = (init_dir .. "keybindings/")
scripts_dir = (config_dir .. "/scripts/")
-- config_dir = (os.getenv("HOME").."/.config/awesome/")
themes_dir = (config_dir .. "themes/pro-medium-dark")
beautiful.init(themes_dir .. "/theme.lua")
-- This is used later as the default terminal,
--  browser and editor to run.
-- terminal = "lilyterm --geometry 81x21"
terminal = "lilyterm"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = "emacsclient -n "
-- editor_cmd = terminal .. " -e " .. editor
browser = "firefox"

-- modkey.
modkey   = "Mod4"
altkey   = "Mod1"
altkey_r = "Mod3"

-- Table of layouts to cover with awful.layout.inc,
-- order matters.
layouts = {
   awful.layout.suit.floating,
   --awful.layout.suit.fair,
   awful.layout.suit.tile,
   awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   awful.layout.suit.tile.top,
   lain.layout.uselesstile,
}
-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
   names = {
      "Firefox", "Emacs", "Term.", "Dev.",
      "Ver.", "Virt.", "Misc"
   },
   layouts = {
      layouts[1], layouts[2], layouts[2], layouts[1],
      layouts[1], layouts[1], layouts[2],
   }
}
-- }}}
