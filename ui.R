
shinyUI(fluidPage(
    
    titlePanel("Simple Simulation to Learn Central Limit Theorem"),
    
    p("The App runs the simple simulation to help learn about CLT. In specific, how the sample mean value normally 
    distributed by the theoretical mean. "),
    p("To start with, choose the distribution you want to test:"),
    
    
    sidebarLayout(
        
        mainPanel(
            tabsetPanel(id = "tabset",
                        tabPanel("Normal",
                                 sliderInput("mnN", "Input distribution mean:",value = 5, min = 1, max = 10, step = 1,),
                                 sliderInput("sdN", "Input distribution sd:",value = 1, min = 1, max = 10, step = 2,)
                        ),
                        tabPanel("Poisson",
                                 sliderInput("mnP", "Input distribution mean:",value = 5, min = 1, max = 10, step = 1,)
                        ),
                        tabPanel("Exponential",
                                 sliderInput("mnE", "Input distribution mean:",value = 5, min = 1, max = 10, step = 1,)
                        )
            ),
            
            h3("Set Simulation Parameter"),
            p("Choose the sample size and how many times you want to run the simulation."),
            numericInput('n', 'Sample Size',value = 40, min = 30, max = 80, step = 10,),
            numericInput('round', 'Times conducting simulation',value = 1000, min = 500, max = 2000, step = 500,),
            
            h3("Run Simulation"),
            p("Now let's run the simulation to see how does the mean of each sample look like."),
            actionButton("go", "Run Simulation!"),
            
            textOutput('Result')
            
        ),
        
        sidebarPanel(
            plotOutput('distPlot'),
            
            p("Results of simulation:"),
            plotOutput('meanPlot')
            
        )
        
    )
)
)
