
#  ------------------------------------------------------------------------
#
# Title : ShinyReserving R Package Development Script
#    By : Jimmy Briggs
#  Date : 2023-03-12
#
#  ------------------------------------------------------------------------


# Setup -------------------------------------------------------------------

curr_path <- fs::path_dir(rstudioapi::getActiveDocumentContext()$path)
source(fs::path(curr_path, "devtlib.R"))
rm(curr_path)


# Initialize --------------------------------------------------------------

# usethis::create_package("shinyreserving")

usethis::use_namespace()
usethis::use_description()
usethis::use_roxygen_md()
usethis::use_package_doc()

# set deescription before github
desc::desc_set(
  Title = "Shiny Reserving Application",
  Description = "Actuarial Property Casualty Reserving Shiny Application."
)

# Git & GitHub ------------------------------------------------------------

usethis::use_git()
usethis::git_sitrep()

usethis::use_github()
usethis::use_github_links()
usethis::use_github_labels()


# Initial Dependencies ----------------------------------------------------

c(
  "shiny",
  "shinydashboard",
  "shinydashboardPlus",
  "shinyWidgets",
  "htmltools",
  "rlang",
  "dplyr",
  "purrr",
  "jsonlite",
  "shinyjs"
) |>
  lapply(usethis::use_package)


# Ignores -----------------------------------------------------------------

git_ignores <- c(
  ".Rhistory",
  ".RData",
  ".Rproj.user",
  ".DS_STORE",
  "desktop.ini",
  "node_modules",
  "yarn-error.log",
  "~",
  "~$"
)

build_ignores <- c(
  git_ignores,
  ".github",
  "config",
  "dev",
  "src",
  ".babelrc",
  ".gitignore",
  ".gitattributes",
  ".editorconfig",
  "CHANGELOG.md",
  "pkgbump.config.json",
  "shinyreserving.code-workspace",
  "package.json",
  "postcss.config.js",
  "webpack.config.js",
  "yarn.lock",
  "*.docx",
  "*.zip"
)

usethis::use_git_ignore(ignores = git_ignores)
usethis::use_build_ignore(
  files = build_ignores
)

rm(list = c("git_ignores", "build_ignores"))


# pkgbump -----------------------------------------------------------------

pkgbump::set_pkgbump(
  files = c(
    "DESCRIPTION",
    "R/shinyreserving-package.R",
    "package.json"
  )
)

pkgbump::pkgbump(version = "0.0.1")



devtools::document()
