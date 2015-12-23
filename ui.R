shinyUI(pageWithSidebar(
   
    
    titlePanel("Simple Simulation to learn Central Limit Theorem"),
    
    mainPanel(
        p("In probability theory, the central limit theorem (CLT) states that, 
          given certain conditions, the arithmetic mean of a sufficiently large 
          number of iterates of independent random variables, 
          each with a well-defined expected value and well-defined variance, 
          will be approximately normally distributed, 
          regardless of the underlying distribution"),
        p("This APP builds some simple simulation to help understand CLT"),
        
        h3("Step 1 - Choose Distribution"),
        radioButtons("dist", "Distribution Type:",
                           c("Normal" = "norm",
                             "Poisson" = "pois",
                             "Exponential" = "exp")
                     ),
        sliderInput("mn", "Input distribution mean:",value = 5, min = 1, max = 10, step = 1,),
        sliderInput("sd", "Input distribution sd:",value = 1, min = 1, max = 10, step = 2,),
        
        h3("Step 2 - Set Simulation Parameter"),
        p("Choose the sample size and how many times you want to run the simulation."),
        numericInput('n', 'Sample Size',value = 40, min = 30, max = 80, step = 10,),
        numericInput('round', 'Times conducting simulation',value = 1000, min = 500, max = 2000, step = 500,),
        
        h3("Setp 3 - Run Simulation"),
        p("Now let's run the simulation to see how does the mean of each sample look like."),
        actionButton('run','Run Simulation!'),
        
        
        
        sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
    ),
    
    
    sidebarPanel(
      
      plotOutput('distPlot'),
      
      p("Results of simulation:"),
      plotOutput('meanPlot')
      
    )
    
    
    
)
)