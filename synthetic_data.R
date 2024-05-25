# here in this script below, we will generate few synthetic dataset that simulates temperature and humidity

library("synthpop")
library("diffpriv")

## 1. Generate synthetic data
set.seed(123)
n <- 100

# create a synthetic data set
original_data <- data.frame(
  ID = 1:n,
  Temperature = rnorm(n, mean = 20, sd = 5),
  Humidity = rnorm(n, mean = 50, sd = 10)
)

# display first few rows of the original data
head(original_data)


## 2. Assess the quality of the generated data

# function to calculate data quality metrics
data_quality_matrix <- function(data) {
  list(
    mean_temperature = mean(data$Temperature),
    sd_temperature = sd(data$Temperature),
    mean_humidity = mean(data$Humidity),
    sd_humidity = sd(data$Humidity)
  )
}

# assess the quality of the original data
quality_metrics_original <- data_quality_matrix(original_data)
head(quality_metrics_original)








