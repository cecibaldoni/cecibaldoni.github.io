# Calculations for icon positioning ----

# canvas size from Inkscape
canvas_width <- 5989.414
canvas_height <- 3508.340

# icons positions and sizes
#X and Y are in the move tav in "Transform"
#Width is in the scale tab, but resize to 100% before checking the width in px
icons <- list(
  contact = list(x = 2254.159, y = 469.710, w = 983.975),
  home = list(x = 3465.356, y = 139.875, w = 1240.665),
  illustration = list(x = 3892.912, y = 1200.190, w = 977.5),
  open_science = list(x = 1309.351, y = 1294.465, w = 459.129),
  research = list(x = 1561.580, y = 522.934, w = 1242.664),
  talks_workshops = list(x = 2951.977, y = 497.873, w = 941.813),
  blog = list(x=5198.774, y=1283.996, w=328.140),
  coffee = list(x=3123.045, y=1919.772, w =346.426)
)

# calculate top, left, and width in percentages
calc_css <- function(x, y, w) {
  list(
    top = round((y / canvas_height) * 100, 2),
    left = round((x / canvas_width) * 100, 2),
    width = round((w / canvas_width) * 100, 2)
  )
}

css_rules <- lapply(icons, function(pos) {
  calc_css(pos$x, pos$y, pos$w)
})

for (name in names(css_rules)) {
  cat(sprintf(".icon-%s {\n  top: %.2f%%;\n  left: %.2f%%;\n  width: %.2f%%;\n}\n\n",
              gsub("_", "-", name),
              css_rules[[name]]$top,
              css_rules[[name]]$left,
              css_rules[[name]]$width))
}

