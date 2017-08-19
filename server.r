library(shiny)
library(ggplot2)
library(readxl)
library(plotly)
library(DT)
library(RColorBrewer)
setwd("C:/Users/rishabh/Desktop/myapp")
d <-read_excel("sd.xlsx",sheet = 1)
d$`Opening Stock` <- round(d$`Opening Stock`,2)
d1 <- read_excel("sd.xlsx",sheet = 2)
d11 <- d1[!d1$States=="INDIA",]
d2 <- read_excel("sd.xlsx",sheet=3)
d21 <- d2[!d2$States=="INDIA",]
d3 <- read_excel("sd.xlsx",sheet = 4)
d31 <-d3[!d3$States=="INDIA",]
d4 <- read_excel("sd.xlsx",sheet=5)
d41 <-d4[!d4$States=="INDIA",]
d5 <- read_excel("sd.xlsx",sheet=6)
d51 <- d5[!d5$States=="INDIA",]
shinyServer(function(input, output) {
  
  
  output$plot <- renderPlotly({
   
    ax <- list(titile=" ")
    ay <- list(title=" ")
    data <- switch(input$var, 
                   "Opening Stock" = d$`Opening Stock`,
                   "Production" = d$Production,
                   "Import" = d$Import,
                   "Consumption" = d$Consumption,
                   "Export" = d$Export,
                   "Closing Stock"=d$`Closing Stock`
    )
    data1 <- switch(input$var1,"Opening Stock"=d$`Opening Stock`,"Production"= d$Production,  "Import" = d$Import,
                    "Consumption" = d$Consumption,
                    "Export" = d$Export,
                    "Closing Stock"=d$`Closing Stock`)
    plot_ly(d, x = ~`SND Attribute`, y = ~data,type= "scatter",mode = 'markers+lines',
            marker = list(size = 10)) %>%  config(displayModeBar = F) %>%
      add_trace(x = ~d$`SND Attribute`, y = ~data1,type="scatter", mode="markers+lines") %>%
      layout(
        title = " ", 
        xaxis = list(title=" ") ,yaxis=ay,showlegend=FALSE) 
    
    
  })
  output$view <-DT::renderDataTable(
  head(d,n=input$var)
)
  
  
  
 output$plot1 <- renderPlotly({  
   data2 <- switch(input$var2,"2012-13"=d11$`2012-13`,"2013-14"=d11$`2013-14`,"2014-15"=d11$`2014-15`,
                   "2015-16"=d11$`2015-16`,"2016-17"=d11$`2016-17`,"2017-18 Upside"=d11$`2017-18 Upside`,
                   "2017-18 Base"=d11$`2017-18 Base`,"2017-18 Downside"=d11$`2017-18 Downside`)
   data21 <- switch(input$var21,"2012-13"=d11$`2012-13`,"2013-14"=d11$`2013-14`,"2014-15"=d11$`2014-15`,
                   "2015-16"=d11$`2015-16`,"2016-17"=d11$`2016-17`,"2017-18 Upside"=d11$`2017-18 Upside`,
                   "2017-18 Base"=d11$`2017-18 Base`,"2017-18 Downside"=d11$`2017-18 Downside`)
  
  #tot<-d1[d1$States=="INDIA",]
   #totalv <- tot$data2
  #tit <- paste0(totalv, " Lakh Ha")
  # tota <- paste0("Total Acreage INDIA = ",tit)
  # d1<-d1[!d1$States=="INDIA",]
   ay <- list(
     tickfont = list(color = "red"),
     overlaying = "y",
     title = " "
   )
   ax <- list(
     tickfont = list(color = "red"),
     overlaying = "x",
     title = " "
   )
   plot_ly(d11, x = ~States, y = ~data2,type="bar",mode="markers",
           marker = list(size = 10)) %>%  config(displayModeBar = F) %>%
     add_trace(x = ~States, y = ~data21,mode="lines") %>%
     layout(
       title = " ", 
       xaxis = list(title=" ") ,yaxis=ay,showlegend=FALSE) 
   
   
   })
 output$view1 <-DT::renderDataTable(
   head(d1,n=input$var2)
 )
  
 
 output$plot2 <- renderPlotly({  
   data3 <- switch(input$var3,"2012-13"=d21$`2012-13`,"2013-14"=d21$`2013-14`,"2014-15"=d21$`2014-15`,
                   "2015-16"=d21$`2015-16`,"2016-17"=d21$`2016-17`,"2017-18 Upside"=d21$`2017-18 Upside`,
                   "2017-18 Base"=d21$`2017-18 Base`,"2017-18 Downside"=d21$`2017-18 Downside`)
   data31 <- switch(input$var31,"2012-13"=d21$`2012-13`,"2013-14"=d21$`2013-14`,"2014-15"=d21$`2014-15`,
                   "2015-16"=d21$`2015-16`,"2016-17"=d21$`2016-17`,"2017-18 Upside"=d21$`2017-18 Upside`,
                   "2017-18 Base"=d21$`2017-18 Base`,"2017-18 Downside"=d21$`2017-18 Downside`)
   
   #tot<-d1[d1$States=="INDIA",]
   #totalv <- tot$data2
   #tit <- paste0(totalv, " Lakh Ha")
   # tota <- paste0("Total Acreage INDIA = ",tit)
   # d1<-d1[!d1$States=="INDIA",]
   ay <- list(
     tickfont = list(color = "red"),
     overlaying = "y",
     title = " "
   )
   ax <- list(
    
     overlaying = "x",
     title = " "
   )
   plot_ly(d21, x = ~States, y = ~data3,type= "bar",mode = 'markers',
           marker = list(size = 10)) %>%  config(displayModeBar = F) %>%
     add_trace(x = ~States, y = ~data31 ,mode="lines") %>%
     layout(
       title = " ", 
       xaxis = ax ,yaxis=ay,showlegend=FALSE) 
   
   
 })
 output$view2 <-DT::renderDataTable(
   head(d2,n=input$var3)
 )
 
 
 output$plot3 <- renderPlotly({  
   data4 <- switch(input$var4,"2012-13"=d31$`2012-13`,"2013-14"=d31$`2013-14`,"2014-15"=d31$`2014-15`,
                   "2015-16"=d31$`2015-16`,"2016-17"=d31$`2016-17`,"2017-18 Upside"=d31$`2017-18 Upside`,
                   "2017-18 Base"=d31$`2017-18 Base`,"2017-18 Downside"=d31$`2017-18 Downside`)
   data41 <- switch(input$var41,"2012-13"=d31$`2012-13`,"2013-14"=d31$`2013-14`,"2014-15"=d31$`2014-15`,
                   "2015-16"=d31$`2015-16`,"2016-17"=d31$`2016-17`,"2017-18 Upside"=d31$`2017-18 Upside`,
                   "2017-18 Base"=d31$`2017-18 Base`,"2017-18 Downside"=d31$`2017-18 Downside`)
   #tot<-d1[d1$States=="INDIA",]
   #totalv <- tot$data2
   #tit <- paste0(totalv, " Lakh Ha")
   # tota <- paste0("Total Acreage INDIA = ",tit)
   # d1<-d1[!d1$States=="INDIA",]
   ay <- list(
     tickfont = list(color = "red"),
     overlaying = "y",
     title = " "
   )
   ax <- list(
     
     overlaying = "x",
     title = " "
   )
   plot_ly(d31, x = ~States, y = ~data4,type= "bar",mode = "markers",
           marker = list(size = 10)) %>%  config(displayModeBar = F) %>%
     add_trace(x = ~States, y = ~data41, mode="lines") %>%
     layout(
       title = " ", 
       xaxis = ax ,yaxis=ay,showlegend=FALSE) 
   
   
 })
 output$view3 <-DT::renderDataTable(
   head(d3,n=input$var4)
 )
 output$plot4 <- renderPlotly({  
   data5 <- switch(input$var5,"2012-13"=d41$`2012-13`,"2013-14"=d41$`2013-14`,"2014-15"=d41$`2014-15`,
                   "2015-16"=d41$`2015-16`,"2016-17"=d41$`2016-17`,"2017-18 Upside"=d41$`2017-18 Upside`,
                   "2017-18 Base"=d41$`2017-18 Base`,"2017-18 Downside"=d41$`2017-18 Downside`)
   data51 <- switch(input$var51,"2012-13"=d41$`2012-13`,"2013-14"=d41$`2013-14`,"2014-15"=d41$`2014-15`,
                    "2015-16"=d41$`2015-16`,"2016-17"=d41$`2016-17`,"2017-18 Upside"=d41$`2017-18 Upside`,
                    "2017-18 Base"=d41$`2017-18 Base`,"2017-18 Downside"=d41$`2017-18 Downside`)
   #tot<-d1[d1$States=="INDIA",]
   #totalv <- tot$data2
   #tit <- paste0(totalv, " Lakh Ha")
   # tota <- paste0("Total Acreage INDIA = ",tit)
   # d1<-d1[!d1$States=="INDIA",]
   ay <- list(
     tickfont = list(color = "red"),
     overlaying = "y",
     title = " "
   )
   ax <- list(
     
     overlaying = "x",
     title = " "
   )
   plot_ly(d41, x = ~States, y = ~data5,type= "bar",mode = 'markers',
           marker = list(size = 10)) %>%  config(displayModeBar = F) %>%
     add_trace(x = ~States, y = ~data51, mode="lines") %>%
     layout(
       title = " ", 
       xaxis = ax ,yaxis=ay,showlegend=FALSE) 
   
   
 })
 output$view4 <-DT::renderDataTable(
   head(d4,n=input$var5)
 )

 output$plot5 <- renderPlotly({  
   data6 <- switch(input$var6,"2012-13"=d51$`2012-13`,"2013-14"=d51$`2013-14`,"2014-15"=d51$`2014-15`,
                   "2015-16"=d51$`2015-16`,"2016-17"=d51$`2016-17`,"2017-18 Upside"=d51$`2017-18 Upside`,
                   "2017-18 Base"=d51$`2017-18 Base`,"2017-18 Downside"=d51$`2017-18 Downside`)
   data61 <- switch(input$var61,"2012-13"=d51$`2012-13`,"2013-14"=d51$`2013-14`,"2014-15"=d51$`2014-15`,
                   "2015-16"=d51$`2015-16`,"2016-17"=d51$`2016-17`,"2017-18 Upside"=d51$`2017-18 Upside`,
                   "2017-18 Base"=d51$`2017-18 Base`,"2017-18 Downside"=d51$`2017-18 Downside`)   
   #tot<-d1[d1$States=="INDIA",]
   #totalv <- tot$data2
   #tit <- paste0(totalv, " Lakh Ha")
   # tota <- paste0("Total Acreage INDIA = ",tit)
   # d1<-d1[!d1$States=="INDIA",]
   ay <- list(
     tickfont = list(color = "red"),
     overlaying = "y",
     title = " "
   )
   ax <- list(
     
     overlaying = "x",
     title = " "
   )
   plot_ly(d51, x = ~States, y = ~data6,type= "bar",mode = 'markers',
           marker = list(size = 10)) %>%  config(displayModeBar = F) %>%
     add_trace(x = ~States, y = ~data61,mode="lines") %>%
     layout(
       title = " ", 
       xaxis = ax ,yaxis=ay,showlegend=FALSE) 
   
   
 })
 output$view5 <-DT::renderDataTable(
   head(d5,n=input$var6)
 )
})
