-- {{ Function to ensure that certain programs only have one
-- instance of themselves when i restart awesome

function run_once(cmd)
   findme = cmd
   firstspace = cmd:find(" ")
   if firstspace then
      findme = cmd:sub(0, firstspace-1)
   end
   awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

run_once("compton -b &")
run_once("nm-applet &")
run_once("fcitx &")
run_once("sogou-qimpanel &")
run_once("parcellite &")
run_once("xscreensaver -no-splash &")
run_once("volumeicon &")
-- run_once("numlockx on")
-- run_once("emacs")
-- run_once("variety &")
run_once("keynav &")
run_once("synapse -s")
run_once("xbacklight -set 39")
run_once("xbacklight -set 40")
run_once("mpd&")
run_once(scripts_dir .. "initMPD.sh")
run_once("~/Bin/setScreens.sh")
run_once("xinput set-button-map \"SynPS/2 Synaptics TouchPad\" 1 2 3 5 4 7 6 8 9 10 11 12")
run_once(scripts_dir .. "changeWallpaper.sh init&")
--run_once("~/Bin/autoKeyboardLayout.sh &")
run_once("tilda &")
--run_once(scripts_dir .. "changeWallpaper.sh next")

-- run_once("dbus-launch docky")
-- awful.util.spawn_with_shell("cairo-compmgr &")
