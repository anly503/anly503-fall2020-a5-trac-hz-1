library(altair)
#Fridge_04_2012_06_27
setwd("/Users/tracysheng/Desktop/503/anly503-fall2020-a5-trac-hz/eco/")
Fridge_04_2012_06_27<-read.csv("04_plugs_csv/01/2012-06-27.csv")
Fridge_05_2012_06_27<-read.csv("05_plugs_csv/01/2012-06-27.csv")
Fridge_06_2012_06_27<-read.csv("06_plugs_csv/01/2012-06-27.csv")
data0<-cbind(Fridge_04_2012_06_27,Fridge_05_2012_06_27,Fridge_06_2012_06_27)
#generate time series data
time<-seq(from=as.POSIXct("2012-06-27 00:00:01"),to=as.POSIXct("2012-06-27 23:59:59"), by="secs")
data_0<-cbind(time,data0)
colnames(data_0)<-c('time','house4','house5','house6')

##example
library(reticulate)
py_install("pandas")
use_condaenv("r-reticulate")
conda_install("r-reticulate", "scipy")
scipy <- import("scipy")

vega_data <- import_vega_data()
chart <- 
  alt$Chart(vega_data$cars())$
  mark_point()$
  encode(
    x = "Horsepower:Q",
    y = "Miles_per_Gallon:Q",
    color = "Origin:N",
    tooltip = c("Name", "Horsepower", "Miles_per_Gallon", "Origin")
  )
vegawidget(chart)