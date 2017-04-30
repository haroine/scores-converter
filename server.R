function(input, output) {
  
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
      
      output$sport1img <- renderImage(renderSportImageIcon(other_sports[1]), deleteFile = FALSE)
      output$sport2img <- renderImage(renderSportImageIcon(other_sports[2]), deleteFile = FALSE)
      output$sport3img <- renderImage(renderSportImageIcon(other_sports[3]), deleteFile = FALSE)
      
      output$namesport1 <- renderText(capitalize(other_sports[1]))
      output$namesport2 <- renderText(capitalize(other_sports[2]))
      output$namesport3 <- renderText(capitalize(other_sports[3]))
      
      output$scoreSport1 <- renderText(displayScore(list_scores[[1]]))
      output$scoreSport2 <- renderText(displayScore(list_scores[[2]]))
      output$scoreSport3 <- renderText(displayScore(list_scores[[3]]))
      
      # paste(other_sports, list_scores)
      paste(" ")
    }
    
  })
  
}