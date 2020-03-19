# This is an app for the "Developing Data Products" course project 

library(shiny)
library (RCurl)
library(data.table)

options(shiny.maxRequestSize = 10 * 1024^2)

shinyServer(function(input, output) 
{
        data <- read.csv("https://covid.ourworldindata.org/data/full_data.csv")
        
        spain <- data[data$location == "Spain",]
        china <- data[data$location == "China",]
        italy <- data[data$location == "Italy",]
    
        spain[is.na(spain)] <- 0
        china[is.na(china)] <- 0
        italy[is.na(italy)] <- 0
        
        # I can add 1 because I will do the log()
        spain[, 3:6] <- spain[, 3:6] + 1
        china[, 3:6] <- china[, 3:6] + 1
        italy[, 3:6] <- italy[, 3:6] + 1
        
        spain$date <- as.Date(spain$date)
        china$date <- as.Date(china$date)
        italy$date <- as.Date(italy$date)
    
    
output$plot <- renderPlot({ plot(china$date, log(china$new_cases), type = "n", col = "red", 
         xlab = "", ylab = "", yaxt="n", lty = 3, main = "") })
    
output$plot <- renderPlot({
    
    if (input$type == "new_cases")
    {
        plot(china$date, log(china$new_cases), type = "n", col = "red", 
             xlab = "", ylab = "", yaxt="n", lty = 3, main = "")
        
        if (input$showChina)
        {
            lines(china$date, log(china$new_cases), type = "l", col = "red", lwd = 3)
        }   
        if (input$showSpain)
        {
            lines(spain$date, log(spain$new_cases), type = "l", col = "blue", lwd = 3)
        }
        if (input$showItaly)
        {
            lines(italy$date, log(italy$new_cases), type = "l", col = "green", lwd = 3)
        }
    }
    
    if (input$type == "new_deaths")
    {
        plot(china$date, log(china$new_deaths), type = "n", col = "red", 
             xlab = "", ylab = "", yaxt="n", lty = 3, main = "")
        
        if (input$showChina)
        {
            lines(china$date, log(china$new_deaths), type = "l", col = "red", lwd = 3)
        }   
        if (input$showSpain)
        {
            lines(spain$date, log(spain$new_deaths), type = "l", col = "blue", lwd = 3)
        }
        if (input$showItaly)
        {
            lines(italy$date, log(italy$new_deaths), type = "l", col = "green", lwd = 3)
        }       
    }
    if (input$type == "total_cases")
    {
        plot(china$date, log(china$total_cases), type = "n", col = "red", 
             xlab = "", ylab = "", yaxt="n", lty = 3, main = "")
        
        if (input$showChina)
        {
            lines(china$date, log(china$total_cases), type = "l", col = "red", lwd = 3)
        }   
        if (input$showSpain)
        {
            lines(spain$date, log(spain$total_cases), type = "l", col = "blue", lwd = 3)
        }
        if (input$showItaly)
        {
            lines(italy$date, log(italy$total_cases), type = "l", col = "green", lwd = 3)
        }       
    }
    if (input$type == "total_deaths")
    {
        plot(china$date, log(china$total_deaths), type = "n", col = "red", 
             xlab = "", ylab = "", yaxt="n", lty = 3, main = "")
        
        if (input$showChina)
        {
            lines(china$date, log(china$total_deaths), type = "l", col = "red", lwd = 3)
        }   
        if (input$showSpain)
        {
            lines(spain$date, log(spain$total_deaths), type = "l", col = "blue", lwd = 3)
        }
        if (input$showItaly)
        {
            lines(italy$date, log(italy$total_deaths), type = "l", col = "green", lwd = 3)
        }       
    }

})
 
})
