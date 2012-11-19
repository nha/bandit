require(plyr)
require(ggplot2)
require(gridExtra)

setwd("~/Work/clj-bandit/tmp")

results <- read.csv(file="./results-n1500-t250.csv", header=F)
#results <- read.csv(file="./results.csv", header=F)

names(results) <- c("algo.name", "algo.variant", "simulation.number", "t", "chosen.arm", "reward", "cumulative.reward")
results$algo.variant <- as.factor(results$algo.variant)
results$algo.name <- as.factor(results$algo.name)

stats.average.reward <- ddply(results, c("algo.name", "algo.variant", "t"), function(df) {mean(df$reward)})
stats.average.reward.plot <- ggplot(stats.average.reward, aes(x = t, y = V1, color = algo.variant)) +
facet_wrap(~ algo.name) + geom_line() + xlab("Time (Iteration No.)") + ylab("Average Reward") + ggtitle("Average Reward") + ylim(c(0, 1))

stats.probability <- ddply(results, c("algo.name", "algo.variant", "t"), function(df) {mean(df$chosen.arm == ":arm5")})
stats.probability.plot <- ggplot(stats.probability, aes(x = t, y = V1, color = algo.variant)) +
facet_wrap(~ algo.name) + geom_line() + ylim(c(0, 1)) + xlab("Time (Iteration No.)") + ylab("Pr(Arm=5)") + ggtitle("Accuracy")

stats.cumulative.reward <- ddply(results, c("algo.name", "algo.variant", "t"), function(df) {mean(df$cumulative.reward)})
stats.cumulative.reward.plot <- ggplot(stats.cumulative.reward, aes(x = t, y = V1, color = algo.variant)) +
facet_wrap(~ algo.name) + geom_line() + xlab("Time (Iteration No.)") + ylab("Cumulative Reward") + ggtitle("Cumulative Reward Performance")

# view individually
stats.average.reward.plot
stats.probability.plot
stats.cumulative.reward.plot

# or as a grid
grid.arrange(stats.average.reward.plot, stats.probability.plot, stats.cumulative.reward.plot)
