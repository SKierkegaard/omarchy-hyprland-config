local browser = "brave-origin"
local terminal = "ghostty"
local appMod = "SUPER + SHIFT"
local windowMod = "SUPER + CTRL"

hl.config({
  plugin = {
    scrolloverview = {
      scale = 0.53,
      gesture_distance = 300,
      workspace_gap = 35,
      layout = "vertical",
      wallpaper = 0,

      shadow = {
        enabled = true,
        range = 12
      }
    }
  }
})

local lastWorkspaceScrollBind

local function table_value(value, ...)
    if value == nil then
        return nil
    end

    for _, key in ipairs({ ... }) do
        local ok, item = pcall(function()
            return value[key]
        end)

        if ok and item ~= nil then
            return item
        end
    end

    return nil
end

local function last_workspace_state()
    local monitor = hl.get_monitor_at_cursor() or hl.get_active_monitor()
    if not monitor then
        return false, nil
    end

    local activeWorkspace = table_value(monitor, "active_workspace")
    local activeWorkspaceId = table_value(activeWorkspace, "id")
    if type(activeWorkspaceId) ~= "number" or activeWorkspaceId <= 0 then
        return false, nil
    end

    local activeWorkspaceWindows = table_value(activeWorkspace, "windows")
    if type(activeWorkspaceWindows) ~= "number" or activeWorkspaceWindows == 0 then
        return false, nil
    end

    local lastWorkspaceId
    for _, workspace in ipairs(hl.get_workspaces()) do
        local id = table_value(workspace, "id")

        if type(id) == "number"
            and id > 0
            and table_value(workspace, "special") ~= true
            and table_value(workspace, "monitor") == monitor then
            lastWorkspaceId = math.max(lastWorkspaceId or id, id)
        end
    end

    return activeWorkspaceId == lastWorkspaceId, monitor
end

local function create_workspace_at_end()
    local isLastWorkspace, monitor = last_workspace_state()
    if not isLastWorkspace or not monitor then
        return
    end

    hl.dispatch(hl.dsp.focus({ monitor = table_value(monitor, "name") }))
    hl.dispatch(hl.dsp.focus({ workspace = "emptynm" }))
end

local function update_last_workspace_scroll_bind()
    if not lastWorkspaceScrollBind then
        return
    end

    local enabled = false
    if hl.get_current_submap() == "scrolloverview" then
        enabled = last_workspace_state()
    end

    lastWorkspaceScrollBind:set_enabled(enabled)
end

hl.bind("SUPER + SUPER_L", function ()
  hl.plugin.scrolloverview.overview("toggle")
end)

hl.define_submap("scrolloverview", function ()
  hl.bind("H", hl.plugin.scrolloverview.navigate("left"))
  hl.bind("L", hl.plugin.scrolloverview.navigate("right"))
  hl.bind("j", hl.plugin.scrolloverview.navigate("down"))
  hl.bind("k", hl.plugin.scrolloverview.navigate("up"))
  hl.bind("return", hl.plugin.scrolloverview.overview("off"))
  hl.bind("SHIFT + K", hl.dsp.window.move({ workspace = "r-1" }))
  hl.bind("SHIFT + J", hl.dsp.window.move({ workspace = "r+1" }))
  hl.bind("SHIFT + J", hl.dsp.window.move({ workspace = "r+1" }))
  hl.bind("SHIFT + L", hl.dsp.window.swap({ direction = "right"}))
  hl.bind("SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
  hl.bind("X", hl.dsp.window.close())

  hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
  hl.bind(appMod .. " + B", hl.dsp.exec_cmd(browser))
  hl.bind(appMod .. " + M", hl.dsp.exec_cmd("pear-desktop"))
  hl.bind(appMod .. " + D", hl.dsp.exec_cmd("discord-canary"))
  hl.bind(appMod .. " + F", hl.dsp.exec_cmd("nautilus"))
  hl.bind(appMod .. " + R", hl.dsp.exec_cmd("flatpak run com.github.johnfactotum.Foliate"))
  hl.bind(windowMod .. " + Z", hl.dsp.exec_cmd("hyprctl reload"))
  hl.bind(appMod .. " + I", hl.dsp.exec_cmd("btop"))

  lastWorkspaceScrollBind = hl.bind("j", create_workspace_at_end)
  lastWorkspaceScrollBind:set_enabled(false)
  hl.on("workspace.active", update_last_workspace_scroll_bind)
  hl.on("workspace.created", update_last_workspace_scroll_bind)
  hl.on("workspace.removed", update_last_workspace_scroll_bind)
  hl.on("workspace.move_to_monitor", update_last_workspace_scroll_bind)
  hl.on("window.open", update_last_workspace_scroll_bind)
  hl.on("window.close", update_last_workspace_scroll_bind)
  hl.on("window.move_to_workspace", update_last_workspace_scroll_bind)
  hl.on("monitor.focused", update_last_workspace_scroll_bind)
  hl.on("keybinds.submap", update_last_workspace_scroll_bind)

  local lastWorkspaceScrollTimer = hl.timer(update_last_workspace_scroll_bind, {
    timeout = 50,
    type = "repeat",
  })

  update_last_workspace_scroll_bind()

end)
