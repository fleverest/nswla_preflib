#!/usr/bin/env Rscript

# Try not to run this script. I have a feeling you are likely to get your IP blacklisted.

get_la_data <- function(row) {
  path <- file.path("./raw_data", row["year"])
  dir.create(path)
  download.file(
    row["url"],
    destfile = file.path(path, paste0(row["district"], ".zip")),
    headers = c(
      "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
      "Accept-Language" = "en-US,en;q=0.5",
      "Accept-Encoding" = "gzip, deflate, br",
      "Connection" = "keep-alive"
    )
  )
}

la <- read.csv("nsw_legislative_assembly_elections.csv")

apply(la, 1L, get_la_data)
