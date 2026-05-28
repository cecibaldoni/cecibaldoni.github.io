# Calculations for icon positioning ----

# canvas size from Inkscape - find it in "Document Properties"
canvas_width <- 5989.414
canvas_height <- 3718.340

# icons positions and sizes
#X and Y are in the move tav in "Transform"
#Width is in the scale tab, but resize to 100% before checking the width in px
icons <- list(
  contact = list(x = 2254.204, y = 679.325, w = 983.975),
  home = list(x = 2694.280, y = 4.143, w = 1264.055),
  talks_workshops = list(x = 3764.095, y = 238.191, w = 941.813),
  research = list(x = 1561.630, y = 732.550, w = 1240.664),
  
  bookshop = list(x = 2951.918, y = 691.028, w = 898.412),
  open_science = list(x = 1309.395, y = 1504.081, w = 459.129),
  
  illustration = list(x = 3892.956, y = 1409.806, w = 977.500),
  radio = list(x = 5567.295, y = 1176.360, w = 299.470),
  blog = list(x = 4629.427, y = 1380.903, w = 328.140),
  coffee = list(x = 3101.705, y = 2129,387, w = 427.815)
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
  cat(sprintf(".icon-%s { top: %.2f%%; left: %.2f%%; width: %.2f%%;}\n",
              gsub("_", "-", name),
              css_rules[[name]]$top,
              css_rules[[name]]$left,
              css_rules[[name]]$width))
}

