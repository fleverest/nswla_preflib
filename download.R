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

# 2015 candidates
outfile <- "./raw_data/2015/candidates.xlsx"
url <- "https://pastvtr.elections.nsw.gov.au/SGE2015/data/la/state/SGE%202015%20LA%20Final%20Votes.xlsx"
download.file(
  url,
  destfile = outfile,
  headers = c(
    "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    "Accept-Language" = "en-US,en;q=0.5",
    "Accept-Encoding" = "gzip, deflate, br",
    "Connection" = "keep-alive"
  )
)

# 2019 candidates
outfile <- "./raw_data/2019/candidates.xlsx"
url <- "https://pastvtr.elections.nsw.gov.au/SG1901/LA/state/SGE%202019%20LA%20Final%20Votes.xlsx"
download.file(
  url,
  destfile = outfile,
  headers = c(
    "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    "Accept-Language" = "en-US,en;q=0.5",
    "Accept-Encoding" = "gzip, deflate, br",
    "Connection" = "keep-alive"
  )
)

# 2023 candidates
outfile <- "./raw_data/2023/candidates.xlsx"
url <- "https://pastvtr.elections.nsw.gov.au/SG2301/LA/state/SGE%202023%20LA%20Final%20Votes.xlsx"
download.file(
  url,
  destfile = outfile,
  headers = c(
    "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    "Accept-Language" = "en-US,en;q=0.5",
    "Accept-Encoding" = "gzip, deflate, br",
    "Connection" = "keep-alive"
  )
)
