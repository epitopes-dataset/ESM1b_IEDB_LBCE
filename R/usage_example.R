# devtools::install_github("fcampelo/epitopes@devel-next")

library(epitopes)

epitopes::get_basic_data("../tmp", datasets = "taxonomy")

# Add the desired taxonomy IDs (any taxonomic level should work)
my_txids <- c("10242", "2697049")

# Returns a list vector, one dataset list for each id in my_txids
X <- get_precomputed_datasets(my_txids,
                              tax_list = readRDS("../basic_datasets/taxonomy.rds"),
                              min_peptide = 5, max_epitope = 25)
