#!/usr/bin/env Rscript

out_dir <- "00058 - nswla"
preflib_series_number <- "00058"

# This file generates the required summaries of the dataset files for "info.txt"
data_files <- list.files("00058 - nswla")
data_files <- data_files[grep("info.txt", data_files, invert = TRUE)]

summaries <- data.frame(file_name = data_files)
summaries$modification_type <- "original"
summaries$relates_to <- ""

data_file_indices <- as.integer(
  do.call(
    rbind,
    strsplit(summaries$file_name, "[.-]")
  )[, 2]
)
la <- read.csv("nsw_legislative_assembly_elections.csv")
summaries$title <- la[, "title"]
summaries$description <- ""
summaries$publication_date <- la[, "published"]

# Copy the info template and append the csv data to the bottom
out_file <- file.path(out_dir, "info.txt")
file.copy(file.path("info_template.txt"), out_file)
write.table(summaries, out_file, append = TRUE, row.names = FALSE, quote = FALSE, sep = ", ")
