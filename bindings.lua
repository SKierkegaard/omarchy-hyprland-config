-- app variables
local browser = "brave-origin"
local terminal = "ghostty"


-- app bindings
local appMod = "SUPER + SHIFT"

o.bind(appMod .. " + B", "Browser", browser)
o.bind("SUPER + RETURN", "Terminal", terminal)
o.bind(appMod .. " + M", "Pear Desktop", "pear-desktop")
o.bind(appMod .. " + D", "Discord", "discord-canary")
o.bind(appMod .. " + F", "File manager", "nautilus")
o.bind(appMod .. " + W", "Omawrite", "omawrite")
o.bind(appMod .. " + R", "Foliate", "flatpak run com.github.johnfactotum.Foliate")
o.bind(appMod .. " + S", "Local Send", "flatpak run org.localsend.localsend_app")


-- manage windows
local windowMod = "SUPER + CTRL"

o.bind(windowMod .. " + F", "Toggle fullscreen", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
o.bind(windowMod .. " + X", "Close window", hl.dsp.window.close())
o.bind(windowMod .. " + I", "Toggle floating", hl.dsp.window.float({ action = "toggle"}))
o.bind("SUPER + H", "Focus left", hl.dsp.focus({direction = "left"}))
o.bind("SUPER + L", "Focus right", hl.dsp.focus({direction = "right"}))
o.bind("SUPER + SHIFT + L", "Swap window right", hl.dsp.window.swap({ direction = "right" }))
o.bind("SUPER + SHIFT + H", "Swap window left", hl.dsp.window.swap({ direction = "left" }))
o.bind(windowMod .. " + Z", "WTF? hyprctl reload", hl.dsp.exec_cmd("hyprctl reload"))
o.bind_toggle(windowMod .. " + B", "Toggle top bar", "bar")
o.bind(windowMod .. " + P", "Screenshot", "omarchy-capture-screenshot")


-- omarchy menus
o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle")
o.bind("SUPER + U", "Capture menu", "omarchy-menu toggle capture")
o.bind("SUPER + N", "Dismiss last notification", "omarchy-shell notifications dismissOne")
o.bind("SUPER + K", "Keybindings", "omarchy-menu-keybindings")


-- utilities
local function send_shortcut_once(mods, key)
  return function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))

    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end
end

-- Lean on the terminal tag from default/hypr/apps/terminals.lua so there's one
-- definition of what counts as a terminal. Dynamic tags carry a trailing "*".
local function active_window_is_terminal()
  local window = hl.get_active_window()
  if not window then
    return false
  end

  for _, tag in ipairs(window.tags or {}) do
    if tag:gsub("%*$", "") == "terminal" then
      return true
    end
  end

  return false
end

local function universal_clipboard_shortcut(default_mods, default_key, terminal_mods, terminal_key)
  return function()
    if active_window_is_terminal() then
      send_shortcut_once(terminal_mods, terminal_key)()
    else
      send_shortcut_once(default_mods, default_key)()
    end
  end
end

local function send_shortcut_once(mods, key)
  return function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))

    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end
end

-- Lean on the terminal tag from default/hypr/apps/terminals.lua so there's one
-- definition of what counts as a terminal. Dynamic tags carry a trailing "*".
local function active_window_is_terminal()
  local window = hl.get_active_window()
  if not window then
    return false
  end

  for _, tag in ipairs(window.tags or {}) do
    if tag:gsub("%*$", "") == "terminal" then
      return true
    end
  end

  return false
end

local function universal_clipboard_shortcut(default_mods, default_key, terminal_mods, terminal_key)
  return function()
    if active_window_is_terminal() then
      send_shortcut_once(terminal_mods, terminal_key)()
    else
      send_shortcut_once(default_mods, default_key)()
    end
  end
end
local function send_shortcut_once(mods, key)
  return function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))

    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end
end

-- Lean on the terminal tag from default/hypr/apps/terminals.lua so there's one
-- definition of what counts as a terminal. Dynamic tags carry a trailing "*".
local function active_window_is_terminal()
  local window = hl.get_active_window()
  if not window then
    return false
  end

  for _, tag in ipairs(window.tags or {}) do
    if tag:gsub("%*$", "") == "terminal" then
      return true
    end
  end

  return false
end

local function universal_clipboard_shortcut(default_mods, default_key, terminal_mods, terminal_key)
  return function()
    if active_window_is_terminal() then
      send_shortcut_once(terminal_mods, terminal_key)()
    else
      send_shortcut_once(default_mods, default_key)()
    end
  end
end

o.bind("SUPER + C", "Universal copy", universal_clipboard_shortcut("CTRL", "C", "CTRL", "Insert"))
o.bind("SUPER + V", "Universal paste", universal_clipboard_shortcut("CTRL", "V", "SHIFT", "Insert"))
o.bind("SUPER + X", "Universal cut", universal_clipboard_shortcut("CTRL", "X"))
