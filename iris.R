library(ggplot2)

# Load the iris dataset
data(iris)

ggplot(iris, aes(x = Species, y = Petal.Length)) +
  geom_boxplot(aes(color = Species))+
  geom_jitter(aes(color = Species), size = 1, alpha = 0.8) +
  labs(title = "Range and Data of Petal Length for Different Iris Species",
       x = "Species", y = "Petal Length (cm)") +
  theme_classic()
ggsave("Iris.png",last_plot(), width = 10, height = 7, dpi = 600)
