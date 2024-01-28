
#  ------------------------------------------------------------------------
#
# Title : R Package Development Library
#    By : Jimmy Briggs
#  Date : 2023-05-30
#
#  ------------------------------------------------------------------------

require(purrr)
require(pak)


# custom package functions ------------------------------------------------

instpkg <- function(pkg) {

  if (pkg %in% c("tic", "papillon", "pkgbump")) {
    pkgname <- switch(
      pkg,
      "tic" = "ropensci/tic",
      "papillon" = "Thinkr-open/papillon",
      "pkgbump" = "davidruvolo51/pkgbump@*release"
    )
  } else {
    pkgname <- pkg
  }

  if (!requireNamespace(pkg)) {
    message(paste0("   Installing package: ", pkg))
    pak::pak(pkgname, ask = FALSE)
  }
}

loadpkg <- function(pkg) {
  if (!requireNamespace(pkg)) {
    instpkg(pkg)
  } else {
    require(pkg)
  }
}

# development libraries ---------------------------------------------------

c(
  "usethis",
  "devtools",
  "pkgload",
  "pkgbuild",
  "testthat",
  "roxygen2",
  "Rd2roxygen",
  "knitr",
  "rmarkdown",
  "fs",
  "attachment",
  "desc",
  "purrr",
  "config",
  "covr",
  "spelling",
  "codemetar",
  "styler",
  "goodpractice",
  "urlchecker",
  "pkgdown",
  "tic", # ropensci/tic
  "lifecycle",
  "rprojroot",
  "rstudioapi",
  "withr",
  "attachment",
  "papillon", # Thinkr-open/papillon
  "pkgbump"
) |>
  purrr::walk(loadpkg)

rm(list = c("instpkg", "loadpkg"))
