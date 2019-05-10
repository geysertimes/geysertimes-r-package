\name{gt_version}
\alias{gt_version}
\title{Version of GeyserTimes Data}
\description{
Returns the version of the current GeyserTimes data.
This is a character string date in year-mm-dy format.
}
\usage{
gt_version(path = gt_path(), quiet = FALSE, all = FALSE)
}
\arguments{
  \item{path}{
the path to the GeyserTimes data.
The default is the suggested location used by `gt_get_data`.
}
  \item{quiet}{
a logical value, if \code{TRUE}, no messages are printed.
}
  \item{all}{
list all versions of the GeyserTimes data found,
not just the newest.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
a character string listing the version(s) of GeyserTimes data
stored under `path`.
}
\author{
Stephen Kaluzny <spkaluzny@gmail.com>
}
\note{
}
\seealso{
\code{gt_path}
}
\examples{
gt_version()
}
\keyword{geysertimes}
