# EPI 550 Final Project
install.packages("usethis")
usethis::use_git_config(user.name = "ridabee" , use.email="rida.akbar@emory.edu")
usethis::create_github_token()
gitcreds::gitcreds_set()
												install.packages("renv")
												renv::init()
												install.packages("here")
load(file = 'covid_testing.rda')

#Decriptive stats
View(covid_testing)
library(gtsummary)
tbl_summary(
	covid_testing,
	by = gender,
	include = c( age, result, clinic_name, test_id, pan_day, demo_group, patient_class))

#Regression
logistic_model <- glm(orderset ~ gender +test_id, data=covid_testing, family = binomial())
tbl_regression(
	logistic_model,
	intercept = TRUE,
	label = list(
		test_id ~ "Subject ID for testing",
		orderset ~ "Sequence",
		gender ~ "sex assigned at birth"
	))
#usingbroom
library(broom)
glance(logistic_model, conf.int = TRUE, exponentiate = TRUE)

#Figure
box <- boxplot(covid_testing$age ~ covid_testing$gender,
							 xlab = "gender
							 ylab = age",
							 main= "Subjects age by gender")
install.packages("ggplot2")
library(ggplot2)
ggsave(here::here("Plots", "box.jpg"))

#Function
#Percentage of demographic group from gender

result <- function (x,y, multiplier = 100){
	new_value = multiplier*sum(x)/sum(y)
	return(new_value)
}
result(covid_testing$result = "result", covid_testing$gender="sex")
