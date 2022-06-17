# November 16
# Interactive chats using plotly with ggplot2
# Resources:
# plotly: https://www.plotly.com/r
# plotly with ggplot2: https://www.plotly.com/ggplot2

install.packages("ggplot2")
install.packages("plotly")
install.packages("htmlwidgets")
library(ggplot2)
library(plotly)
library(htmlwidgets)

df_cars <- data.frame(mtcars)

pl1 <- ggplot(df_cars, aes(mpg, wt, col = wt, size = wt)) + 
  geom_point() + 
  # geom_smooth(method = lm, se = F) +
  labs(title = "Weight vs Miles per Gallon", subtitle = "mtcars data", y = "Miles per Gallon", x = "Weight") +
  theme(plot.background = element_rect('lightblue', color = 'darkblue'))
  # theme_gray() +
  # geom_label(aes(label = rownames(df_cars), col=cyl), angle = 30, check_overlap = T, size = 2, nudge_x = 1)

pl1

# make it interactive with plotly
pl1_int <- ggplotly(pl1)
pl1_int


# modify hover information 
plt2 <- pl1 <- ggplot(df_cars, aes(mpg, wt, col = wt, size = wt)) + 
  geom_point(aes(text = paste('Weight:', wt, '\nMPG:', mpg))) + 
  labs(title = "Weight vs Miles per Gallon", subtitle = "mtcars data", y = "Miles per Gallon", x = "Weight") +
  theme(plot.background = element_rect('lightblue', color = 'darkblue'))
plt2

plt2_int <- ggplotly(plt2, tooltip = 'text')
plt2_int

# save as html use the interface
saveWidget(plt2_int, '11.15/WebPlot', selfcontained = F)
