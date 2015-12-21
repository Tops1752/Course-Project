shinyUI(pageWithSidebar(
   
    
    headerPanel("Regression Study on mtcars data"),
    
    sidebarPanel(
        p("The purpose of this app is to study how the transmission effects the MPG of the motor vehicle. 
            Particularly, the study focuses on the two questions:"),
        p( "--Is an automatic or manual transmission better for MPG"),
        p( "--Quantify the MPG difference between automatic and manual transmissions"),
        
        
        
        
        
        
        
        sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
    ),
    
    mainPanel(
        plotOutput('newHist')
    )
    
    
    
)
)