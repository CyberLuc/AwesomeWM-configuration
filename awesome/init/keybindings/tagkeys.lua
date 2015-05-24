-- Customized Tag key bindings
globalkeys = awful.util.table.join(globalkeys,
    awful.key({modkey }, "a",
       function()
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[1]
          local cur = awful.tag.selected(1)
          if awful.tag.getidx(cur) == 1 then
             awful.tag.history.restore(screen)
          elseif tag then
             awful.tag.viewonly(tag)
          end
       end
    ),
    awful.key({modkey }, "e",
       function()
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[2]
          local cur = awful.tag.selected(1)
          if awful.tag.getidx(cur) == 2 then
             awful.tag.history.restore(screen)
          elseif tag then
             awful.tag.viewonly(tag)
          end
       end
    ),
    awful.key({modkey }, "d",
       function()
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[4]
          local cur = awful.tag.selected(1)
          if awful.tag.getidx(cur) == 4 then
             awful.tag.history.restore(screen)
          elseif tag then
             awful.tag.viewonly(tag)
          end
       end
    ),
    awful.key({modkey }, "s",
       function()
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[3]
          local cur = awful.tag.selected(1)
          if awful.tag.getidx(cur) == 3 then
             awful.tag.history.restore(screen)
          elseif tag then
             awful.tag.viewonly(tag)
          end
       end
    ),
    awful.key({modkey }, "z",
       function()
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[5]
          local cur = awful.tag.selected(1)
          if awful.tag.getidx(cur) == 5 then
             awful.tag.history.restore(screen)
          elseif tag then
             awful.tag.viewonly(tag)
          end
       end
    ),
    awful.key({modkey }, "x",
       function()
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[6]
          local cur = awful.tag.selected(1)
          if awful.tag.getidx(cur) == 6 then
             awful.tag.history.restore(screen)
          elseif tag then
             awful.tag.viewonly(tag)
          end
       end
    ),
    awful.key({modkey }, "c",
       function()
          local screen = mouse.screen
          local tag = awful.tag.gettags(screen)[7]
          local cur = awful.tag.selected(1)
          if awful.tag.getidx(cur) == 7 then
             awful.tag.history.restore(screen)
          elseif tag then
             awful.tag.viewonly(tag)
          end
       end
    ),
    ----------------------------------------------------------------------
    ----------------------------------------------------------------------
    ---{{{Screen}}}---
    awful.key({modkey }, "F1",
       function()
          awful.screen.focus(1)
       end
    ),
    awful.key({modkey }, "F2",
       function()
          awful.screen.focus(2)
       end
    ),
    awful.key({modkey }, "F3",
       function()
          awful.screen.focus(3)
       end
    )
)

-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
   globalkeys = awful.util.table.join(globalkeys,
      awful.key({ modkey }, "#" .. i + 9,
         function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
               awful.tag.viewonly(tag)
            end
         end
      ),
      awful.key({ modkey, "Control" }, "#" .. i + 9,
         function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
               awful.tag.viewtoggle(tag)
            end
         end
      ),
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
         function ()
            local tag = awful.tag.gettags(client.focus.screen)[i]
            if client.focus and tag then
               awful.client.movetotag(tag)
            end
         end
      ),
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
         function ()
            local tag = awful.tag.gettags(client.focus.screen)[i]
            if client.focus and tag then
               awful.client.toggletag(tag)
            end
      end)
   )
end