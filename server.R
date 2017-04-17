function(input, output) {
  
  # output$testimg <- renderUI({
  #   img(src="test.jpg", width = 20,
  #       style = "display: block; margin-left: auto; margin-right: auto;")
  # })
  
  output$sportimg <- renderImage({
    
    renderSportImage(sportInput())
  }, deleteFile = FALSE)
  
  sportInput <- reactive({
    input$sport
  })
  
  homeScore <- reactive({
    input$refreshButton
    isolate(input$score_home)
  })
  
  awayScore <- reactive({
    input$refreshButton
    isolate(input$score_away)
  })

  output$sports <- renderText({
    
    # Make the reactive renderText depend on the refresh button
    input$refreshButton
    
    home_score <- as.numeric(homeScore())
    away_score <- as.numeric(awayScore())
    
    if(!is.na(home_score) && !is.na(away_score)) {
      other_sports <- available_sports[available_sports!=sportInput()]
      list_scores <- get_equivalent_scores_all(
        c(home_score,away_score),
        sportInput())
      
      paste(list_scores) ##TODO: function to paste other sports scores
    }
    
  })
  
}