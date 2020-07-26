\name{gt_load_eruptions}
\alias{gt_load_eruptions}
\alias{gt_load_geysers}
\title{
Load the Geyser Times Data
}
\description{
Loads the Geyser Times data that was previously downloaded by a call
to \code{gt_get_data}.
}
\usage{
gt_load_eruptions(path = gt_path(), quiet = FALSE, version = NULL)
gt_load_geysers(path = gt_path(), quiet = FALSE, version = NULL)
}
\arguments{
  \item{path}{
a character string, the local location where the Geyser Times data
has been written.
The default is the local permanent location given by \code{gt_path()}.
If no appropriate data is found at that location,
the function will look in the temporary location given
\code{by gt_path(temp=TRUE)}.
}
  \item{quiet}{
a logical value, if \code{TRUE}, no messages are displayed.
}
  \item{version}{
a character string giving the version of the Geyser Times data to load.
Calling \code{gt_version(path, all=TRUE)} will list all versions
available under \code{path}.
}
}
\details{
Typically, a user would download the data once, with a call to
`gt_get_data(destdir=gt_path())`.
Subsequent R sessions can the load this downloaded data with a
call to `gt_load_eruptions()`.
}
\value{
a tibble containing the Geyser Times data with names:
(need to decide on appropriate names)
}
\author{
Stephen Kaluzny <spkaluzny@gmail.com>
}
\seealso{
\code{gt_get_data}
}
\examples{
tmppath <- gt_get_data()
erupt <- gt_load_eruptions()
}
\keyword{geysertimes}
