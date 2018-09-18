
set.seed(1)

# val<- c(1, 0.2, 5, 7.3, 10)
# for (i in val) {
#   exp.draws.i<- rexp(200, i)
#   print(paste("Mean and SD for Lambda", i))
#   print(mean(exp.draws.i))
#   print(sd(exp.draws.i))
# }
#Problem with previous loop is that individual variables are not saved (only `exp.draws.i' is saved)

exp.draws.1<- rexp(200, 1)
mean(exp.draws.1)
sd(exp.draws.1)

exp.draws.0.2<- rexp(200, 0.2)
mean(exp.draws.0.2)
sd(exp.draws.0.2)

exp.draws.5<- rexp(200, 5)
mean(exp.draws.5)
sd(exp.draws.5)

exp.draws.7.3<- rexp(200, 7.3)
mean(exp.draws.7.3)
sd(exp.draws.7.3)

exp.draws.10<- rexp(200, 10)
mean(exp.draws.10)
sd(exp.draws.10)

hist(exp.draws.1)
plot(exp.draws.1)
plot(exp.draws.1, exp.draws.0.2)

rates<- c(1, 0.2, 5, 7.3, 10)

means<- c(mean(exp.draws.1), mean(exp.draws.0.2), mean(exp.draws.5), mean(exp.draws.7.3), mean(exp.draws.10))
sds<- c(sd(exp.draws.1), sd(exp.draws.0.2), sd(exp.draws.5), sd(exp.draws.7.3), sd(exp.draws.10))

plot(rates, means)
plot(rates, sds)
plot(means, sds)

big.exp.draws.1<- rexp(1100000, 1)
mean(big.exp.draws.1)
sd(big.exp.draws.1)
hist(big.exp.draws.1)

greater.than.1<-big.exp.draws.1>1
matrix <- data.frame(big.exp.draws.1,greater.than.1)
mean(matrix$big.exp.draws.1[matrix$greater.than.1==T])
big.exp.draws.1.mat <- matrix(big.exp.draws.1, nrow=1100, ncol=1000)
big.exp.draws.1.hist<-hist(big.exp.draws.1.mat)
mean(big.exp.draws.1.mat[,371])
mean(big.exp.draws.1.mat[,1:1000])
big.exp.draws.1.colmeans<-colMeans(big.exp.draws.1.mat)
hist(big.exp.draws.1.colmeans)