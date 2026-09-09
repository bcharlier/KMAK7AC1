print_table <- function(data, digits = 3, caption = "") {
  if (digits >= 0) {
    data <- round(data, digits)
  }

  align <- c("l", rep("c", ncol(data)))
  knitr::kable(
    data,
    format = "html",
    align = align,
    caption = caption,
    table.attr = 'class="table"'
  )
}
