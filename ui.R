##
# Something to try is: give an option of which defect thye'd like to see, and then when the click it
# then they can see the plot.


## trying to add the options
library(shinythemes)
library(shiny)
library(rsatscan)
# shinyUI(navbarPage("NBDPN: Time Monitoring",
shinyUI(fluidPage(
  titlePanel("Time Monitoring"),
                   theme = shinytheme("readable"),
                   sidebarLayout(
                     sidebarPanel(
                       h2("File Input"),
                              #       "Welcome to the Time Monitoring page!",

                                     # h5("Step 1. Please open this page in Internet Explorer version 9 or later."),
                                   #   br(),
                              #  h4("File Input"),
                                                               radioButtons("MIME", label = ("Data type:"),
                                                                            choices = list("SAS" = 1, "Excel" = 2,
                                                                                           "Text File" = 3), selected = 1),
                                                               br(),
                                                               fileInput("file1", label = "Place the data here:", accept = c(
                                                                 'text/csv',
                                                                 'text/comma-separated-values',
                                                                 'text/tab-separated-values',
                                                                 'text/plain', '.xls', '.xlsx', '.sas7bdat'
                                                               )),
                                                               dateInput("Today",
                                                                         label = "Today's Date", value=NULL),
                          
                                  selectInput("datetype", label="Choose a time frame:", 
                                              choices = list("Year", "Month")),
                                  #Title
                                  strong( h6("Begin Date")),
                                  #Widget
                                  uiOutput("BeginDateWidget"),
                                  
                                  #Title
                                  strong(h6("End Date")),
                                  #Widget
                                  uiOutput("EndDateWidget"),
                                  
                                  ####START BUTTON####
                                  actionButton("goButton", "Start Analysis!")
                           ) ,
### SATSCAN OUTPUT #### 
mainPanel(uiOutput("Choices"),
                            uiOutput("dynamicTabs")
)
                 )))
                 #,
               