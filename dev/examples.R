
#  ------------------------------------------------------------------------
#
# Title : R Package Development - Function Examples
#    By : Jimmy Briggs
#  Date : 2023-05-30
#
#  ------------------------------------------------------------------------

require(usethis)
require(purrr)
require(fs)

# Create Examples Directory -----------------------------------------------
fs::dir_create("examples")
usethis::use_build_ignore(c("examples"))

# examples by function ----------------------------------------------------

c(
  "aggregate_loss_data",
  "utils_dates_end_of_month",
  "utils_dates_start_of_month"
) |>
  purrr::walk(
    function(fn) {
      fs::file_create(
        paste0(
          "examples/ex_",
          fn,
          ".R"
        )
      )
    }
  )
