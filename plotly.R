library(plotly)
library(magrittr)
library("lubridate")
library(tidyr)
##Load aggregate consumption data
setwd("/Users/tracysheng/Desktop/503/anly503-fall2020-a5-trac-hz/eco")
sm04_2012_06_27<-read.csv("04_sm_csv/2012-06-27.csv",header = FALSE)
sm05_2012_06_27<-read.csv("05_sm_csv/2012-06-27.csv",header = FALSE)
sm06_2012_06_27<-read.csv("06_sm_csv/2012-06-27.csv",header = FALSE)

colnames(sm04_2012_06_27)<-c('powerallphases','powerl1','powerl2','powerl3',
                             'currentneutral','currentl1','currentl2','currentl3',
                             'voltagel1','voltagel2','voltagel3','phaseanglevoltagel2l1',
                             'phaseanglevoltagel3l1','phaseanglecurrentvoltagel1',
                             'phaseanglecurrentvoltagel2','phaseanglecurrentvoltagel3')
colnames(sm05_2012_06_27)<-c('powerallphases','powerl1','powerl2','powerl3',
                             'currentneutral','currentl1','currentl2','currentl3',
                             'voltagel1','voltagel2','voltagel3','phaseanglevoltagel2l1',
                             'phaseanglevoltagel3l1','phaseanglecurrentvoltagel1',
                             'phaseanglecurrentvoltagel2','phaseanglecurrentvoltagel3')
colnames(sm06_2012_06_27)<-c('powerallphases','powerl1','powerl2','powerl3',
                             'currentneutral','currentl1','currentl2','currentl3',
                             'voltagel1','voltagel2','voltagel3','phaseanglevoltagel2l1',
                             'phaseanglevoltagel3l1','phaseanglecurrentvoltagel1',
                             'phaseanglecurrentvoltagel2','phaseanglecurrentvoltagel3')
#one row for each second
data0<-cbind(sm04_2012_06_27[,1],sm05_2012_06_27[,1],sm06_2012_06_27[,1])
data0<-as.data.frame(data0)
colnames(data0)<-c('house4','house5','house6')

#generate time series data
time<-seq(from=as.POSIXct("2012-06-27 00:00:00"),to=as.POSIXct("2012-06-27 23:59:59"), by="secs")
data_0<-cbind(time,data0)

#mutate data:(collapse) columns into rows
data_1<-gather(data_0,key='household',value='consumption',-time)

plot_ly(data_1, 
        x=~time,
        y =~consumption, 
        color =~household,
        type='scatter', mode='markers') %>% 
  plotly::layout(
    xaxis = list(title='time'),
    yaxis = list(title='overall power consumption'),
    title = 'overall power consumption on 6/27/2012'
  )


