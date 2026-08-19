hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 6,
    border_size = 2,

    layout = "scrolling"
  },

  decoration = {
    rounding = 3,
    active_opacity = 0.97,
    inactive_opacity = 0.9,

    blur = {
      enabled = true,
      size = 8,
      passes = 2
    },

    shadow = {
      enabled = false
    }
  },

  scrolling = {
    fullscreen_on_one_column = true,
    column_width = 1,
    focus_fit_method = 1
  },

  plugin = {
    scrolloverview = {
      scale = 0.6,
      gesture_distance = 300,
      workspace_gap = 27,
      layout = "vertical",
      wallpaper = 0,

      shadow = {
          enabled = true,
        range = 27
      }
    }
  }
})
