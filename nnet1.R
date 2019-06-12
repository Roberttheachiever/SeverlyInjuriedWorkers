library(nnet)
set.seed(1)
test_index <- createDataPartition(y = Amputation_Injuries$n, times = 1, p = 0.1, list = FALSE)
edx <- movielens[-test_index,]
temp <- movielens[test_index,]