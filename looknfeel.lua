hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,

    layout = "scrolling"
  },

  decoration = {
    rounding = 0,
    active_opacity = 1,
    inactive_opacity = 0.95,

    blur = {
      enabled = false,
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
    focus_fit_method = 0,
    follow_focus = true
  },

  input = {
    follow_mouse = 0,
  },
})
