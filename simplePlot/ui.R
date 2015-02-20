library(shiny)

shinyUI(
    fluidPage(
        titlePanel("Simple Plot Demo"),
        sidebarLayout(
            sidebarPanel(
                conditionalPanel(
                    condition = "input.tabs1=='About'",
                    h4("Introduction")
                ),
                conditionalPanel(
                    condition = "input.tabs1=='Data upload'",
                    
                    h4("Describe data file"),
                    checkboxInput('header', 'Header', TRUE),
                    radioButtons('sep', h5('Separator'), c(Comma=',', Tab='\t'), ','),
                    radioButtons('quote', h5('Quote'), c(None='', 'Double Quote'='"', 'Single Quote'="'"), '"'),
                    fileInput('file1', h4('Choose text file to load'), accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv'))
                    #tags$hr(),
                ),
                conditionalPanel(
                    condition = "input.tabs1=='Plot Data'",
                    h4("Label your plot"),
                    textInput("myXlab", "X-axis label:", value=c("")),
                    textInput("myYlab", "Y-axis label:", value=c("")),
                    textInput("myTitle", "Plot title:", value=c(""))
                )
            ),
            mainPanel(
                tabsetPanel(
                    # Welcome tab
                    tabPanel(
                        "About",
                        HTML('<p>This application allows users to upload a simple data file and plot it</p> <p>The data file can be tab or comma delimited. 
                            It should have three columns, where the first column will be used for the X-axis</p>')
                    ),
                    # Data upload tab
                    tabPanel(
                        "Data upload", 
                        tableOutput("contents")
                    ),
                    # Plot tab
                    tabPanel(
                        "Plot Data",
                        plotOutput("plot")
                    ),
                    id="tabs1"
                )
            )
        )
    )
)