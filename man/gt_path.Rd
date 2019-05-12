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
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
a character string giving the full path where local GeyserTimes data is stored.
}
\author{
Stephen Kaluzny <spkaluzny@gmail.com>
}
\note{
%%  ~~further notes~~
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# The default location for the GeyserTimes data:
gt_path()
}
\keyword{geysertimes}
