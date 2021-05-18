gt_cleanup_data <- function(version=NULL, old=FALSE, path=gt_path()) {
  if(is.null(version)) {
    if(!old) {
      stop("Need to provide version or set old=TRUE")
    } else {
      version_all <- gt_version(path=path, all=TRUE)
      version_old <- sort(version_all, decreasing=TRUE)[-1]
      if(length(version_old) > 0) {
        unlink(file.path(path, version_old), recursive=TRUE)
        ret_val <- version_old
      } else {
        warning("No old data versions to remove under ", path)
        ret_val <- NULL
      }
    }
  } else {
    if(old) {
      stop("Cannot set old=TRUE and specify version")
    }
    version_all <- gt_version(path=path, all=TRUE)
    if(as.character(version) %in% version_all) {
      unlink(file.path(path, version), recursive=TRUE)
      ret_val <- version
    } else {
      stop("Cannot find version ", version, " under ", path)
    }
  }
  ret_val
}
