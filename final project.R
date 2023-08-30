# EPI 550 Final Project

install.packages("dplyr")
library(dplyr)

load("/Users/ridabee/Desktop/EPI 590R Final Project/covid_testing.rda")

library(gtsummary)

tbl <- tbl_summary(covid_testing)

covid_testing_df <- as.data.frame(covid_testing)

write.table(covid_testing_df, file = "covid_testing_data.txt", sep = "\t", row.names = FALSE)

write.table(covid_testing_df, file = "/Users/ridabee/Desktop/EPI 590R Final Project/covid_testing_data.txt", sep = "\t", row.names = FALSE)


