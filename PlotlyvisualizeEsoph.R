library(plotly)
library(tidyverse)

str(esoph)

sum(esoph$ncases)
sum(esoph$ncontrols)

plot_ly(x = esoph$agegp, type = "histogram")

esoph_tibble <- esoph %>% as_tibble() %>% mutate(
  percentage_cases = ncases /(ncases + ncontrols) # convert to percentage 
)

#alcohol
plot_ly(esoph_tibble, x = ~agegp, y = ~percentage_cases, type = "scatter", color = ~alcgp, size = ~ncases)

#tobacco
plot_ly(esoph_tibble, x = ~agegp, y = ~percentage_cases, type = "scatter", color = ~tobgp, size = ~ncases)

#3D
plot_ly(esoph_tibble, x = ~alcgp, y = ~tobgp, z = ~percentage_cases, type = "scatter3d", color = ~agegp)
 