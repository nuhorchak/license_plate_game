library(tidyverse)
library(readxl)
library(plotly)
library(choroplethr)


df <- read_excel("C:/Users/NickUhorchak/Desktop/carolines_states_plates.xlsx", na = "0")

df$hover <- with(df, paste(State, '<br>', "Count", Count))

g <- list(
  scope = 'usa',
  showlakes = TRUE
)

fig <- plot_geo(df, locationmode = 'USA-states')

fig <- fig %>% add_trace(
  z = ~Count, text = ~hover, locations = ~code,
  color = ~Count, colors = 'Purples'
)
fig <- fig %>% colorbar(title = "License Plate Count")
fig <- fig %>% layout(
  title = 'License Plates from the Georgia Trip<br>(Hover for breakdown)',
  geo = g
)
fig
