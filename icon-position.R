# Calculations for icon positioning ----

# canvas size from Inkscape
canvas_width <- 4714.964
canvas_height <- 2824.115

# icons positions and sizes
icons <- list(
  contact = list(x = 1164.046, y = 412.340, w = 983.975),
  home = list(x = 2190.854, y = 0.00, w = 1262.055),
  illustration = list(x = 2618.462, y = 1035.615, w = 977.5),
  open_science = list(x = 73.0, y = 1151.884, w = 459.129),
  research = list(x = 287.094, y = 358.972, w = 1242.664),
  talks_workshops = list(x = 1677.528, y = 333.299, w = 941.193)
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