-- This function is for awesome versions prior to 3.4

dropdown = {}

function dropdown_toggle(prog, height, s)
   if s == nil then s = mouse.screen end
   if height == nil then height = 0.2 end

   if not dropdown[prog] then
      -- Create table
      dropdown[prog] = {}

      -- Add unmanage hook for dropdown programs
      awful.hooks.unmanage.register(function (c)
                                       for scr, cl in pairs(dropdown[prog]) do
                                          if cl == c then
                                             dropdown[prog][scr] = nil
                                          end
                                       end
                                    end)
   end

   if not dropdown[prog][s] then
      spawnw = function (c)
                  -- Store client
                  dropdown[prog][s] = c

                  -- Float client
                  awful.client.floating.set(c, true)

                  -- Get screen geometry
                  screengeom = screen[s].workarea

                  -- Calculate height
                  if height < 1 then
                     height = screengeom.height*height
                  end

                  -- I like a different border with for the popup window
                  -- So I don't confuse it with terminals in the layout
                  bw = 2

                  -- Resize client
                  c:geometry({
                                x = screengeom.x,
                                y = screengeom.y - 1000,
                                width = screengeom.width - bw,
                                height = height - bw
                             })

                  -- Mark terminal as ontop
                  --            c.ontop = true
                  --            c.above = true
                  c.border_width = bw

                  -- Focus and raise client
                  c:raise()
                  client.focus = c

                  -- Remove hook
                  awful.hooks.manage.unregister(spawnw)
               end

      -- Add hook
      awful.hooks.manage.register(spawnw)

      -- Spawn program
      awful.util.spawn(prog)

      dropdown.currtag = awful.tag.selected(s)
   else
      -- Get client
      c = dropdown[prog][s]

      -- Switch the client to the current workspace

      -- Focus and raise if not hidden
      if c.hidden then
         awful.client.movetotag(awful.tag.selected(s), c)
         c.hidden = false
         c:raise()
         client.focus = c
      else
         if awful.tag.selected(s) == dropdown.currtag then
            c.hidden = true
            local ctags = c:tags()
            for i, t in pairs(ctags) do
               ctags[i] = nil
            end
            c:tags(ctags)
         else
            awful.client.movetotag(awful.tag.selected(s), c)
            c:raise()
            client.focus = c
         end
      end
      dropdown.currtag = awful.tag.selected(s)
   end
end