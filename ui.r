library(plotly)
library(markdown)
navbarPage("Sugar Dashboard", 
           tabPanel("Balance sheet",
                   fluidPage( theme = "bootstrap.css",
                     mainPanel(
        fluidRow( column(8,selectInput("var", selected = "select",
                                                         label = "Choose a variable to display",
                                                         choices = c("Opening Stock", "Production",
                                                                     "Import", "Consumption","Export","Closing Stock")
                      )
                      ),
                    column(8,selectInput("var1", selected = "select",
                                           label = "Choose a variable to display",
                                           choices = c("Opening Stock", "Production",
                                                       "Import", "Consumption","Export","Closing Stock")
                      )
                    )
        )
                      ,
                      
                     plotlyOutput("plot"),
                                 DT::dataTableOutput('view'),width = "100%")
                      
                    
                    
           )
),
navbarMenu("Production",
           tabPanel("Acreages",
         fluidPage( theme = "bootstrap.css",
           titlePanel("Acreages in Lakh Ha"),
           mainPanel(
         
fluidRow(column(8,selectInput("var2",selected = "select",label="Choose Year",
                    choices = c("2012-13","2013-14","2014-15","2015-16",
          "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside"))),
         column(8,selectInput("var21",selected = "select",label="Choose Year",
choices = c("2012-13","2013-14","2014-15","2015-16",
       "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside")))
         )
           ,
           plotlyOutput("plot1"),
DT::dataTableOutput('view1'),width = "100%")
           )
)
 ,tabPanel("Yield",
                   fluidPage(
                     titlePanel("Yield in Lakh Tonnes"),
                     mainPanel(
                       
                       fluidRow(column(8,selectInput("var3",selected = "select",label="Choose Year",
                                                     choices = c("2012-13","2013-14","2014-15","2015-16",
                                                                 "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside"))),
                                column(8,selectInput("var31",selected = "select",label="Choose Year",
                                                     choices = c("2012-13","2013-14","2014-15","2015-16",
                                                                 "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside")))
                       )
                       ,
                       plotlyOutput("plot2"),
                       DT::dataTableOutput('view2'),width = "100%")
                   )
         )
,tabPanel("Productions",
          fluidPage(
            titlePanel("Production in Lakh Tonnes"),
            mainPanel(
              
              fluidRow(column(8,selectInput("var4",selected = "select",label="Choose Year",
                                            choices = c("2012-13","2013-14","2014-15","2015-16",
                                                        "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside"))),
                       column(8,selectInput("var41",selected = "select",label="Choose Year",
                                            choices = c("2012-13","2013-14","2014-15","2015-16",
                                                        "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside")))
              )
              ,
              plotlyOutput("plot3"),
              DT::dataTableOutput('view3'),width = "100%")
          )
),
tabPanel("Drwal %",
         fluidPage(
           titlePanel("Drwal %"),
           mainPanel(
             
             fluidRow(column(8,selectInput("var5",selected = "select",label="Choose Year",
                                           choices = c("2012-13","2013-14","2014-15","2015-16",
                                                       "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside"))),
                      column(8,selectInput("var51",selected = "select",label="Choose Year",
                                           choices = c("2012-13","2013-14","2014-15","2015-16",
                                                       "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside")))
             )
             ,
             plotlyOutput("plot4"),
             DT::dataTableOutput('view4'),width = "100%")
         )
),        
tabPanel("Cane Crush",
         fluidPage(
           titlePanel("Drwal %"),
           mainPanel(
             
             fluidRow(column(8,selectInput("var6",selected = "select",label="Choose Year",
                                           choices = c("2012-13","2013-14","2014-15","2015-16",
                                                       "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside"))),
                      column(8,selectInput("var61",selected = "select",label="Choose Year",
                                           choices = c("2012-13","2013-14","2014-15","2015-16",
                                                       "2016-17","2017-18 Upside","2017-18 Base","2017-2018 Downside")))
             )
             ,
             plotlyOutput("plot5"),
             DT::dataTableOutput('view5'),width = "100%")
         )
)
),
tabPanel("Dispatches"),
tabPanel("Stocks"),
tabPanel("Import Parities"),
tabPanel("Price Charts") 
           
)
             
             





























