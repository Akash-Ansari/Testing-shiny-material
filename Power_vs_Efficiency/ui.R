#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinymaterial)
library(tidyverse)

material_page(
    title = "shinymaterial",
    tags$br(),
    material_row(
        material_column(
            width = 2,
            material_card(
                title = "",
                depth = 4,
                tags$p("By Cylinder"),
                material_switch(
                    input_id = "facet_cyl",
                    off_label = "No",
                    on_label = "Yes",
                    initial_value = TRUE
                ),
                tags$p("Include Trend Line"),
                material_switch(
                    input_id = "trend_line",
                    off_label = "No",
                    on_label = "Yes"
                ),
                material_radio_button(
                    input_id = "plot_theme",
                    label = "Theme",
                    choices = 
                        c("Light" = "light",
                          "Dark" = "dark")
                )
            )
        ),
        material_column(
            width = 9,
            material_card(
                title = "Power vs Efficiency",
                depth = 4,
                plotOutput("mtcars_plot")
            )
        )
    )
)