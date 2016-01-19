shinyUI(
  navbarPage(
    title = "NBDPN: Time Monitoring",
    id = "mainNavbarPage",
    theme = shinytheme("readable"),
    
    tabPanel(
      "Welcome!",
fluidPage(
  splitLayout(
    wellPanel(h4("Welcome to the Time Monitoring page"),
              hr(),
              h5(p("Purpose of this app:",style = "color:dodgerblue")),
              p("As part of the National Birth Defects Prevention Network, there was a need to 
                conduct analysis of changes in birth defects over time in a regular manner"),
              hr(),
              h5(p(style = "color:dodgerblue","Methods used:")),
              p("SaTScan (spatial scan-statistic software)"),
              tags$ul(
                tags$li("Purely temporal"),
                tags$li("Retrospective"),
                tags$li("High-rates only (Observed > Expected"),
                tags$li("Poisson distribution"))),

    wellPanel("This is where to go")
    
  )
)
    ),
    
    # title=NULL,
    
    tabPanel(
      "Tutorial",
      value = "tabinput3",
      fluidPage(
        column(3,
               wellPanel(
                 h4("Step 1"),
                 strong("Prepare data files"),hr(),
                 
                 
                 p("Data should look like below:"),
                 hr(),
                 img(src = 'Icons/graph.png', align = "center")

              ) ),
        
        column(
          3,
          wellPanel(
            h4("Step 2"),
            strong("Notes on aggregating data:"),hr(),
            p("Create a SAS (.sas7bdat), Excel (.xls, .xlsx) or tab delimited Text (.txt) of aggregate-data with the following variables:"),
            hr(),
            tags$ul(
              tags$li(strong("ID:"),"Suggested — your two-character State (e.g. FL)."), 
              tags$li(strong("Defect_Name:"), "A string that identifies your defect. There should be no spaces.","(e.g. 'Trisomy_21' instead of 'Trisomy 21')"), 
              tags$li(strong("Cases:"), "Case count for that time unit.**"),
              tags$li(strong("Time:"), "Aggregate all data by year only (YYYY), or by month and year (YYYY/MM)."),
              tags$li(strong("Population:"), "The number of live births (birth defect cases + all other infants born that year) in your whole registry area for each date combination."
              )),
            hr(),
            p(style = "color:dodgerblue","Notes:"),
            p("Your Excel file or text file must have a header row with the five variables (ID DEFECT_NAME CASES TIME POPULATION)."),
            # p(style = "color:dodgerblue","Note on Cases**:"),
            p("** Each defect must be within the same time frame. You cannot look at one defect from 2004-2006 and another from 2003-2006. To do this, create two different files.")
            
 ,
            hr()
          )
          ),
        
        column(3,
       
                      wellPanel(
                        h4("Step 3"),
                        hr(),
                  p( "Once the data is aggregated, go to the File Input page to start the analysis."),
                   actionButton("filego", "Start Analysis!")
                   
                 
               ))
#,
        
        # column(12,
        #        fluidPage(
        #          tabPanel(
        #            "Having Trouble?",
        #            h3("FAQ"),
        #            
        #            strong(p("This is question 1")),
        #            p("this is the cute answer", style = "color:dodgerblue")
        #            
        #            
        #          )
        #        ))
        )
        )
    ,
    
    
    tabPanel("File Input Page", value = "taboutput",
             fluidPage(
               sidebarLayout(
                 sidebarPanel(
                   width = 3,
                   tags$style(".well {background-color:gray92;}"),
                   wellPanel(
                     h4(p("File Input"), align = "right", style = "color:dodgerblue"),
                     img(src = 'Icons/one.png', align = "center"),
                     br(),
                     br(),
                     radioButtons(
                       "MIME",
                       label = (" Data type:"),
                       choices = list(
                         "SAS" = 1,
                         "Excel" = 2,
                         "Text File" = 3
                       ),
                       selected = 1
                     ),
                     br(),
                     img(src = 'Icons/two.png', align = "center"),
                     br(),
                     br(),
                     fileInput(
                       "file1",
                       label = "Place the data here:",
                       accept = c(
                         'text/csv',
                         'text/comma-separated-values',
                         'text/tab-separated-values',
                         'text/plain',
                         '.xls',
                         '.xlsx',
                         '.sas7bdat'
                       )
                     )
                   ),
                   
                   
                   #
                   # ),
                   wellPanel(
                     #Title
                     h4(p("Time Range"), align = "right", style = "color:dodgerblue"),
                     #Widget
                     img(src = 'Icons/three.png', align = "center"),
                     br(),
                     br(),
                     
                     selectInput(
                       "datetype",
                       label = "Choose a time frame:",
                       choices = list("Year", "Month")
                     ),
                     #Title
                     img(src = 'Icons/four.png', align = "center"),
                     br(),
                     br(),
                     strong(h6("Begin Date")),
                     #Widget
                     uiOutput("BeginDateWidget"),
                     
                     #Title
                     img(src = 'Icons/five.png', align = "center"),
                     br(),
                     br(),
                     strong(h6("End Date")),
                     #Widget
                     uiOutput("EndDateWidget"),
                     
                     ####START BUTTON####
                     img(src = 'Icons/six.png', align = "center"),
                     br(),
                     br(),
                     actionButton("goButton", "Start Analysis!")
                   ),
                   wellPanel(
                     # h4(p("About"), align="right", style = "color:dodgerblue"),
                     # h5(("Today's Date")),
                     dateInput("Today",
                               label = "Today's Date", value =
                                 NULL),
                     p(
                       h5("Contact for help:"),
                       span("skhan81.900", style = "color:black"),
                       span("@", style = "color:dodgerblue"),
                       span("gmail.com", style = "color:black")
                     )
                   )
                 )
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
                 mainPanel(# hr(),
                   h6(textOutput(
                     "caption", container = span
                   )),
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
                   htmlOutput("inc"))
               )
             )),
    
    
    
    
    tabPanel("About",
             fluidPage(
             wellPanel(align="center",
      # "About",
      h5("Licenses"),
      tags$ul(
        
        
        tags$li(
          "Shiny framework courtesy of: RStudio Team (2016). RStudio: Integrated Development for R. RStudio, Inc., Boston, MA URL",
          (
            tags$a(href = "http://www.rstudio.com/.", "http://www.rstudio.com/.")
          )
        ),
        tags$li(
          "SaTScan: Kuldorff M and Information Management Services I. SaTScanTM v6.0: Software for the spatial and space-time scan statistics. 2005.",
          (tags$a(href = "www.satscan.org", "www.satscan.org"))
        ),
        tags$li(
          "Icons made by",
          (
            tags$a(href = "http://www.flaticon.com/authors/alessio-atzeni", "Alessio Atzeni")
          ),
          "from",
          (tags$a(href = "http://www.flaticon.com", "www.flaticon.com")),
          "is licensed by",
          tags$a(href = "http://creativecommons.org/licenses/by/3.0/", "Creative Commons BY 3.0")
        ),
        
        tags$li("Various R Packages:", tags$ul(
          strong(tags$li('rsatscan')),
          tags$li('shinythemes'),
          tags$li('XML')
        )),
        hr()),
       p( span("Contact skhan81.900", style = "color:black"),
                 span("@", style = "color:dodgerblue"),
                 span("gmail.com for any bugs or assistance.", style = "color:black"))
        )
        
      )
    )
        )
  )

