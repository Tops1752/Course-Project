library(ggplot2)





shinyServer(
    function(input, output) {
      
      output$distPlot <- renderPlot({
        mu <- input$mn
        sd <- input$sd
        
        distSample <- NULL
        if(input$dist == "unif"){
          distSample <- sample(mu,1000,TRUE)
          dat = data.frame(num = distSample)
          ggplot(dat,aes(num)) +
            geom_density(aes(y=..density..)) + 
            ggtitle("Sample Data")
          
        } 
        else if(input$dist == "norm"){
          distSample <- rnorm(1000,mu,sd)
          ggplot(dat,aes(num)) +
            geom_density(aes(y=..density..)) + 
            ggtitle("Sample Data")
          
        } 
        else{
          distSample <- rexp(1000,1/mu)
          dat = data.frame(num = distSample)
          ggplot(dat,aes(num)) +
            geom_density(aes(y=..density..)) + 
            ggtitle("Sample Data")
        }
      })
      
      
      
#         output$newHist <- renderPlot({
#             hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
#             mu <- input$mu
#             lines(c(mu, mu), c(0, 200),col="red",lwd=5)
#             mse <- mean((galton$child - mu)^2)
#             text(63, 150, paste("mu = ", mu))
#             text(63, 140, paste("MSE = ", round(mse, 2)))
#         })
    }
)