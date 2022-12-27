# devtools::install_github("fcampelo/epitopes@devel-next")

library(epitopes)

epitopes::get_basic_data("../tmp", datasets = c("taxonomy", "proteins", 
                                                "protein_dissimilarity"))

# Add the desired taxonomy IDs (any taxonomic level should work)
my_txids <- "10242"

# Retrieve dataset (if multiple ids are provided, returns a list object of the 
# same length as my_txids)
X <- get_precomputed_datasets(my_txids,
                              tax_list = readRDS("../tmp/taxonomy.rds"),
                              min_peptide = 5, max_epitope = 25)

# Make data splits for, e.g., training and testing.

X <- make_data_splits(X, 
                      proteins = readRDS("../tmp/proteins.rds"), 
                      target_props = rep(1/3, 3), 
                      similarity_threshold = .7, 
                      diss_matrix = readRDS("../tmp/protein_dissimilarity.rds"))
