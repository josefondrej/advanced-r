# Title     : Read and display data
# Created by: Josef Ondrej (www.josefondrej.com)
# Created on: 21.01.21

library(scales)
library(graphics)

data = read.csv("./data/Iris.csv")
print(head(data))

# Setting Margins
graphics::par(mar = c(5, 5, 5, 5))

# Scatterplot
graphics::plot(data[["SepalLengthCm"]], data[["SepalWidthCm"]],
               col = scales::alpha("deepskyblue", 0.7), type = "p",
               pch = 19, cex = 2.2,
               xlab = "Sepal Length [cm]", ylab = "Sepal Width [cm]",
               xaxt = "n", yaxt = "n")

graphics::axis(1, at = seq(1, 10, 0.5), cex.axis = 1.0, font = 1, tck = .01)
graphics::axis(2, at = seq(1, 5, 0.5), cex.axis = 1.0, font = 1, tck = .01)

# Histogram
graphics::hist(data[["SepalLengthCm"]], freq = FALSE,
               xlab = "Sepal Length [cm]", ylab = "Density",
               col = alpha("salmon", 0.7), border = FALSE,
               breaks = 15, xaxt = "n", yaxt = "n", main = "", bty = "o")
graphics::axis(1, at = seq(1, 10, 0.5), cex.axis = 1.0, font = 1, tck = .01)
graphics::axis(2, at = seq(-1, 2, 0.05), cex.axis = 1.0, font = 1, tck = .01)

# Barplot
graphics::barplot(data[["SepalLengthCm"]][1:20],
                  border = FALSE, col = alpha("limegreen", 0.7),
                  names = 1:20, yaxt = "n",
                  xlab = "ID", ylab = "Height")

graphics::axis(2, at = seq(0, 5, 0.5), cex.axis = 1.0, font = 1, tck = .01)

# Group-By
split_data = base::split(data, data[["Species"]])

mean_sepal_length = function(df) {
  return(mean(df[["SepalLengthCm"]]))
}

purrr::map(split_data, mean_sepal_length)

# Join
base::merge(x, y, by, by.x, by.y, sort = TRUE)