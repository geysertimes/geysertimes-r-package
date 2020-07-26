\name{gt_path}
\alias{gt_path}
\title{
Path to GeyserTimes Local Data
}
\description{
Returns the path where local GeyserTimes data is stored.
}
\usage{
gt_path(temp = FALSE)
}
\arguments{
  \item{temp}{
a logical value, if \code{TRUE}, the temporary path is returned.
This location will disappear when the R session ends.
}
}
\value{
a character string giving the full path where local GeyserTimes data is stored.
}
\author{
Stephen Kaluzny <spkaluzny@gmail.com>
}
\seealso{
\code{\link{gt_get_data}}
}
\examples{
# The default location for the GeyserTimes data:
gt_path()
}
\keyword{geysertimes}
