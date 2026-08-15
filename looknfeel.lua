hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 3,
    border_size = 2,

    layout = "scrolling"
  },

  decoration = {
    rounding = 3,
    dim_inactive = true,
    dim_strength = 0.1,
    active_opacity = 1,

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
    fullscreen_on_one_column = false,
    column_width = 1
  },

  plugin = {
    scrolloverview = {
      scale = 0.63,
      gesture_distance = 300,
      workspace_gap = 27,
      layout = "vertical",
      wallpaper = 0,

      shadow = {
          enabled = false,
        range = 27
      }
    }
  }
})
