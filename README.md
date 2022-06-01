## geysertimes <img src='man/figures/logo.png' align="right" height="139" /></a>

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://cran.r-project.org/web/licenses/MIT)

This repository contains the official GeyserTimes R package. It is designed to facilitate easy access to the data hosted at [GeyserTimes](https://geysertimes.org) using the R language. It primarily targets researchers and supports the following functionality.

* [x] Download and use the [GeyserTimes Archive](https://geysertimes.org/archive/) as a tidyverse tibble.
* [ ] Preview locations of geysers on a map (work in progress, see Issue #7).

### Installation

You can install the latest released version from CRAN with:
```r
install.packages("geyertimes")
```

Or install the latest development version from GitHub with:
```r
# install.packages("devtools")
devtools::install_github("geysertimes/geysertimes-r-package")
```

### Quick Start

Here's a quick example to get you going. We'll be plotting a very simple histogram of the last 500 eruptions of Old Faithful. First, we need to download and retrieve the archive data, which will be installed locally at the location given by `gt_path()`.

```r
library(geysertimes)
gt_get_data(dest_folder = gt_path())  # Download the data
eruptions <- gt_load_eruptions()  # Load the tibble
```

At this point, we have the full archive of eruptions. We first filter it to only contain Old Faithful eruptions that are primary. Then, we sort it descending by eruption time and add the interval column as the time difference between two subsequent rows.

```r
# install.packages("dplyr")
library(dplyr)
oldfaithful <- eruptions %>%
  filter(geyser == "Old Faithful", eruption_id == primary_id) %>%
  arrange(desc(time)) %>%
  mutate(interval = lag(time) - time)
```

Finally, we'll take the last 500 intervals and plot this with R's base histogram functionality. Note that you can likely achieve better-looking charts, this is for demonstration only.
```r
last500 <- slice(oldfaithful, 2:501)
hist(as.numeric(last500$interval), breaks = 250,
  main = "Old Faithful Intervals", xlab = "Interval [seconds]",
  xlim = c(3400, 7200))
```
