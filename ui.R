fluidPage(
  titlePanel("Sports scores converter"),
  column(12,
         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc feugiat orci nec dignissim facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at ornare eros. Proin bibendum, nunc vel pellentesque dictum, erat eros elementum augue, non sodales elit est vitae est. Phasellus quis nulla ultrices, lacinia nulla non, luctus nibh. Proin eget mattis tellus, sed porta ante. Integer vel dapibus felis, sed scelerisque diam. Quisque pellentesque euismod imperdiet. Nam laoreet, justo et dapibus ultricies, ipsum nisl facilisis eros, sed vulputate velit sem vitae diam. Donec imperdiet interdum felis et consequat. Ut nec consectetur augue. Donec eleifend lobortis tortor, id consectetur purus posuere a."
  ,style="margin:20px;"),
  sidebarLayout(
  sidebarPanel(
      selectInput("sport", "Choose a sport:",
                  choices = named_available_sports
                  ),
      imageOutput("sportimg",height = paste0(sizeSportImage,"px")),
      div(
        div(textInput("score_home", "Home", "", width = "50px"),style="display:inline-block; vertical-align:top;"),
        div(" - ",style="display:inline-block; vertical-align:top;"),
        div(textInput("score_away", "Away", "", width = "50px"),style="display:inline-block; vertical-align:top;"),
        style="display: block; margin-left: auto; margin-right: auto;"
      ),
      br(),
      actionButton("refreshButton", "Refresh",
                   style="text-align: center;"),
      style="text-align: center; display: block;"
  ),
  mainPanel(
    div(
             h3("Equivalent in other sports:"),br(),
             div(
               div(
                      div(imageOutput("sport1img"),style="display:inline-block; vertical-align:top;"),
                      div(textOutput("namesport1"),style="display:inline-block; vertical-align:top; font-size:130%; margin: 10px;"),
                      div(textOutput("scoreSport1"),style="display:inline-block; vertical-align:top; font-size:130%; margin: 10px;")
                ,style="margin: 10px; display: block; text-align: left; margin:auto; height: 50px;"),
               div(
                      div(imageOutput("sport2img"),style="display:inline-block; vertical-align:top;"),
                      div(textOutput("namesport2"),style="display:inline-block; vertical-align:top; font-size:130%; margin: 10px;"),
                      div(textOutput("scoreSport2"),style="display:inline-block; vertical-align:top; font-size:130%; margin: 10px;")
                ,style="margin: 10px; display: block; text-align: left; margin:auto; height: 50px;"),
               div(
                      div(imageOutput("sport3img"),style="display:inline-block; vertical-align:top;"),
                      div(textOutput("namesport3"),style="display:inline-block; vertical-align:top; font-size:130%; margin: 10px;"),
                      div(textOutput("scoreSport3"),style="display:inline-block; vertical-align:top; font-size:130%; margin: 10px;")
                ,style="margin: 10px; display: block; text-align: left; vertical-align:center; margin:auto;")
             , style="margin: 10px; display: block; text-align: left; margin:auto; height: 50px;"),
             textOutput("sports")
      ,style="margin: 10px; display: block; text-align: left; margin:auto;")
    )
  )
)