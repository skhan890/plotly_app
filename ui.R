shinyUI(
  
  navbarPage(
    
    title=NULL,
    # title="NBDPN: Time Monitoring", 
    id="mainNavbarPage",
                   theme = shinytheme("readable"),
             tabPanel("Welcome",value="tabinput3",
                      fluidPage( 
                        sidebarLayout(position="right",
                          sidebarPanel(width=10,
                                       navbarPage(title="cats",
                                                  tabPanel("YeeEs","im a home cat"),
                                                  tabPanel("YeeEs2","im a home cat2"))), 
                      mainPanel(width=2,h5("NBDPN: Time Monitoring")
                      )
                      )))
                      ,
                   tabPanel("File Input Page",value="tabinput",
                            fluidPage( 

                             sidebarLayout(
                                     sidebarPanel(width=3,
                                                  tags$style(".well {background-color:gray92;}"),
                                     wellPanel(
                                       h4(p("File Input"), align="right",style = "color:dodgerblue"),
                                       img(src='Icons/one.png', align="center"),br(),br(),
                                               radioButtons("MIME", label = (" Data type:"),
                                                  choices = list("SAS" = 1, "Excel" = 2,
                                                                 "Text File" = 3), selected = 1),
                                     br(),
                                     img(src='Icons/two.png', align="center"),br(),br(),
                                     fileInput("file1", label = "Place the data here:", accept = c(
                                       'text/csv',
                                       'text/comma-separated-values',
                                       'text/tab-separated-values',
                                       'text/plain', '.xls', '.xlsx', '.sas7bdat'
                                     ))),
                                     

                                     #   
                              # ),
                                     wellPanel(
                                     #Title
                                       h4(p("Time Range"),align="right", style = "color:dodgerblue"),
                                     #Widget
                                     img(src='Icons/three.png', align="center"),br(),br(), 
                                     
                                       selectInput("datetype", label="Choose a time frame:", 
                                                 choices = list("Year", "Month")),
                                     #Title
                                     img(src='Icons/four.png', align="center"),br(),br(),  strong( h6("Begin Date")),
                                     #Widget
                                     uiOutput("BeginDateWidget"),
                                     
                                     #Title
                                     img(src='Icons/five.png', align="center"),br(),br(),strong(h6("End Date")),
                                     #Widget
                                     uiOutput("EndDateWidget"),
                                     
                                     ####START BUTTON####
                                     img(src='Icons/six.png', align="center"),br(),br(),actionButton("goButton", "Start Analysis!")
                              ),
                              wellPanel(     
                                h4(p("About"), align="right", style = "color:dodgerblue"),
                                # h5(("Today's Date")),
                                dateInput("Today",
                                          label = "Today's Date", value=NULL),
                                p(h5("Contact for help:"),
                                  span("skhan81.900", style = "color:black"),span("@", style="color:dodgerblue"),
                                  span("gmail.com", style="color:black"))))
                              ,
                   #            #,
                   #            
                   #          
                   #            
                   #            
                   #            
                   #            ) ) ,
                   # ### SATSCAN OUTPUT #### 
                   # tabPanel("Time Clusters",value="taboutput",
                   #          fluidPage(
                 mainPanel(
                            # hr(),
                   h6(textOutput("caption", container = span)),
                            uiOutput("Choices"),
                           
                                     # h4("Defect(s) Selection"),
                                     # # tableOutput("defect_table"),
                                     # selectizeInput('in6', label='Choose the defect(s) to be analyzed:', 
                                     #                choices = levels(defects$DEFECT), multiple = TRUE),
                                     # 
                                     # br(),
                                     # bsTooltip("in6", "Pick one or more defects.",
                                     #           "right", options = list(container = "body"))
                  # , fluidRow(column(12,  align="center",
                              plotlyOutput("plots")
                             
                   ) 
                            )))))
#,

