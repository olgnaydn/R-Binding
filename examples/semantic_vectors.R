source("../R/Api.R")
library(jsonlite)
library("optparse")

option_list = list( make_option(c("-k", "--key"), action="store", default=NA, type='character',
              help="Rosette API key"), make_option(c("-u", "--url"), action="store", default=NA, type='character',
              help="Rosette API url"))
opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

semantic_vectors_data <- "Cambridge, Massachusetts"

parameters <- list()
parameters[[ "content" ]] <- semantic_vectors_data

if (is.na(opt$url)){
   result <- api(opt$key, "semantics/vector", parameters)
} else {
   result <- api(opt$key, "semantics/vector", parameters, NULL, NULL, opt$url)
}
print(jsonlite::toJSON(result$header, pretty = TRUE))
print(jsonlite::toJSON(result$content, pretty = TRUE))