# Calculations for icon positioning ----

# canvas size from Inkscape
canvas_width <- 5754.115
canvas_height <- 3235.690

# icons positions and sizes
icons <- list(
  contact = list(x = 2181.909, y = 453.326, w = 983.975),
  home = list(x = 3230.057, y = 28.726, w = 1262.055),
  illustration = list(x = 3657.613, y = 1089.041, w = 977.5),
  open_science = list(x = 1074.053, y = 1183.316, w = 459.129),
  research = list(x = 1325.287, y = 411.785, w = 1242.664),
  talks_workshops = list(x = 2716.678, y = 386.725, w = 941,811)
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

## Google scholar publication list ----
library(scholar)
library(dplyr)
library(readr)
library(stringr)

pubs <- get_publications("mxM_Py8AAAAJ&hl")

html_lines <- pubs %>%
  arrange(desc(year)) %>%
  mutate(authors_bolded = str_replace_all(author,
                                          regex("C Baldoni", ignore_case = TRUE),
                                          paste0("<strong>","C Baldoni", "</strong>")),
         line = paste0("<div class='pub-item'>",
                       authors_bolded, ".<br>",
                       "<em>", title, "</em><br>",
                       "<span class='journal'>", journal, "</span> (", year, ")",
                       "</div><br>")) %>%
  pull(line)

write_lines(html_lines, "data/publications.html")

