\name{gt_cleanup_data}
\alias{gt_cleanup_data}
\title{
Cleanup Old GeyserTimes Data Files
}
\description{
Removes a particular version of the GeyserTimes data files
that have been download and stored on disk by \code{gt_get_data}.
Alternatively, the function will remove all old versions
of the GeyserTimes data files,
keeping only the most recent files.
}
\usage{
gt_cleanup_data(version = NULL, old = FALSE, path = gt_path())
}
\arguments{
  \item{version}{
a character value,
the specific version of the GeyserTimes data files to be removed.
The version number is the date that the files were downloaded,
with the format \code{yyyy-m-d} e.g. \code{"2021-05-15"}.
}
  \item{old}{
a logical value, if \code{TRUE},
all but the most recent version of the data files found under \code{path}
will be removed.
}
  \item{path}{
a character value, the location on disk where the GeyserTimes data files.
}
}
\details{
Users who regularly download the latest GeysersTimes data may
want to call \code{gt_cleanup_data(old=TRUE)} to
clean out old copies of the data.
}
\value{
a character vector, the versions of the data files that were removed.
If no files are removed, \code{NULL} is returned.
}
\author{
Stephen Kaluzny <spkaluzny@gmail.com>
}
\seealso{
\code{\link{gt_path}}, \code{\link{gt_get_data}}
}
\examples{
# see the example in the gt_get_data help file.
}
\keyword{geysertimes}
