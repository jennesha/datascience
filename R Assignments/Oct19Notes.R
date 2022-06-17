# October 19 2021
# Working with plots

# dataset: mtcars

install.packages("ggplot2")
library(ggplot2)

# Dataframe for cars dataset
df_cars <- data.frame(mtcars)

# Using ggplot2
ggplot(df_cars, aes(mpg, wt)) + 
  geom_point() + 
  geom_smooth(method = lm, se = F) +
  labs(title = "Weight vs Miles per Gallon", subtitle = "mtcars data", x = "Miles per Gallon", y = "Weight") +
  theme_gray() +
  geom_label(aes(label = rownames(df_cars), col=cyl), angle = 30, check_overlap = T, size = 2, nudge_x = 1)

ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point()

ggplot(df_cars, aes(x=cyl, , fill = as.factor(gear)))) +
  geom_bar(position = "dodge") +
  scale_x_continuous(breaks = df$cyl) +
  scale_fill_viridis_d() +
  facet_wrap(df$cyl) +
  theme_light()



