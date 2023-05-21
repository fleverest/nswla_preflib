#!/usr/bin/env Rscript

# Don't run this script unless you know what you're doing.

get_la_data <- function(row) {
  path <- file.path("./raw_data", row["year"])
  dir.create(path)
  outfile <- file.path(path, paste0(row["district"], ".zip"))
  if (!file.exists(outfile)) {
    download.file(
      row["url"],
      destfile = outfile,
      headers = c(
        "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
        "Accept-Language" = "en-US,en;q=0.5",
        "Accept-Encoding" = "gzip, deflate, br",
        "Connection" = "keep-alive"
      )
    )
  }
}

la <- read.csv("nsw_legislative_assembly_elections.csv")

apply(la, 1L, get_la_data)
