library(shiny)
library(shinythemes)
library(shinydashboard) # For a more structured dashboard layout

# Sample Data (Replace with well-researched information)
effects_colon <- data.frame(
  Symptom = c("Fatigue", "Nausea", "Diarrhea"),
  Recommendation = c("Manage rest and activity", "Dietary changes, anti-nausea medication", "Hydration, medication")
)

effects_breast <- data.frame(
  Symptom = c("Pain", "Lymphedema", "Hair loss"),
  Recommendation = c("Medication, warm compresses", "Physical therapy, compression", "Head coverings, scalp care")
)

effects_lung <- data.frame(
  Symptom = c("Shortness of breath", "Cough", "Fatigue"),
  Recommendation = c("Breathing techniques, medication", "Cough suppressants, expectorants", "Energy conservation") 
)

# UI Definition
ui <- dashboardPage(
  dashboardHeader(title = "Symptom & Side Effect Management"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Colon & Rectal Cancer", tabName = "colon", icon = icon("medkit",  lib = "font-awesome")),
      menuItem("Breast Cancer", tabName = "breast", icon = icon("heart", lib = "font-awesome")),
      menuItem("Lung Cancer", tabName = "lung", icon = icon("lungs", lib = "font-awesome"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "colon", 
              style = "background-color: #e8f5e9;", # Light green
              fluidRow(
                box(imageOutput("colon_image", height = "200px")), # Image Placeholder
                box(title = "Recommendations", dataTableOutput("colon_table")) 
              )
      ),
      tabItem(tabName = "breast", 
              style = "background-color: #ffebee;", # Light pink
              fluidRow(
                box(imageOutput("breast_image", height = "200px")), # Image Placeholder
                box(title = "Recommendations", dataTableOutput("breast_table")) 
              )
      ),
      tabItem(tabName = "lung", 
              style = "background-color: #e1f5fe;", # Light blue
              fluidRow(
                box(imageOutput("lung_image", height = "200px")), # Image Placeholder
                box(title = "Recommendations", dataTableOutput("lung_table")) 
              )
      )
    )
  )
)

# Server Logic
server <- function(input, output) {
  output$colon_table <- renderDataTable(effects_colon)
  output$breast_table <- renderDataTable(effects_breast) # Add for other tabs
  output$lung_table <- renderDataTable(effects_lung)   # Add for other tabs
  
  # Image display (you'll need to find and place images)
  output$colon_image <- renderImage({
    filename <- normalizePath(file.path("./images", "colon_support.png")) # Adjust filename
    list(src = filename, contentType = "image/png", height = 200) 
  }, deleteFile = FALSE) 
}

# Run the App
shinyApp(ui = ui, server = server)