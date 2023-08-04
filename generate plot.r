library(tidyverse)
tibble(
  x = c("Next to me,\nscreen up, sound on",   
"Next to me, screen down,\nsound off" ,
"In another room"     	            ),
y = c(81, 83, 84)
) %>% 
mutate(x = fct_inorder(x),y = y /100) %>%
ggplot(aes(x, y)) +
geom_col() +
geom_text(aes(label = scales::percent(y)), vjust = -0.5) +
# show only between 60 and 90
coord_cartesian(ylim = c(.75, .85)) +
scale_y_continuous(labels = scales::percent, breaks = seq(.75, .85, .02)) +
labs(x = "", y = "Grade Point Average", title = "Results from a study of more than a thousand\namerican high-school students")
ggsave("gpa.png", width = 6, height = 4, units = "in")

