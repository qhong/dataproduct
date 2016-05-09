library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Calculators: Life Expectancy"),
    sidebarPanel(
        numericInput('weight', 'Weight/kg', value = 50, min = 4, max = 300, step = 0.5),
        numericInput('hight', 'Hight/cm', value = 160, min = 20, max = 240, step = 1),
        radioButtons('ex', 'Frequency of Exercise', c('Less than once a week' = 0, 'Once a week' = 1, 
                                                            'Twice a week' = 2, 'Three times a week' = 3,
                                                            'More than three times a week' = 4)),
        dateInput('db', 'Date of Birth'),
        actionButton("goButton", "Submit"),
        helpText('Note: This application is for training purpose only.')
        
    ),
    mainPanel( 
        p('Current Age'),
        textOutput('age'),
        
        p('BMI'),
        textOutput('bmi'),
        
        p('Life Expectancy'),
        textOutput('exp')
        
    )
))