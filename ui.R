fluidPage(
  titlePanel("Sports scores converter"),
  column(11,
         "This webapp finds an equivalent for any game score in other sports with a statistical rule, using data from NBA, NHL, NFL and Champions League games since the year 2000. The full code of the project is available on ",
          a(href="https://github.com/haroine/scores-converter","a github page"),
          "You can find out more about it works on ",
          a(href="http://nc233.com/2017/05/a-shiny-app-to-convert-sports-scores/","this blog post"),
          ". Want to see other sports in this app? Make",
         a(href="https://github.com/haroine/scores-converter/pulls","a pull request"),
          "or ping us ",
          a(href="https://twitter.com/nc233","on twitter"),
         "or ",
          a(href="https://framapiaf.org/@nc233","Mastodon"),
          "!"
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