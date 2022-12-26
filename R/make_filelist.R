fn <- dir("../data", pattern = ".rds")

tx <- unname(sapply(fn, function(x) strsplit(x, split = "_")[[1]][1]))

write.csv(data.frame(txid =tx, file = fn),
          file = "../filelist.csv", 
          row.names = FALSE, quote = FALSE)

          