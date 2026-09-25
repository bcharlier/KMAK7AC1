print_table <- function(data, digits = 3, caption = "", scroll = 0) {
  data <- as.data.frame(data)

  if (digits >= 0) {
    numeric_columns <- vapply(data, is.numeric, logical(1))
    data[numeric_columns] <- lapply(
      data[numeric_columns],
      round,
      digits = digits
    )
  }

  align <- rep("c", ncol(data))
  
  tbl <- knitr::kable(
    data,
    format = "html",
    align = align,
    caption = caption,
    table.attr = 'class="table" style="width: auto; max-width: 100%; margin: 0 auto; table-layout: auto;"'
  )

  # Si scroll est un nombre positif, on applique la hauteur max en em
  if (is.numeric(scroll) && scroll > 0) {
    style <- sprintf("max-height: %sem; overflow-y: auto; overflow-x: auto; display: block;", scroll)
    tbl <- htmltools::HTML(sprintf('<div style="%s">%s</div>', style, tbl))
  }

  return(tbl)
}