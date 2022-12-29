# install.packages("devtools")
# devtools::install_github("fcampelo/epitopes@devel-next", dependencies = TRUE)
# epitopes::install_bioc_dependencies()

library(epitopes)

epitopes::get_basic_data("../tmp", datasets = c("taxonomy", "proteins", 
                                                "protein_dissimilarity"))

# Add the desired taxonomy IDs (any taxonomic level should work)
my_txid    <- "2732005" # Bamfordvirae
split_txid <- "10242"   # Orthopox - this is an ID that we want to make sure 
# that is split across as many splits as possible.
# (note: optional. Set to NULL if not needed)

# Retrieve dataset (if my_txids is a vector, returns a list object of the 
# same length as my_txids with one dataset per position).
X <- epitopes::get_precomputed_datasets(my_txid,
                                        tax_list = readRDS("../tmp/taxonomy.rds"),
                                        min_peptide = 5, max_epitope = 25)

# Make data splits for, e.g., training and testing.
# (If X is a list of multiple datasets, then it needs to be run separately 
# for each dataset).
X <- epitopes::make_data_splits(X, 
                                proteins = readRDS("../tmp/proteins.rds"), 
                                target_props = rep(1/3, 3), 
                                similarity_threshold = .6, 
                                id_force_splitting = split_txid, # (optional)
                                tax_list = readRDS("../tmp/taxonomy.rds"),
                                diss_matrix = readRDS("../tmp/protein_dissimilarity.rds"))
