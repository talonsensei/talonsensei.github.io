library(shiny)

shinyServer(function(input, output) {

    # Read data
    # input$file1 will be NULL initially. After the user selects and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath' column will contain the local filenames where the data can be found.
    dataSet <- reactive({
        inFile <- input$file1

        if (is.null(inFile)) { return(NULL) }
        
        mydata <- read.table(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)        
        return(mydata)
        })

    # Output table of data
    output$contents <- renderTable({ dataSet()  })

    # Output data graph
    output$plot <- renderPlot({
        plot(dataSet()[,1:2], ylim=c(0,max( max(dataSet()[,2]), max(dataSet()[,3]) )), ylab=input$myYlab, xlab=input$myXlab, main=input$myTitle )
        points(dataSet()[,3], col=2)
    })
})