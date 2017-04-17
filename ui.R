fluidPage(
  titlePanel("Sports scores converter"),
  "Text",
  fluidRow(
    column(8, wellPanel(
      selectInput("sport", "Choose a sport:", 
                  choices = named_available_sports
                  ),
      imageOutput("sportimg",height = paste0(sizeSportImage,"px")),
      div(
        textInput("score_home", "Home", "", width = "50px"),
        textInput("score_away", "Away", "", width = "50px"),
        style="display: block; margin-left: auto; margin-right: auto;"
      ),
      br(),
      actionButton("refreshButton", "Refresh",
                   style="text-align: center;"),
      style="text-align: center; display: block;"
    )),
    # column(8,
    #        textInput("score_home", "Home", "", width = "50px"),
    #        textInput("score_away", "Away", "", width = "50px")
    # ),
    # column(8,
    #        br(),
    #        actionButton("refreshButton", "Refresh")
    # ),

    column(8,
           h4("In other sports:"),
           textOutput("sports")
    )
    # column(8,
    #        textOutput("sports2")
    #        # h4("summary2"),
    #        # textOutput("summary2")
    # )
    )
)