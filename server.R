library(ggplot2)

shinyServer(
    function(input, output) {
      
        ## show an example of how the sample data look like
      output$distPlot <- renderPlot({
        mu <- input$mn
        sd <- input$sd
        
        distSample <- NULL
        if(input$dist == "pois"){
          distSample <- rpois(1000,mu)
          dat = data.frame(num = distSample)
          ggplot(dat,aes(num)) +
            geom_density(aes(y=..density..)) + 
            ggtitle("Example of Sample Data")
          
        } 
        else if(input$dist == "norm"){
          distSample <- rnorm(1000,mu,sd)
          dat = data.frame(num = distSample)
          ggplot(dat,aes(num)) +
            geom_density(aes(y=..density..)) + 
            ggtitle("Example of Sample Data")
          
        } 
        else{
          distSample <- rexp(1000,1/mu)
          dat = data.frame(num = distSample)
          ggplot(dat,aes(num)) +
            geom_density(aes(y=..density..)) + 
            ggtitle("Example of Sample Data")
        }
      })
      
      output$meanPlot <- rederPlot({
          input$run
          
          n <- input$n
          times <- input$round
          
          mu <- input$mn
          sd <- input$sd
          
          set.seed(234)
          
          distribution <- NULL
          
          if(input$dist == "pois"){
              distribution <- matrix(data=rpois(n * times,mu), nrow=times)
          }
          
          else if(input$dist == "norm"){
              distribution <- matrix(data=rnorm(n * times, mu,sd), nrow=times)
          }
          
          else{
              distribution <- matrix(data=rexp(n * times, 1/mu), nrow=times)
          }
          
          mns <- data.frame(means=apply(distribution, 1, mean))
          
          ggplot(mns,aes(means)) + 
              geom_histogram(aes(y=..density..,colour = "Sample Mean")) +
              geom_vline(aes(xintercept = mu, colour = "Theoretical Mean")) +
              scale_colour_manual(name="",values=c("Sample Mean"="grey","Theoretical Mean"="red")) + 
              ggtitle("Distribution of Sample Means vs. Theoretical Mean")
          
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