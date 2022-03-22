#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinymaterial)

function(input, output) {
    
    output$mtcars_plot <- renderPlot({
        plot_output <- 
            ggplot(
                mtcars,
                aes(
                    x = hp,
                    y = mpg
                )
            ) +
            xlab("Horse Power") + 
            ylab("Miles Per Gallon") + 
            geom_point() +
            theme(
                text = element_text(size = 16)
            )
        
        if(input$facet_cyl){
            plot_output <-
                plot_output + 
                facet_wrap(
                    "cyl"
                )
        }
        
        if(input$trend_line){
            plot_output <- 
                plot_output + 
                stat_smooth(
                    method = "lm",
                    se = FALSE
                )
        }
        
        if(input$plot_theme == "light"){
            plot_output <- 
                plot_output + 
                theme_light(base_size = 20)
        } else if(input$plot_theme == "dark"){
            plot_output <-
                plot_output + 
                theme_dark(base_size = 20)
        }
        
        plot_output
    })
}