-- app variables
local browser = "zen-browser"
local terminal = "ghostty"


-- app bindings
local appBind = "SUPER + SHIFT"

hl.unbind(appBind .. " + B")
hl.unbind(appBind .. " + RETURN")
hl.unbind("SUPER + RETURN")
hl.unbind(appBind .. " + M")
hl.unbind(appBind .. " + D")
hl.unbind(appBind .. " + F")
hl.unbind(appBind .. " + W")
hl.unbind(appBind .. " + Y")
hl.unbind(appBind .. " + R")

o.bind(appBind .. " + B", "Open browser", browser)
o.bind("SUPER + RETURN", "Open terminal", terminal)
o.bind(appBind .. " + M", "Open Pear Desktop", "pear-desktop")
o.bind(appBind .. " + D", "Open Discord", "discord-canary")
o.bind(appBind .. " + F", "Open file manager", "nautilus")
o.bind(appBind .. " + W", "Open Omawrite", "omawrite")
o.bind(appBind .. " + R", "Open Foliate", "foliate")


-- manage windows
local wmBind = "SUPER + CTRL"

hl.unbind(wmBind .. " + F")
hl.unbind("SUPER + F")
hl.unbind(wmBind .. " + X")
hl.unbind("SUPER + W")
hl.unbind(wmBind .. " + P")
hl.unbind("SUPER + H")
hl.unbind("SUPER + L")
hl.unbind("SUPER + SHIFT + H")
hl.unbind("SUPER + SHIFT + L")

o.bind(wmBind .. " + F", "Toggle fullscreen", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
o.bind(wmBind .. " + X", "Close window", hl.dsp.window.close())
o.bind(wmBind .. " + P", "Toggle floating", hl.dsp.window.float({ action = "toggle"}))
o.bind("SUPER + H", "Focus left", hl.dsp.focus({direction = "left"}))
o.bind("SUPER + L", "Focus right", hl.dsp.focus({direction = "right"}))
o.bind("SUPER + SHIFT + L", "Swap window right", hl.dsp.window.swap({ direction = "right" }))
o.bind("SUPER + SHIFT + H", "Swap window left", hl.dsp.window.swap({ direction = "left" }))


-- scrolloverview subbmap
hl.bind("SUPER + SUPER_L", function()
    hl.plugin.scrolloverview.overview("open all")
    hl.dispatch(hl.dsp.submap("scrolloverview"))
end, { release = true })

if hl.plugin and hl.plugin.scrolloverview then
  hl.define_submap("scrolloverview", function ()
      hl.bind("H", hl.plugin.scrolloverview.navigate("left"))
      hl.bind("L", hl.plugin.scrolloverview.navigate("right"))
      hl.bind("J", hl.plugin.scrolloverview.navigate("down"))
      hl.bind("K", hl.plugin.scrolloverview.navigate("up"))

      hl.bind("SHIFT + K", hl.dsp.window.move({ workspace = "r-1" }))
      hl.bind("SHIFT + J", hl.dsp.window.move({ workspace = "r+1" }))
      hl.bind("SHIFT + L", hl.dsp.window.swap({ direction = "right"}))
      hl.bind("SHIFT + H", hl.dsp.window.swap({ direction = "left" }))

      hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
      hl.bind(appBind .. " + B", hl.dsp.exec_cmd(browser))
      hl.bind(appBind .. " + M", hl.dsp.exec_cmd("pear-desktop"))
      hl.bind(appBind .. " + D", hl.dsp.exec_cmd("discord-canary"))
      hl.bind(appBind .. " + F", hl.dsp.exec_cmd("nautilus"))
      hl.bind(appBind .. " + R", hl.dsp.exec_cmd("foliate"))

      hl.bind("X", hl.dsp.window.close())

      hl.bind("ESCAPE", function ()
          hl.plugin.scrolloverview.overview("off")
          hl.dispatch(hl.dsp.submap("reset"))
      end)

      hl.bind("RETURN", function ()
          hl.plugin.scrolloverview.overview("off")
          hl.dispatch(hl.dsp.submap("reset"))
      end)
  end)
end

