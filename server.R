shinyServer(
    function(input, output,session) {
      
        ## show an example of how the sample data look like
        output$distPlot <- renderPlot({
            
            distSample <- NULL
            if(input$tabset == "Poisson"){
                mu <- input$mnP
                distSample <- rpois(1000,mu)
                dat = data.frame(num = distSample)
                ggplot(dat,aes(num)) +
                    geom_density(aes(y=..density..)) + 
                    ggtitle("Example of Sample Data")
                
            } 
            else if(input$tabset == "Normal"){
                mu <- input$mnN
                sd <- input$sdN
                distSample <- rnorm(1000,mu,sd)
                dat = data.frame(num = distSample)
                ggplot(dat,aes(num)) +
                    geom_density(aes(y=..density..)) + 
                    ggtitle("Example of Sample Data")
                
            } 
            else{
                mu <- input$mnE
                distSample <- rexp(1000,1/mu)
                dat = data.frame(num = distSample)
                ggplot(dat,aes(num)) +
                    geom_density(aes(y=..density..)) + 
                    ggtitle("Example of Sample Data")
            }
        })
      
        v <- reactiveValues(doPlot = FALSE)
        
        observeEvent(input$go, {
            # 0 will be coerced to FALSE
            # 1+ will be coerced to TRUE
            v$doPlot <- input$go
        })
        
        observeEvent(input$tabset, {
            v$doPlot <- FALSE
        })  
        
        
        dataR<-reactive({
            n <- input$n
            times <- input$round
            
            set.seed(234)
            
            distribution <- NULL
            mnPlot <- NULL
            mns <- NULL
            mu <- 0
            
            data <- if(input$tabset == "Poisson"){
                mu <- input$mnP
                distribution <- matrix(data=rpois(n * times,mu), nrow=times)
                mns <- data.frame(means=apply(distribution, 1, mean))
                mns$mu <- mu
                mns
                
            }
            
            else if(input$tabset == "Normal"){
                mu <- input$mnN
                sd <- input$sdN
                
                distribution <- matrix(data=rnorm(n * times, mu,sd), nrow=times)
                mns <- data.frame(means=apply(distribution, 1, mean))
                mns$mu <- mu
                mns
            }
            
            else{
                mu <- input$mnE
                distribution <- matrix(data=rexp(n * times, 1/mu), nrow=times)
                mns <- data.frame(means=apply(distribution, 1, mean))
                mns$mu <- mu
                mns
            }
            data
        })
        
        
        output$meanPlot <- renderPlot({
            if (v$doPlot == FALSE) return()
            
            isolate({
                
                data <- dataR()

            hist(data[,1],
                main="Distribution of Sample Means vs. Theoretical Mean",
                breaks=30,
                xlab="Means",
                col="grey")  
            abline(v = data[1,2],   col = "red", lty = 1, lwd = 2)
            legend( "topright", c("Sample Mean", "Theoretical Mean"), fill = c("grey", "red"),)
                
                })
        })

output$Result <- renderText({
    if (v$doPlot == FALSE) return()
    isolate({
        return("The results shows the sample means are normally ditributed 
               and the mean of such distribution is approximately the approximately mean value (in red).")
    })
})



        

    }
)
