
set.seed(1)

val<- c(1, 0.2, 5, 7.3, 10)

for (i in val) {
  exp.draws.i<- rexp(200, i)
  print(paste("Mean and SD for Lambda", i))
  print(mean(exp.draws.i))
  print(sd(exp.draws.i))
}

