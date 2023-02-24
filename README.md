# New South Wales Legislative Assembly Election Data

This repository contains the election data and scripts used to process it into PrefLib format.

## Data Origin

All of the data in this repository was sourced from the [New South Wales Electoral Commission website](https:/pastvtr.elections.nsw.gov.au) and is subject to copyright under the Copyright Act 1968 (Cth). The data in this repository is licensed under the Creative Commons Attribution 4.0 License (CCA License).

This CCA License enables a person to copy, distribute and adapt the Material for any purpose on the condition that it is appropriately attributed to the NSW Electoral Commission by including the copyright notice ‘© State of New South Wales through the NSW Electoral Commission’ on all uses.

You are also required under the CCA License to provide a link to the license and indicate if changes were made. You must not in any way suggest the NSW Electoral Commission endorses you or your use. The CCA License does not give you all of the permissions necessary, for example, other rights such as privacy or moral rights may limit how you use the Material. We recommend you familiarise yourself with the terms of the CCA License before any decision is made to utilise the Material on this website.

You must obtain written permission from the NSW Electoral Commission if you wish to use, copy, distribute, adapt or otherwise deal with Material not licensed under the CCA License.


## Summary of scripts

First of all, the data file `nsw_legislative_assembly_elections.csv` contains a list of election summaries for contests involved in the NSW Legislative Assembly elections. For each election there are a few details including the year, publication date, a dataset "title", and a download url.

I have also written a template for the dataset documentation in `info_template.txt`.

* `download.R`: *do not run this*! All of the data is already contained in this repository, and I have only included this script for completeness. It is a simple script which downloads each dataset from the urls found in the `nsw_legislative_assembly_elections.csv` data file.
* `process.R`: This script converts the original data files into a [valid PrefLib format](https://www.preflib.org/format). It makes use of my R package [prefio](https://github.com/fleverest/prefio).
* `generate_info.R`: This script simply adds a summary table to the bottom of `info_template.txt`, and copies it into the output data directory. If you wish to change `info.txt`, edit `info_template.txt` first and then re-run `generate_info.R`.
