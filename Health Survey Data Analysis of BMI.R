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

nhanes_adult <- nhanes_design%>%
  subset(Age >=20)

summary(nhanes_adult)

nrow(nhanes_design)
nrow(nhanes_adult)

bmi_mean_raw <- NHANESraw %>% 
  filter(Age >= 20) %>%
  summarize(mean(BMI, na.rm = TRUE))
bmi_mean_raw

bmi_mean <- svymean(~BMI, design = nhanes_adult, na.rm = TRUE)
bmi_mean

NHANESraw %>% 
  filter(Age >= 20) %>%
  ggplot(mapping=aes(x=BMI, weight=WTMEC4YR)) + 
  geom_histogram()+
  geom_vline(xintercept = coef(bmi_mean), color="red")

library(broom)

NHANESraw %>% 
  filter(Age>=20) %>%
  ggplot(mapping=aes(x=PhysActive, y= BMI, weight=WTMEC4YR))+
  geom_boxplot()

survey_ttest <- svyttest(BMI~PhysActive, design = nhanes_adult)

tidy(survey_ttest)

phys_by_smoke <- svyby(~PhysActive, by = ~SmokeNow, 
                       FUN = svymean, 
                       design = nhanes_adult, 
                       keep.names = FALSE)

phys_by_smoke

ggplot(data = phys_by_smoke, aes(SmokeNow, PhysActiveYes, fill = SmokeNow)) +
  geom_col()+
  ylab("Proportion Physically Active")