shinyUI(
  
  navbarPage(
    
    # title=NULL,
    title="NBDPN: Time Monitoring",
    id="mainNavbarPage",
                   theme = shinytheme("readable"),
             tabPanel("Welcome", value="tabinput3",
                      fluidPage( 
                       
                        # sidebarLayout(position="right",
                        #   sidebarPanel(width=10,
                        tabsetPanel(title="Time Monitoring",
                                                  tabPanel("How to Use",
                                                           fluidPage(
                                                             column(3,
                                                           wellPanel(h4("Step 1"),
                                                                     p("Gather data like so:"),
                                                                   "cute cat here"
                                                                     )),
                                                           
                                                           column(3, 
                                                           wellPanel(h4("Step 2"),
                                                                     "Data needs to be in the same
                                                                     time frame",
                                                                     "insert a pic where you
                                                                     outline the years in that old one"
                                                                     )),
                                                           
                                                           column(3,
                                                                  wellPanel(
                                                                   h4( "Step 3.
                                                                    Go to File Input
                                                                    to start the process!",
                                                                       actionButton("file-go", "Start Analysis!")
                                                                       
                                                                  )
                                                                  ))
                                                                  ))
                                                           ,
                               
                                    tabPanel("Having Trouble?",
                                             h3("FAQ"),
                                             
                                             strong(p("This is question 1")),
                                             p("this is the cute answer", style = "color:dodgerblue")
                                             
                                    ),
                                                  tabPanel("About",
                                                       h5("Licenses"),    
                                                  tags$ul(
                                                    tags$li("RStudio Team (2016). RStudio: Integrated Development for R. RStudio, Inc., Boston, MA URL",(tags$a(href="http://www.rstudio.com/.", "http://www.rstudio.com/."))), 
                                                    tags$li("SaTScan: Kuldorff M and Information Management Services I. SaTScanTM v6.0: Software for the spatial and space-time scan statistics. 2005.",(tags$a(href="www.satscan.org", "www.satscan.org"))), 
                                                  tags$li("Icons made by", (tags$a(href="http://www.flaticon.com/authors/alessio-atzeni", "Alessio Atzeni")),"from",(tags$a(href="http://www.flaticon.com", "www.flaticon.com")),"is licensed by",tags$a(href="http://creativecommons.org/licenses/by/3.0/","Creative Commons BY 3.0")),
                                                   
                                                    tags$li("Various R Packages:", tags$ul(
                                                            strong(tags$li('rsatscan')),
                                                            tags$li('shinythemes'),
                                                            tags$li('XML')))
                                                            
                                                    
                                                      
                                                      
                                                    
                                                            
                                                  )
                                                  )))
                      #, 
                      # mainPanel(width=2,h5("NBDPN: Time Monitoring")
                      # )
                      # )
  )
                      ,
                   tabPanel("File Input Page",value="taboutput",
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
                                # h4(p("About"), align="right", style = "color:dodgerblue"),
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
                              # plotlyOutput("plots")
                  htmlOutput("inc")
                   ) 
                            )))))
#,

