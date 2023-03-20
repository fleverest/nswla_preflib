# New South Wales Legislative Assembly Election Data

<!-- badges: start -->
[![CC BY 4.0][cc-by-shield]][cc-by]
<!-- badges: end -->

This repository contains the election data and scripts used to process it into
PrefLib format.

The directory `raw_data` contains files downloaded from the NSW Electoral
Commission website.

Other directories contained processed versions of these data, after conversion
into PrefLib format.


## Summary of scripts

The file `nsw_legislative_assembly_elections.csv` contains a table of election
summaries for contests involved in the NSW Legislative Assembly elections. For
each election there are a few details including the year, publication date,
a dataset "title", and a download URL.

The file `info_template.txt` is a template for the dataset documentation.

* `download.R`: **Do not run!** This is a download script included only for
completeness; all of the data are already contained in this repository.
This script downloads each dataset from the URLs found in the
`nsw_legislative_assembly_elections.csv` data file.

* `process.R`: This script converts the original data files into a [valid
PrefLib format](https://www.preflib.org/format). It makes use of the
[prefio](https://github.com/fleverest/prefio) R package.

* `generate_info.R`: This script adds a summary table to the bottom of
`info_template.txt`, and copies it into the output data directory. If you wish
to change `info.txt`, edit `info_template.txt` first and then re-run
`generate_info.R`.


## Data source

The raw data in this repository were sourced from the [New South Wales
Electoral Commission website](https://pastvtr.elections.nsw.gov.au).  They are
subject to copyright under the Copyright Act 1968 (Cth):  
© State of New South Wales through the NSW Electoral Commission

The data are licensed under the Creative Commons Attribution 4.0 License (see
below).  This licence enables a person to copy, distribute and adapt the
Material for any purpose on the condition that it is appropriately attributed
to the NSW Electoral Commission by including the copyright notice ‘© State of
New South Wales through the NSW Electoral Commission’ on all uses.


## Licence

The files in this repository are licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
