# Be sure to run this line!
library(dplyr)
library(ggplot2)
library(bandfees)

# 1) view the bandfees data
bandfees %>%
  ___


# 2) sort bandfees by cost, with most expensive first


# 3) get only the artists whose lower cost is
#      greater than or equal to 250k
#      less than or equal to 500k


# 4) change the column lower, to be lower * 1000


# 5) - add a new column, diff, that is the difference between
#      upper and lower booking costs
#    - sort so that artist with the biggest difference is first


# =============================================================================
# Extra: plots below are to help you see the data. You don't need to know how
#        to use them for now. We'll cover plotting next!

# Scatterplot ----
ggplot(bandfees, aes()) +
  geom_point(aes(lower, upper, annotate = name), position = position_jitter(15, 15))

ggplotly()

# Histogram ----
ggplot(bandfees, aes()) +
  geom_histogram(aes(lower))

# Density ----
ggplot(bandfees, aes()) +
  geom_density(aes(lower))