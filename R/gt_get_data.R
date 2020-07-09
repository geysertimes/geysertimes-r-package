gt_get_data <- function(dest_folder = file.path(tempdir(), "geysertimes"),
  overwrite=FALSE, quiet=FALSE, version=lubridate::today()) {
  if(dest_folder != gt_path()) {
    if(!quiet) {
      message("Set dest_folder to geysertimes::gt_path() so that data persists between R sessions.\n")
    }
  }
  outpathdir <- file.path(dest_folder, version)
  outpath_eruptions <- file.path(dest_folder, version, "eruptions_data.rds")
  outpath_geysers <- file.path(dest_folder, version, "geysers_data.rds")
  if(file.exists(outpath_eruptions) && !overwrite) {
    warning("geysertimes eruptions data for this version already exists on the local machine. Use the 'overwrite' argument to re-download if neccessary.")
    return(invisible(outpathdir))
  }
  if(file.exists(outpath_geysers) && !overwrite) {
    warning("geysertimes geysers data for this version already exists on the local machine. Use the 'overwrite' argument to re-download if neccessary.")
    return(invisible(outpathdir))
  }
  if(!dir.exists(outpathdir)) {
    dir.create(outpathdir, recursive=TRUE)
  }

  # eruption data:
  eruptions <- get_eruptions(version)
  saveRDS(eruptions, file=outpath_eruptions)

  # geysers data:
  geysers <- get_geysers(version)
  saveRDS(geysers, file=outpath_geysers)
  invisible(outpathdir)
}

get_eruptions <- function(version) {
  # eruptions data:
  base_url <- "https://geysertimes.org/archive/complete/"
  raw_data_file <- paste0("geysertimes_eruptions_complete_", version, ".tsv.gz")
  download_data_file_path <- file.path(tempdir(), raw_data_file)
  data_url <- paste0(base_url, raw_data_file)
  oldOpt <- options(warn=-1)
  on.exit(options(oldOpt))
  trydownload <- try(
    download.file(data_url, destfile=download_data_file_path, quiet=TRUE), 
      silent=TRUE)
  eruptions <- readr::read_tsv(gzfile(download_data_file_path),
    col_types=c("dcddddddddddddcccccccdddc"), quote="", progress=FALSE)
  # rename columns:
  indx_name <- match(names(eruptions), names(gt_new_names))
  stopifnot(!any(is.na(indx_name)))
  names(eruptions) <- gt_new_names[indx_name]
  # convert to datetime:
  eruptions[["time"]] <-
    lubridate::as_datetime(eruptions[["time"]])
  eruptions[["time_updated"]] <- lubridate::as_datetime(eruptions[["time_updated"]])
  eruptions[["time_entered"]] <- lubridate::as_datetime(eruptions[["time_entered"]])
  # convert NULL to NA:
  eruptions[["duration_seconds"]] <- replace(eruptions[["duration_seconds"]],
    which(eruptions[["duration_seconds"]] == 0), NA)
  eruptions[["duration_resolution"]] <- replace(eruptions[["duration_resolution"]],
    which(eruptions[["duration_resolution"]] == 0), NA)
  eruptions[["duration_modifier"]] <- replace(eruptions[["duration_modifier"]],
    which(eruptions[["duration_modifier"]] == 0), NA)
  # convert duration_seconds from character to numeric:
  eruptions[["duration_seconds"]] <- as.numeric(eruptions[["duration_seconds"]])
  eruptions
}

get_geysers <- function(version) {
  geysers_df <- jsonlite::fromJSON(
    "https://www.geysertimes.org/api/v5/geysers")$geysers
  geysers_df[["longitude"]] <- as.numeric(geysers_df[["longitude"]])
  geysers_df[["latitude"]] <- as.numeric(geysers_df[["latitude"]])
  geysers_df[["longitude"]] <- replace(geysers_df[["longitude"]],
    which(geysers_df[["longitude"]] == 0), NA)
  geysers_df[["latitude"]] <- replace(geysers_df[["latitude"]],
    which(geysers_df[["latitude"]] == 0), NA)
  geysers_df
}
