# Shiny App - Predicting Winning Rate for MLB Teams

## Table of Contents
1. [Introduction](README.md#Introduction)
2. [Deployment](README.md#Deployment)
3. [Data Cleaning and Exploratory Data Analysis](README.md#data-cleaning-and-exploratory-data-analysis)
4. [Feature Engineering](README.md#feature-engineering)
5. [Modeling](README.md#Modeling)
6. [Conclusions](README.md#Conclusions)

## Introduction
This app was developed based on the data about IMDb films released in 2018. In this project we attempt to model the films features and predict the IMDb score of a film. The data is collected by using webscrapter which is a plug-in in chrome from the website https://www.imdb.com/search/title?title_type=feature&year=2018-01-01,2018-12-31&start=1&ref_=adv_nxt. Finally, our model is deployed as an Shiny App hosted on the shinyapps.io. 

## Deployment
There are two ways to access this app.

**1. Locally, in terminal, git clone this repo to the directory of your choice:**

`$ git clone https://github.com/BadBoyfearness/Stat-418-Project-Yichen_Zhou.git`

**or download zip file to the same directory. Then change your working directory to `docker/app` and run:**

`R -e "shiny::runApp()"`

**Copy the outputting link to any browser to run this app.** 

<br>

**2. Simply access this Shiny app at https://zhouyichen961104.shinyapps.io/418-project/** 

<br>

After opening this app, I give two ways to input the data. You can choose one of them. In the first way, you can adjust the sliders and radio buttons to input desired values for Popularity_rank, Metascore, Votes, Run_time, Genre to get a prediction of the IMDbscore as well as selecting the Linear Regression model or the XGBoost model. In the second way, you need to input a .csv file, this .csv file must have and only have these five variables including  Popularity_rank, Metascore, Votes, Run_time, Genre with the correct classes.

## Data Cleaning and Exploratory Data Analysis

## Feature Engineering


## Modeling

## Conclusions

