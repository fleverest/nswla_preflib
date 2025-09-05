#!/usr/bin/env Rscript

library(prefio)
library(readr)
library(dplyr)
library(glue)

preflib_series_number <- "00058"
preflib_abbreviation <- "nswla"

# Read manifest and determine input and output file locations
la <- read_csv("nsw_legislative_assembly_elections.csv") |>
  mutate(
    file_loc = glue("./raw_data/{year}/{district}.zip"),
    out_file = glue("./{preflib_series_number} - {preflib_abbreviation}/{preflib_series_number}-{sprintf('%08d', index)}.soi")
  ) |>
  select(file_loc, out_file, title, published)

# Check whether or not the preflib output directory exists:
outdir <- paste(preflib_series_number, "-", preflib_abbreviation)
if (!outdir %in% list.files()) {
  dir.create(outdir)
}

# Read elections and convert to preflib formats
apply(
  la,
  1L,
  \(row) {
    read_delim(row[1], delim = "\t") |>
      long_preferences(vote, id_cols = BPNumber, item_col = CandidateName, rank_col = PrefCounted) |>
      write_preflib(
        row[2],
        title = row[3],
        modification_date = format(Sys.time(), "%Y-%m-%d"),
        modification_type = "original",
        publication_date = row[4]
      )
  }
)
