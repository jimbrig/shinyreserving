
#  ------------------------------------------------------------------------
#
# Title : R Package Development - Functions
#    By : Jimmy Briggs
#  Date : 2023-05-30
#
#  ------------------------------------------------------------------------

require(usethis)
require(purrr)

# Package -----------------------------------------------------------------

usethis::use_package_doc(open = FALSE)


# app functions -----------------------------------------------------------

c(
  "app_run",
  "app_config",
  "app_server",
  "app_server_utils",
  "app_ui",
  "app_ui_utils",
  "app_ui_header",
  "app_ui_sidebar",
  "app_ui_body",
  "app_ui_controlbar",
  "app_ui_footer"
) |>
  purrr::walk(
    usethis::use_r,
    open = FALSE
  )


# modules -----------------------------------------------------------------

c(
  "mod_triangles",
  "mod_header_buttons"
) |>
  purrr::walk(
    usethis::use_r,
    open = FALSE
  )


# functionality -----------------------------------------------------------

c(
  "actuarial_aggregate_loss_data",
  "actuarial_simulation",
  "actuarial_triangles",
  "actuarial_loss_development"
) |>
  purrr::walk(
    usethis::use_r,
    open = FALSE
  )


# utils -------------------------------------------------------------------

c(
  "utils_messages",
  "utils_dates",
  "utils_triangles",
  "utils_dataprep"
) |>
  purrr::walk(
    usethis::use_r,
    open = FALSE
  )


# datasets ----------------------------------------------------------------

c(
  "data_lossruns",
  "data_triangle_data",
  "data_datadict"
) |>
  purrr::walk(
    usethis::use_r,
    open = FALSE
  )

