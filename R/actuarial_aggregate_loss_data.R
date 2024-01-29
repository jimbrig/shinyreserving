#' Aggregate Loss (Claims) Data
#'
#' @description
#' This function takes a [tibble::tibble()] `data.frame` with claim-specific
#' loss amounts and consolidates the data into an aggregates table by
#' `accident_year` and `devt` (maturity).
#'
#'
#' @param claims_data [tibble::tibble()] of claims data. Must contain fields for
#'   `reported`, `paid`, `accident_year`, and `devt`.
#'
#' @param limit (Optional) Per-claim *limit* to apply to individual claims
#'   before aggregation. Default is `N/A` or for unlimited.
#'
#' @return an aggregated [tibble::tibble()]
#'
#' @importFrom dplyr mutate group_by summarise n ungroup
#' @importFrom rlang .data .env
#'
#' @example examples/ex_aggregate_loss_data.R
#'
#' @export
aggregate_loss_data <- function(claims_data, limit = NA_integer_) {

  stopifnot(
    is.data.frame(claims_data),
    "reported" %in% names(claims_data),
    "paid" %in% names(claims_data),
    "accident_year" %in% names(claims_data),
    "devt" %in% names(claims_data)
  )

  dat <- claims_data

  if (!is.na(limit)) {
    dat <- dat |>
      dplyr::mutate(
        paid = pmin(.env$limit, .data$paid),
        reported = pmin(.env$limit, .data$reported),
        case = .data$reported - .data$paid
      )
  }

  dat |>
    dplyr::group_by(.data$accident_year, .data$devt) |>
    dplyr::summarise(
      paid = sum(.data$paid, na.rm = TRUE),
      reported = sum(.data$reported, na.rm = TRUE),
      n_claims = dplyr::n()
    ) |>
    dplyr::ungroup() |>
    dplyr::mutate(case = .data$reported - .data$paid)

}
