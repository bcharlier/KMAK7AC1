print_table <- function(data, digits = 3, caption = "") {
  data <- as.data.frame(data)

  if (digits >= 0) {
    numeric_columns <- vapply(data, is.numeric, logical(1))
    data[numeric_columns] <- lapply(
      data[numeric_columns],
      round,
      digits = digits
    )
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
