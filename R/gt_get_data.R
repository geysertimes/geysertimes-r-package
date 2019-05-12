gt_get_data <- function(dest_folder = file.path(tempdir(), "GeyserTimes"),
  overwrite=FALSE, quiet=FALSE, version=lubridate::today()) {
  if(dest_folder != gt_path()) {
    if(!quiet) {
      message("Set dest_folder to GeyserTimes::gt_path() so that data persists between R sessions.\n")
    }
  }
  outpath <- file.path(dest_folder, version, "eruptions_data.rds")
  if(file.exists(outpath) && !overwrite) {
    warning("GeyserTimes data for this version already exists on the local machine. Use the 'overwrite' argument to re-download if neccessary.")
    return(invisible(outpath))
  }
  outdir <- dirname(outpath)
  if(!dir.exists(outdir)) {
    dir.create(outdir, recursive=TRUE)
  }
  base_url <- "https://geysertimes.org/archive/complete/"
  raw_data_file <- paste0("geysertimes_eruptions_complete_", version, ".tsv.gz")
  download_data_file_path <- file.path(tempdir(), raw_data_file)
  data_url <- paste0(base_url, raw_data_file)
  oldOpt <- options(warn=-1)
  on.exit(options(oldOpt))
  trydownload <- try(
    download.file(data_url, destfile=download_data_file_path, quiet=TRUE), 
      silent=TRUE)
  gt_tib <- readr::read_tsv(gzfile(download_data_file_path),
    col_types=c("dcddddddddddddccccdddc"), quote="", progress=FALSE)
  gt_tib[["eruption_time_epoch"]] <- lubridate::as_datetime(gt_tib[["eruption_time_epoch"]])
  gt_tib[["time_updated"]] <- lubridate::as_datetime(gt_tib[["time_updated"]])
  gt_tib[["time_entered"]] <- lubridate::as_datetime(gt_tib[["time_entered"]])
  saveRDS(gt_tib, file=outpath)
  invisible(outpath)
}
