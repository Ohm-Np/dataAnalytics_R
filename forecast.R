# The script below covers generating  synthetic temperature data, plotting the data, fitting an ARIMA model, forecasting future temperatures, and evaluating the model's performance. 

library("ggplot2")
library("forecast")

# set seed for reproducibility
set.seed(123)

# generate synthetic data: 365 days of daily temperature
days <- 1:365
temperature <- 20 + 10 * sin(2 * pi * days / 365) + rnorm(365, mean = 0, sd = 3)


# create a data frame
data <- data.frame(Day = days, Temperature = temperature)

# plot the synthetic data
ggplot(data, aes(x = Day, y = Temperature)) +
  geom_line(color = "blue") +
  labs(title = "Synthetic Daily Temperatures", x = "Day", y = "Temperature")

# Convert data to time series object
temperature_ts <- ts(data$Temperature, frequency = 365)

# Fir ARIMA model
fit <- auto.arima(temperature_ts)

# summary of the model
summary(fit)

# forecast the next 30 days
forecasted <- forecast(fit, h = 30)

# Plot the forecast
autoplot(forecasted) +
  labs(title = "Temperature Forecast", x = "Day", y = "Temperature") +
  theme_minimal()

# Calculate residuals
residuals <- residuals(fit)

# Calculate MAE and RMSE
mae <- mean(abs(residuals))
rmse <- sqrt(mean(residuals^2))

cat("Mean Absolute Error (MAE):", mae, "\n")
cat("Root Mean Square Error (RMSE):", rmse, "\n")



