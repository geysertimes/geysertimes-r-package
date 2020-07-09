"gt_load_geysers" <- function(path=gt_path(), quiet=FALSE, version=NULL) {
  if(is.null(version)) {
    version <- gt_version(path, quiet=TRUE)
  }
  if(is.null(version)) {
    if(!quiet) {
      message("Cannot find any geysertimes data under ", path)
    }
    # Look in Rtmp
    path <- file.path(tempdir(), "geysertimes")
    version <- gt_version(path, quiet=TRUE)
    if(is.null(version)) {
      return(NULL)
    } else {
      if(!quiet) {
        message("Loading data from ", path)
      }
    }
  }
  full_path <- file.path(path, version, "geysers_data.rds")
  readRDS(full_path)
}
