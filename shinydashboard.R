library(shiny)
library(shinydashboard)
ui=fluidPage(
  dashboardPage(skin = "green",dashboardHeader(title="Icon demo",titleWidth=600),
                dashboardSidebar("This is the sidebar",
                                 sidebarMenu(
                                   menuItem("Dashboard",tabName = "dashboard",
                                            icon=icon("tachometer")),
                                   menuItem("Dashboard2",tabName = "dashboard2",
                                            icon=icon("tachometer",class = "fl-lg")),
                                   menuItem("Dashboard3",tabName = "dashboard3",
                                            icon = icon("tachometer",class ="fa-rotate-90")),
                                   menuItem("Setting1",tabName ="setting1",
                                            icon =icon("cog",class ="fa-spin")),
                                   menuItem("Setting2", tabName= "setting2",
                                            icon=icon("cog",class = "fa-pulse")),
                                   menuItem("Setting3", tabName= "setting3",
                                            icon=icon("cog",class="fa-border")),
                                   menuItem("Hourglass",tabName = "hourglass",
                                            icon = icon("hourglass",lib = "glyphicon")),
                                   menuItem("BoxStatus",tabName ="boxstatus",
                                            icon=icon("square")),
                                   menuItem("BoxColor",tabName = "boxcolor",
                                            icon = icon("square",class="mystyle")),
                                   menuItem("infoBox",tabName = "IB"),
                                   menuItem("valueBox",tabName = "VB"),
                                   tags$style(".mystyle{color:yellow;")
                                 )
                                 
                ),
                dashboardBody(
                  tabItems(
                    tabItem(tabName = "IB",
                            fluidRow(infoBoxOutput("min_",width = 3),infoBoxOutput("max_",width = 3),infoBoxOutput("sd_",width = 3),infoBoxOutput("mean_",width = 3),
                                     fluidRow(infoBoxOutput("median_",width = 6)),
                                     fluidRow(infoBoxOutput("inline"),tags$style("#inline {height:75px; line-height75px: padding-top:0px; padding-bottom:0px; width:400px;}"))
                            ))
                              )
                            )
                            
                    )
                  )
                
  


s=sample(100:500,50)

server=function(input,output, session){
  
  output$min_=renderInfoBox({
    infoBox(title = "Minm",
            value = min(s),
            subtitle = "minimum value in dataset",
            fill = TRUE)
  })
  output$max_=renderInfoBox({
    infoBox(title = "Maxm",
            value = max(s),
            subtitle = "maximum value in dataset",fill = TRUE,color = "yellow")
    
  })
  output$sd_=renderInfoBox({
    infoBox(title = "SD",
            value = round(sd(s),2),
            subtitle = "standard deviation",icon("arrow-up"))
  })
  output$mean_=renderInfoBox({
    infoBox(title = "Mean",
            value = mean(s),
            subtitle = "mean of the dataset values",icon = icon("angle-double-right"))
  })
  output$median_=renderInfoBox({
    infoBox(title = tags$b("median"),
            value = median(s),
            subtitle = tags$i("median of dataset"),
            icon = icon("angle-double-right"))
  })
  
  output$min_=renderValueBox({
    valueBox(
      value = min(s),
      subtitle = "minimum value in dataset"
    )
  })
  output$max_=renderValueBox({
    valueBox(
      value = max(s),
      subtitle = "maximum value in dataset",fill = TRUE,color = "yellow")
    
  })
  output$sd_=renderValueBox({
    valueBox(
      value = round(sd(s),2),
      subtitle = "standard deviation",icon("arrow-up"),color = "yellow")
  })
  output$mean_=renderValueBox({
    valueBox(
      value = mean(s),
      subtitle = "mean of the dataset values",icon = icon("angle-double-right"),
      color="purple")
  })
}

shinyApp(ui=ui,server=server)
