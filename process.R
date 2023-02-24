#!/usr/bin/env Rscript

library(prefio)

la <- read.csv("nsw_legislative_assembly_elections.csv")


# This function reads an LA election file to a data frame.
read_la <- function(filepath) {
  exdir <- tempdir()
  datafile <- unzip(filepath, exdir = exdir)
  df <- read.csv(datafile, sep = "\t")
  df_filtered <- df[!is.na(df$PrefCounted), ]
  return(preferences(df_filtered,
                     format = "long",
                     id = "BPNumber",
                     item = "CandidateName",
                     rank = "PrefCounted",
                     aggregate = TRUE))
}

# Just do the first one for illustration.
row <- la[1, ]
path <- file.path("./processed_data", row["year"])
dir.create(path)

prefs <- read_la("raw_data/2015/Albury.zip")


write.preflib(prefs,
              file.path("processed_data",
                        row["year"],
                        paste0("Albury.", attr(prefs$preferences, "preftype"))),
              title = paste0("NSW ",
                             row["year"],
                             " Legislative Assembly Election (",
                             row["district"],
                             " District)"),
              publication_date = if (row["year"] == "2015") "2015-03-28" else "2019-03-23",
              modification_type = "original",
              modification_date = format(Sys.time(), "%Y-%m-%d"))
