
set.seed(1)

# Part 1

#1
# Initial goal was to run a loop for all of the rates
# val<- c(1, 0.2, 5, 7.3, 10)
# for (i in val) {
#   exp.draws.i<- rexp(200, i)
#   print(paste("Mean and SD for Lambda", i))
#   print(mean(exp.draws.i))
#   print(sd(exp.draws.i))
# }
#Problem with previous loop is that individual variables are not saved (only `exp.draws.i' is saved).

exp.draws.1<- rexp(200, 1)
mean(exp.draws.1)
sd(exp.draws.1)

#2
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

#3
hist(exp.draws.1)
plot(exp.draws.1)
plot(exp.draws.1, exp.draws.0.2)

#4
rates<- c(1, 0.2, 5, 7.3, 10)
means<- c(mean(exp.draws.1), mean(exp.draws.0.2), mean(exp.draws.5), mean(exp.draws.7.3), mean(exp.draws.10))
sds<- c(sd(exp.draws.1), sd(exp.draws.0.2), sd(exp.draws.5), sd(exp.draws.7.3), sd(exp.draws.10))

plot(rates, means)
plot(rates, sds)
plot(means, sds)
# The three plots are useful to show the main characteristics of the exponential distribution: 
# (i) Its expected value and variance only depend on the inverse of the rate parameter, lambda. Intuitively, this means that as the rate is higher, the event defined by the random variable will be more likely to happen sooner. This can be seen in the first two plots
# (ii) Mean and Standard Deviation are equal. This can be seen in the third plot, where the values for means and standard deviations are exactly the same for each of the values of the rate.

#Part 2

#5

#5.a
big.exp.draws.1<- rexp(1100000, 1)
mean(big.exp.draws.1)
sd(big.exp.draws.1)

#5.b
hist(big.exp.draws.1, prob=T)
curve(dexp(x, rate = 1), from=0, to=15, col = 2, lty = 1, lwd = 2, add=T)
# I plot the histogram and overlay the exponential distribution with rate 1. We see that both distributions closely match each other: as n grows larger we sould approximate the exact distribution of the function.

#5.c
greater.than.1<-big.exp.draws.1>1
matrix <- data.frame(big.exp.draws.1,greater.than.1)
mean(matrix$big.exp.draws.1[matrix$greater.than.1==T])

#5.d
big.exp.draws.1.mat <- matrix(big.exp.draws.1, nrow=1100, ncol=1000)
big.exp.draws.1.hist<-hist(big.exp.draws.1.mat)
# The histogram's properties are saved to an object named `big.exp.draws.1.hist`

#5.e
mean(big.exp.draws.1.mat[,371])

#5.f
big.exp.draws.1.colmeans<-colMeans(big.exp.draws.1.mat)
hist(big.exp.draws.1.colmeans)
# We can think of each column as a different draw of 1100 values of the random variable. This histogram shows the distribution of the means for each of these draws. The mean is centered around 1, as we would expect since we are working with an exponential distrivution with parameter 1.
