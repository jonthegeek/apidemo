api <- plumber::pr("plumber.R") |>
  plumber::pr_set_error(error_handler)
