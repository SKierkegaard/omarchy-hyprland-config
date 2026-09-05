-- app variables
local browser = "brave-origin"
local terminal = "ghostty"


-- app bindings
local appMod = "SUPER + SHIFT"

hl.unbind(appMod .. " + B")
hl.unbind(appMod .. " + RETURN")
hl.unbind("SUPER + RETURN")
hl.unbind(appMod .. " + M")
hl.unbind(appMod .. " + D")
hl.unbind(appMod .. " + F")
hl.unbind(appMod .. " + W")
hl.unbind(appMod .. " + Y")
hl.unbind(appMod .. " + R")
hl.unbind(appMod .. " + I")
hl.unbind(appMod .. " + S")

o.bind(appMod .. " + B", "Open browser", browser)
o.bind("SUPER + RETURN", "Open terminal", terminal)
o.bind(appMod .. " + M", "Open Pear Desktop", "pear-desktop")
o.bind(appMod .. " + D", "Open Discord", "discord-canary")
o.bind(appMod .. " + F", "Open file manager", "nautilus")
o.bind(appMod .. " + W", "Open Omawrite", "omawrite")
o.bind(appMod .. " + R", "Open Foliate", "flatpak run com.github.johnfactotum.Foliate")
o.bind(appMod .. " + S", "Open Local Send", "flatpak run org.localsend.localsend_app")


-- manage windows
local windowMod = "SUPER + CTRL"

hl.unbind(windowMod .. " + F")
hl.unbind("SUPER + F")
hl.unbind(windowMod .. " + X")
hl.unbind("SUPER + W")
hl.unbind(windowMod .. " + P")
hl.unbind("SUPER + H")
hl.unbind("SUPER + L")
hl.unbind("SUPER + SHIFT + H")
hl.unbind("SUPER + SHIFT + L")
hl.unbind(windowMod .. " + Z")
hl.unbind("SUPER + SLASH")

o.bind(windowMod .. " + F", "Toggle fullscreen", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
o.bind(windowMod .. " + X", "Close window", hl.dsp.window.close())
o.bind(windowMod .. " + P", "Toggle floating", hl.dsp.window.float({ action = "toggle"}))
o.bind("SUPER + H", "Focus left", hl.dsp.focus({direction = "left"}))
o.bind("SUPER + L", "Focus right", hl.dsp.focus({direction = "right"}))
o.bind("SUPER + SHIFT + L", "Swap window right", hl.dsp.window.swap({ direction = "right" }))
o.bind("SUPER + SHIFT + H", "Swap window left", hl.dsp.window.swap({ direction = "left" }))
o.bind(windowMod .. " + Z", "WTF? hyprctl reload", hl.dsp.exec_cmd("hyprctl reload"))
