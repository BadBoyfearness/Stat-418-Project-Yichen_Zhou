library(shiny)
library(ggplot2)
library(Hmisc)
library(car)
library(xgboost)

data <- read.csv("films.csv",na.strings = "null")
data <- data[,c(4:7,9,10)]
data$Popularity_rank <- as.numeric(data$Popularity_rank)
data$IMDbscore <- as.numeric(data$IMDbscore)
data$Metascore <- as.numeric(data$Metascore)
data$Votes <- as.numeric(data$Votes)
for (i in 1:length(data[,'Genre'])) {
  a <- as.vector.factor(data[i,'Genre'])
  b <- unlist(strsplit(a,split=","))
  data[i,'Genre'] <- b[1]
}
data$Genre[data$Genre=='Thriller'] = "Horror"
data$Genre[data$Genre=='Sport'|data$Genre=='Crime'|data$Genre=='Western'] = "Action"
data$Genre[data$Genre=="Family"|data$Genre=="Musical"|data$Genre=='Music'|data$Genre=='History'] = "Drama"
data$Genre[data$Genre=='Sci-Fi'|data$Genre=='Fantasy'|data$Genre=='War'|data$Genre=='Mystery'] = "Adventure"
data$Genre <- factor(data$Genre, levels = c("Action","Adventure","Animation","Biography","Comedy","Drama","Horror","Romance"))
Run_time <- data$Run_time
data$Run_time <- as.numeric(data$Run_time)
for (i in 1:length(data[,'Run_time'])) {
  a <- as.vector(Run_time[i])
  b <- unlist(strsplit(a,split=" "))
  data[i,'Run_time'] <- as.numeric(b[1])
}
data$Run_time <- as.numeric(data$Run_time)
data$IMDbscore <- impute(data$IMDbscore,median)
data$Metascore <- impute(data$Metascore,median)
data$Votes <- impute(data$Votes,median)
data$Run_time <- impute(data$Run_time,median)
data$Genre <- impute(data$Genre, 'Drama')

reg <- lm(IMDbscore ~ Popularity_rank + Metascore + log(Votes) + Run_time + Genre, data = data)
data1<-data
data1$Genre <- as.numeric(data1$Genre)
x<-as.matrix(data1[,c(1,3:6)])
y<-as.matrix(data1$IMDbscore)

xgb<-xgboost(data = x, label = y, max.depth = 6,eta = 0.3, nthread = 2, verbose=2, nround = 10)


function(input, output) {
  output$score <- renderTable(
    {
      if (is.null(input$file)){
        target_data <- data.frame(Popularity_rank=input$rank,Metascore=input$metascore,Votes=input$votes,Run_time=input$time,Genre=input$genre)
      }else{
        infile<-input$file
        target_data <- read.csv(input$datapath)
      }
      t_data<-target_data
      if (t_data$Genre=="Action"){
        t_data$Genre <- 1 
      }else if(t_data$Genre=="Adventure"){
        t_data$Genre <- 2
      }else if(t_data$Genre=="Animation"){
        t_data$Genre <- 3
      }else if(t_data$Genre=="Biography"){
        t_data$Genre <- 4
      }else if(t_data$Genre=="Comedy"){
        t_data$Genre <- 5
      }else if(t_data$Genre=="Drama"){
        t_data$Genre <- 6
      }else if(t_data$Genre=="Horror"){
        t_data$Genre <- 7
      }else if(t_data$Genre=="Romance"){
        t_data$Genre <- 8
      }
      value1 <- predict(reg,target_data)
      value2 <- predict(xgb,as.matrix(t_data))
      if (input$model == "Linear Regression"){
        value <- value1
      }else if(input$model == "XGBoost"){
        value <- value2
      }
      t<-matrix(value,ncol=1, dimnames = list(NULL,"IMDbscore"))
      
    }
  )
}