#' Date Utility Functions
#'
#' @description
#' Date utility functions and helpers for manipulating and managing dates.
#'
#' @name utils-dates
NULL


#' End of Month
#'
#' @description
#' Retrieves the last day of the provided date's current month.
#'
#' @param date Input date (`POSIXct` or `character` string)
#'
#' @return Returns a `Date` object (i.e. `POSIXct`)
#'
#' @seealso [lubridate::ceiling_date()]
#'
#' @importFrom lubridate is.Date ceiling_date
#'
#' @export
#'
#' @example examples/ex_utils_dates_end_of_month.R
#'
#' @rdname utils-dates
end_of_month <- function(date) {
  if (is.character(date)) date <- as.Date(date)
  stopifnot(lubridate::is.Date(date))
  lubridate::ceiling_date(date, unit = "months") - 1
}


#' Start of Month
#'
#' @description
#' Retrieves the first day of the provided date's current month.
#'
#' @param date Input date (`POSIXct` or `character` string)
#'
#' @return Returns a `Date` object (i.e. `POSIXct`)
#'
#' @seealso [lubridate::floor_date()]
#'
#' @importFrom lubridate floor_date is.Date
#'
#' @export
#'
#' @example examples/ex_utils_dates_start_of_month.R
#'
#' @rdname utils-dates
start_of_month <- function(date) {
  if (is.character(date)) date <- as.Date(date)
  stopifnot(lubridate::is.Date(date))
  lubridate::floor_date(date, unit = "months")
}
