library(shiny)
library(ggplot2)


ui <- fluidPage(
  titlePanel("IMDb Score prediction"),
  
  
  sidebarPanel(
    
    tags$h2("Way 1 to input data"),
    
    tags$br(),
    
    numericInput("rank","Popuparity_Rank", value = 500, min = 1, max = 10000),
    
    sliderInput("metascore","Metascore", value = 60, min = 0, max = 100),
    
    numericInput("votes","Votes", value = 600, min = 0),
    
    numericInput("time","Run_time", value = 90, min = 1, max = 1000),
    
    selectInput("genre","Genre",c("Action","Adventure","Animation","Biography","Comedy","Drama","Horror","Romance")),
    
    radioButtons("model","Model",c("Linear Regression","XGBoost")),
    
    tags$br(),
    
    tags$br(),
    
    tags$h2("Way 2 to input data"),
    
    tags$br(),
    
    fileInput("file","Input .csv File")
    
  ),
  
  mainPanel(
    tableOutput("score")
  )
)