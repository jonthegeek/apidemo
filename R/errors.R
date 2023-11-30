#' @export
stop_forbidden <- function(file_id) {
  api_error(
    paste0("Cannot access file ", file_id),
    status = 403
  )
}

#' @export
api_error <- function(message, status) {
  err <- structure(
    list(message = message, status = status),
    class = c("error", "condition"),
    status_code = status
  )
  signalCondition(err)
}

#' @export
error_handler <- function(req, res, err) {
  res$status <- attr(err, "status_code") %||% 500L

  cat(as.character(err))

  # Skip serialization to always return JSON
  res$headers <- list("Content-type" = "application/json")
  res$body <- jsonlite::toJSON(unclass(as.character(err)))
  return(res)
}
