#'@export
#'

load_data <- function(){
  
  path <- rappdirs::user_data_dir("GeyseRdata.tsv","GeyseRdata")
  
  if(!file.exists(path)){
    wow <- tempfile()
    downloader::download(paste0("https://geysertimes.org/archive/complete/geysertimes_eruptions_complete_",Sys.Date(),".tsv.gz"),wow)
    R.utils::gunzip(wow,destname = path,remove = T,overwrite = T)
    
  }
}


