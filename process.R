#!/usr/bin/env Rscript

library(prefio)

preflib_series_number <- "00058"
preflib_abbreviation <- "nswla"
la <- read.csv("nsw_legislative_assembly_elections.csv")

# Check whether or not the preflib output directory exists:
outdir <- paste(preflib_series_number, "-", preflib_abbreviation)
if (!outdir %in% list.files()) {
  dir.create(outdir)
}

# This function reads an LA election file to a preferences object
read_la <- function(rowdata) {
  cat("Reading ",
      rowdata["district"],
      " ",
      rowdata["year"],
      ".\n", sep = "")
  zipfile <- file.path("raw_data",
                       rowdata["year"],
                       paste0(rowdata["district"], ".zip"))
  exdir <- tempdir()
  datafile <- unzip(zipfile, exdir = exdir)
  df <- read.csv(datafile, sep = "\t")
  df_filtered <- df[!is.na(df$PrefCounted), ]
  return(preferences(df_filtered,
                     format = "long",
                     id = "BPNumber",
                     item = "CandidateName",
                     rank = "PrefCounted",
                     aggregate = TRUE))
}

# This function will write each election to the required preflib dataset formats
write_preflib <- function(row) {
  prefs <- read_la(row)
  cat("Writing ",
      row["district"],
      " ",
      row["year"],
      ".\n")
  write.preflib(prefs,
                file.path(outdir,
                          paste0(preflib_series_number,
                                 "-",
                                 sprintf("%08d", as.integer(row["index"])),
                                 ".",
                                 attr(prefs$preferences, "preftype"))),
                title = row["title"],
                modification_date = format(Sys.time(), "%Y-%m-%d"),
                modification_type = "original",
                publication_date = row["published"])
}

apply(la,
      1L,
      write_preflib)
