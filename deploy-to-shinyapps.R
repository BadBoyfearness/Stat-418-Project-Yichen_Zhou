
# Deploy to shinyapps.io
# First you will need an account

#install.packages('rsconnect')

# Name is account name, get both your authentication token and secret in your account
rsconnect::setAccountInfo(name='zhouyichen961104',
                          token='4F68020846BEB9E6B83923A439C43AD0',
                          secret='<SECRET>')
setwd("~/Stat-418-Project-Yichen_Zhou/docker/app")
library(rsconnect)
rsconnect::deployApp(appName = "418-project")

# This is now running at
# https://zhouyichen961104.shinyapps.io/418-project/


