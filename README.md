## NHANES Health Survey Data Analysis of BMI
In this analysis, I analyzed survey data of 20,000 people sampled from the United States to explore health behaviors associated with lower Body Mass Index (BMI), a standardized measure of healthy weight and obesity.

## Research Questions
- What is the association between physical activity and BMI among people in the United States?
- Is BMI lower in physically active people?
- Is smoking a confounding factor to BMI ranges?

## Dataset
This analysis uses the [National Health and Nutrition Examination Survey](https://www.cdc.gov/nchs/nhanes/index.htm) [(NHANES)](https://www.cdc.gov/nchs/nhanes/index.htm) data from ~20,000 participants surveyed in years 2009-2012 found in the [NHANES R package](https://www.rdocumentation.org/packages/NHANES/versions/2.1.0/topics/NHANES).

## Research Method
Survey weighted multiple and logistic regression in R

## Insights
1. Whites are undersampled and have higher weights. While Black, Mexican, Hispanic people are oversampled and have lower weights since each sampled person in these minority groups represents fewer US people.
<img width="642" alt="Box plot" src="https://user-images.githubusercontent.com/31772140/136316458-c3aa1b5d-94e0-4fb5-8ebb-4454fe8b7905.png">

2. The average BMI in the US adult population is 28.73.
<img width="640" alt="Histogram" src="https://user-images.githubusercontent.com/31772140/136318006-ac1c7a81-41c9-4aa9-8724-d2fa6bedae7b.png">

3. The distribution of BMI differ between people who are physically active versus those who are not physically active. We can see this association when we compare BMI with a boxplot and formally test for a difference in mean BMI.
![Association](https://user-images.githubusercontent.com/31772140/136319115-9a68a44a-e899-4808-91f9-d3c952459705.png)
