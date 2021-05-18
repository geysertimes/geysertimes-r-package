"gt_version" <- function(path=gt_path(), quiet=FALSE, all=FALSE) {
  gt_files <- list.files(path, pattern="eruptions_data\\.rds$", recursive=TRUE)
  versions <- as.Date(dirname(gt_files), format="%Y-%m-%d")
  # only directories of form yyyy-mm-dd are allowed:
  versions <- sort(versions[as.character(versions) == dirname(gt_files)],
    decreasing=TRUE)
  if(length(gt_files) < 1 || all(is.na(versions))) {
    if(!quiet) {
      message("Cannot find any geysertimes data under", path)
    }
    return(NULL)
  }
  version <- if(all) {
    versions[!is.na(versions)]
  } else {
    versions[1]
  }
  as.character(version)
}
