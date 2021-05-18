"gt_path" <- function(temp=FALSE) {
  if(temp) {
    file.path(tempdir(), "geysertimes")
  } else {
    # rappdirs::user_data_dir(appname="geysertimes", appauthor="geysertimes")
    tools::R_user_dir("geysertimes", "data")
  }
}
