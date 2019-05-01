#'@export
#'
#Necessary packages: rappdirs, readr
load_data <- function(){
  
  
  if(Sys.getenv("GeyseRdataPath")==""){
    path <- ifelse(readline("Would you like to set a custom path to set the data? \n Y/N \n ") %in% c("y","Y"),
                   paste0(readline("Please enter a path \n "),"/GeyseRdata_",Sys.Date(),".tsv"),
                   rappdirs::user_data_dir(paste0("GeyseRdata_",Sys.Date(),".tsv"),"GeyseRdata"))
  }
  
  Sys.setenv("GeyseRdataPath" = path)
  time_dif <- format(difftime(regmatches(path,regexpr("\\d{4}-\\d{1,2}-\\d{1,2}",path)), as.character.Date(Sys.Date()),units = "days"))
  
  if(regmatches(time_dif,regexpr("\\d(?=\\s)",time_dif,perl = T)) != "0") {
    if(readline(paste0("Your current file is ",time_dif," old. Would you like a newer version? \n Y/N \n ")) %in% c("y","Y")){
      wow <- tempfile()
      downloader::download(paste0("https://geysertimes.org/archive/complete/geysertimes_eruptions_complete_",Sys.Date(),".tsv.gz"),wow)
      R.utils::gunzip(wow,destname = path,remove = T,overwrite = T)
      print(paste("File Saved to",path))
    }
  }
  return(readr::read_tsv(path))
}

