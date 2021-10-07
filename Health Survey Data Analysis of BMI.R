library(NHANES)
library(dplyr)

data("NHANESraw")

glimpse(NHANESraw)

library(ggplot2)

NHANESraw <- NHANESraw %>% 
  mutate(WTMEC4YR = WTMEC2YR/2)

NHANESraw %>% summarize(total_WTMEC4YR = sum(WTMEC4YR))

ggplot(NHANESraw, aes(x=Race1, y=WTMEC4YR))+
  geom_boxplot()

library(survey)

nhanes_design <- svydesign(
  data = NHANESraw,
  strata = ~SDMVSTRA,
  id = ~SDMVPSU,
  nest = TRUE,
  weights = ~WTMEC4YR)

summary(nhanes_design)