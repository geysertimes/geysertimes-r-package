\name{gt_get_data}
\alias{gt_get_data}
\title{
Download GeyserTimes Data
}
\description{
Downloads the data from geysertimes.org.
Reads the data and creates a tibble object in `dest_dir`.
}
\usage{
gt_get_data(dest_dir = file.path(tempdir(), "geysertimes"),
  overwrite = FALSE, quiet = FALSE, version = lubridate::today())
}
\arguments{
  \item{dest_dir}{
the location where the binary tibble object should be written.
The default is under the current R session's temp directory
which will disappear when the session ends.
}
  \item{overwrite}{
a logical value,
if\code{FALSE}, the data will not be downloaded again if copy of the data,
with \code{version}, already exists in \code{dest_dir}.
}
  \item{quiet}{
a logical value, if \code{TRUE}, no messages are displayed.
}
  \item{version}{
a character string giving the version of the data to download.
This should a date in the form \code{yyyy-mm-dd}.
Typically, only the version with today's date is available.
}
}
\details{
The data is downloaded from the GeyserTimes archive web site
\url{https://geysertimes.org/archive/} to the \code{tempdir()} directory.
The data is then read with \code{readr::read_tsv} wtih appropriate
column types.
The resulting \code{tibble} object is then saved as an binary (\code{.rds})
in \code{dest_dir}.
}
\value{
a character string giving the full path to the directory where
the GeyserTimes data was stored.
}
\author{
Stephen Kaluzny <spkaluzny@gmail.com>.
}
\note{
Users are encouraged to set \code{dest_dir} to \code{gt_path()} to save
a persistent copy of the data.
}
\seealso{
gt_load_eruptions, gt_load_geysers.
}
\examples{
dpath0 <- gt_get_data()  # data saved under tempdir()
dpath1 <- gt_get_data(dest_dir=gt_path())  # data saved under gt_path()
}
\keyword{geysertimes}
