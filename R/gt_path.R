"gt_path" <- function(temp=FALSE) {
  if(temp) {
    file.path(tempdir(), "GeyserTimes")
  } else {
    rappdirs::user_data_dir(appname = "GeyserTimes", appauthor = "GeyserTimes")
  }
}
