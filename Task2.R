library(ggplot2)
library(cluster)
df <- iris
head(iris)

ggplot(df, aes(Petal.Length,Petal.Width)) + geom_point(aes(col=Species),size=2)

set.seed(101)
irisCluster <- kmeans (df[,1:4], centers = 3, nstart = 20)
irisCluster

table(irisCluster$cluster, df$Species)

clusplot(iris, irisCluster$cluster, color = T,shade = T,labels = 0,lines = 0)

ggsave("irisCluster.png",last_plot(), width = 10, height = 7, dpi = 600)

tot.withinss <- sapply(1:10, function(i) {
  irisCluster <- kmeans(df[,1:4], center=i, nstart=20)
  return(irisCluster$tot.withinss)
})


plot(1:10, tot.withinss, type = "b",pch = 19, xlab = "Number of Clusters", ylab = "Total Within-Cluster Sum of Squares")

ggsave("irisNoOfClusters.png",last_plot(), width = 10, height = 7, dpi = 600)

