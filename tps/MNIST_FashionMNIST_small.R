options(timeout=600)
if(!file.exists("MNIST_FashionMNIST.csv"))download.file("https://rcdata.nau.edu/genomic-ml/cv-same-other-paper/data_Classif/MNIST_FashionMNIST.csv","MNIST_FashionMNIST.csv")
library(data.table)
mfash <- fread("MNIST_FashionMNIST.csv")
names(mfash)[1:9]
mfash[, .(data.name, y, `0`, `1`)]
mfash[, table(y, data.name)]
set.seed(1)
smallfash <- mfash[, .SD[sample(700)], by=.(data.name, y)]
smallfash[, .(data.name, y, `0`, `1`)]
smallfash[, table(y, data.name)]
fwrite(smallfash, "MNIST_FashionMNIST_small.csv")
system("du -ms MNIST_FashionMNIST.csv MNIST_FashionMNIST_small.csv")
