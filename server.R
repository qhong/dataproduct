library(shiny)
life.exp <- function(wt,ht,db, ex){
    bmi <- wt/(ht/100)^2
    age <- as.numeric(round((Sys.Date()-db)/365,1))
    exp.age <- 90-abs(21.5- bmi)^1.5 + as.numeric(ex)*1.6
    out <- list(BMI = format(bmi,digit = 0), Age = age, Exp = format(exp.age, digit = 0))
    return(out)
}


shinyServer(
    function(input, output) {
        data <- reactive({
            input$goButton
            isolate(life.exp(input$weight,input$hight,input$db,input$ex))})
        output$bmi <- renderText({
            input$goButton
            isolate(data()$BMI)
            })
        output$age <- renderText({
            input$goButton
            isolate(data()$Age)
            })
        output$exp <- renderText({
            input$goButton
            isolate(data()$Exp)
            })
    }
)