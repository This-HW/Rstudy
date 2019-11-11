library(shiny)

shinyUI(fluidPage(
  
  titlePanel("first app"),
  
  sidebarLayout(
    sidebarPanel(h2("다양한 텍스트들")),
    
    mainPanel(  # 머리글 관련 함수 사용 예 
      h6("Sixth level header title", align = "center"),
      h5("Fifth level header title", align = "center"),
      h4("Fourth level header title", align = "center"),
      h3("Third level header title", align = "center"),
      h2("Second level header title", align = "center"),
      h1("First level header title"),
      
      p("p creates a paragraph of text."),
      p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph.", style = "font-family: 'times'; font-si16pt"),
      strong("strong() makes bold text."),
      em("em() creates italicized (i.e, emphasized) text."),
      br(),
      code("shiny package in memory function - library(shiny)"),
      div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
      br(),
      p("span does the same thing as div, but it works with",
        span("groups of words", style = "color:blue"),
        "that appear inside a paragraph."),
      
      img(src="r.png", height = 300, width = 600)
      
    )
  )
))
