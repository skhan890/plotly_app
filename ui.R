shinyUI(navbarPage("NBDPN: Time Monitoring",
                   theme = shinytheme("readable"),
                   #                    tabPanel("Instructions",
                   #                             fluidPage(  
                   
                   #                                 column(3,
                   #                                      h4("Welcome to the Time Monitoring page! Please aggregate your data")
                   #                                                ),
                   #                                      column(4,
                   #                                      h4("File should be formatted as such:"),
                   #                                      img(src='file_example.png', align = "left"))
                   #                                      
                   #                                      )),
                   #                    tabPanel("Clusters", h3("Clusters detected from:"), uiOutput({
                   #                      if(is.null("contents23"))
                   #                        return(NULL)
                   #                      "contents23"
                   #                    })),
                   
                   
                   tabPanel("File Input Page",
                            fluidPage( 
                              column(3,
                                     
                                     h4("File Input"),
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
                                               label = "Today's Date", value=NULL)
                                     #   
                              ),
                              
                          
                              column(4, 
                                     #Title
                                     h4("Time Range options"),
                                     #Widget
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
                              )
                              #,
                              
                            
                              
                              
                              
                              ) ) ,
                   ### SATSCAN OUTPUT #### 
                   tabPanel("Time Clusters",
                            fluidPage(
                              column(4, offset=6,
                                     uiOutput("Choices")
                                     # h4("Defect(s) Selection"),
                                     # # tableOutput("defect_table"),
                                     # selectizeInput('in6', label='Choose the defect(s) to be analyzed:', 
                                     #                choices = levels(defects$DEFECT), multiple = TRUE),
                                     # 
                                     # br(),
                                     # bsTooltip("in6", "Pick one or more defects.",
                                     #           "right", options = list(container = "body"))
                                     
                              ),
                              plotlyOutput("plots")
                             
                              
                            ))))
#,

