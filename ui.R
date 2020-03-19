## This is an app for the "Developing Data Products" course project 

library(shiny)

shinyUI(
    
    fluidPage
    (
    h4("The graphics show the evolution of the new COVID-19 in China, Spain and Italy"),
        h6("Source: https://ourworldindata.org/coronavirus-source-data"),
        h6(""),
        h6("NOTE: Graphs are logarithmically scaled"),
    plotOutput("plot",  width = "100%"),
    fluidRow
    (
        column(3, offset = 1,
               h4("Select country"),
            checkboxInput("showChina", "China", value = FALSE),
            checkboxInput("showSpain", "Spain", value = FALSE),
            checkboxInput("showItaly", "Italy", value = FALSE),
        ),
        
        column(1, offset = 2,
               h6("China",style="color:red"),h6("Spain",style="color:blue"),h6("Italy",style="color:green")
        ),
       
        column(3, offset = 2,
               h4("Select type of graph"),
            selectizeInput("type", "", choices = c("new_cases", "new_deaths", "total_cases", "total_deaths")),
        )    
    
    )
    
    )
)