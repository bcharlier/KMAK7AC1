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

  align <- rep("c", ncol(data))
  knitr::kable(
    data,
    format = "html",
    align = align,
    caption = caption,
    table.attr = 'class="table" style="width: auto; max-width: 100%; margin: 0 auto; table-layout: auto;"'
  )
}
