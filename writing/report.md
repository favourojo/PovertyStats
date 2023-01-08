##### Name(s) :
Hailey, Kyrie, Mariah, Favour

##### Date :
13 December 2021

##### Report Title :
# Differences in Rates of Poverty and Spending based on Gender (across African countries)

For our final project for Data Analytics, we originally had wanted to focus our project on Women and Pregnancy with a dataset that had data based on CDC-collected statistics for live births occurring within the United States to U.S. residents. However, after further research was done on the particular dataset, we soon realized there would not be able to conduct extensive analysis and form relationships among the data points. As a result, we would then have to select a new data set from the list of resources we were given, which also meant we would have to change our research focus.

The title of our new data set is **[Harmonized Male/ Female and Urban/Rural Subnational Expenditure, Poverty, and Inequality Indicators at 2011 PPP $1.90/dat and $3.10/day for Africa South of the Sahara]** (https://www.ifpri.org/publication/harmonized-malefemale-and-urbanrural-subnational-expenditure-poverty-and-inequality), coming from [Harvest Choice] (https://www.ifpri.org/project/harvestchoice). This dataset calculates poverty based on a ” comparison between household per-capita consumption expenditure and the $1.90 and $3.10/day poverty lines expressed in international equivalent purchasing power parity (PPP) dollars (in 2011)”.

With this new data set, we are looking to answer the question of how rates of poverty (poverty headcount ratio) and spending (food expenditures, and non food expenditures) differ based on gender across different African countries.

## Code Analysis

Before we created our code for our project, we first set up our common libraries. The libraries we utilized for this project were `tidyverse`, `psych`, and `ggplot2`. After doing that, we will select the correct file that contains the proper dataset. Then, we would need to load the data so that is present in our environment for future use. We then viewed the data to make sure that what we loaded was accurate. We then realized we would need to wrangle the data, so we can focus on specific variables in the data that are suitable for our project. We are also filtering out countries that have no data. We decided to focus on the years 2005 and 2012 when we conducted the survey analysis, since there was a good amount of countries with survey data in those years so we could compare as many countries to each other as possible. First, we determined what actual questions we wanted to ask of the data set. Because the data set was about poverty rates and expenditures across African countries, and provided data points that separated expenditures, poverty headcount ratios, and other related points of analysis based on gender. As a result, we create two variables for the 2005 analysis. First, we needed to create a new variable called data2005_Spending with necessary data points for looking at the rates of spending between men and women; we created the variable using the `select()` and `filter()` functions in order to wrangle our data more. The first question we asked concerning the data2005_Spending dataset was **How did monthly food expenditures differ between people of different genders and from different African countries in 2005?** We utilized ggplot to answer this question:

![2005 Monthly Food Expenditures](/writing/2005Rplot.png)

The red points in the plot represent the food expenditures made by those who identify as female and the blue points represent male respondents. As you can see in the graph, most people’s food expenditures in these countries do not exceed $75. Additionally, based on how the points are distributed, we can see that female respondents tend to spend more on food than male respondents. From this plot, we can conclude that women tend to spend more on food expenditures than men do. We believe this could coincide with African culture. In African culture, the role of a woman in a household is to cook the food, clean the house, and take care of the children, if there are any. It makes sense that African women do have the higher percentage when it comes to monthly food expenditures

The next question we looked to answer was **How did monthly non-food expenditures differ between people of different genders and from different African countries in 2005?**, in order to see if there are any differences between how much women and men spend on non-food items. We answered this question by creating a plot using ggplot, a

![2005 Monthly Non-Food Expenditures](/writing/Non-food2005.png)

This plot displays the Monthly Non-Food Expenditures for countries surveyed in 2005. The red points represent non-food expenditures made by those who identify as female and the blue points represent male respondents. As you can see in the graph, most people’s non-food expenditures in these countries did not exceed $125, with the majority of points below the $50 mark. Additionally, based on how the points are distributed, we can see that both male and female tend to spend about the same on monthly non-food expenditures, with Kenya showing that male respondents there tend to spend a little more on non-food expenditures than their female counterparts.


![2012 Monthly Food Expenditures](/writing/2012Rplot.png)


This plot displays the Monthly Food Expenditures for countries surveyed in 2012. The red points represent food expenditures made by those who identify as female and the blue points represent male respondents. As you can see in the graph, most people’s food expenditures in these countries do not exceed around $50-$75. However, the monthly food expenditure in Ghana exceeds $100. So, Ghana’s monthly food expenditure increased from 2005. Additionally, based on how the points are distributed, we can see that female respondents tend to spend more on food than male respondents.


![2012 Monthly Non-Food Expenditures](/writing/RplotNonFood.png)
This plot displays the Monthly Non-Food Expenditures for countries surveyed in 2012. The red points represent non-food expenditures made by those who identify as female and the blue points represent male respondents. As you can see in the graph, most people’s non-food expenditures in these countries did not exceed $100, with the majority of points below the $75 mark. Additionally, based on how the points are distributed, we can see that both male and female tend to spend about the same on monthly non-food expenditures, with Ghana showing that male respondents there tend to spend a little more on non-food expenditures than their female counterparts.

![2005 Poverty Headcount Ratio (%) by country](/writing/2005Headcount.png)
This plot displays the poverty headcount ratio by country for those countries surveyed in 2005. As you can see by the graph, Kenya has a larger range of values from 0-100%. Senegal and Ghana also have points that are dispersed between 25-80%, indicating that that percentage of the population is reported to be living at or below the international poverty line. Overall, we can see that all of these countries deal with varying degrees of poverty, which is indicated by some countries (like Ghana or Kenya) having higher reported cases of poverty than others.

![2012 Poverty Headcount Ratio (%) by country](/writing/2012Headcount.png)

This plot displays the poverty headcount ratio by country for those countries surveyed in 2012. As you can see by the graph, the plots are dispersed between every country except for the Democratic Republic of Congo. The Democratic Republic of Congo has a higher headcount ratio compared to the other countries. Also, there seems to be more men appearing than women, so men were more likely to be below the international poverty line than women are.

For our Multi-Year Analysis, we selected four different countries with survey data spanning several years, in order to see if there were any changes throughout the years to the three variables we have been studying throughout our analysis: monthly food expenditures, monthly non-food expenditures, poverty headcount ratio. Our countries of study were Ethiopia, Malawi, Madagascar, and Senegal and we studied them in a similar way to how we did our previous analysis, which looked at different countries with data in the same survey year.

For our analysis of Ethiopia, we first made a variable called dataEthiopia which we used to refine our dataset using filter() to only include data points representing Ethiopia. We then used ggplot, like our previous analysis, to answer three questions: 


- **How did monthly food expenditures between people of different genders in Ethiopia change between the years 2010 and 2012?** 
![Ethiopia Multi Year Analysis of Monthly Food Expenditures](/writing/multiyrEthiopia_Food.png)

 Based on this graph, we can see that in 2010, women seem to spend a little bit more on food than men, but in 2012, you see a shift in the points, indicating that men and women bought about the same, with men spending a little bit more than women on average on food expenditures.

- **How did monthly non-food expenditures differ between people of different genders in Ethiopia change between 2010 and 2012?**
![Ethiopia Multi Year Analysis of Monthly Non-Food Expenditures](/writing/multiyrEthiopia_NFood.png)

 Based on this graph, we can see that in 2010, women seem to spend more than men on non-food expenditures, but in 2012, like with food expenditures, we see that men tend to spend a little more than women, showing a shift from women doing the majority of the spending to men.

- **How did the poverty headcount ratio differ between people of different genders in Ethiopia change between 2000, 2010, 2012?**
![Ethiopia Multi Year Analysis of Monthly Food Expenditures](/writing/multiyrEthiopia_headct.png)

 Based on this graph, we can see that in 200, men and women were pretty evenly dispersed between 30-80% of those populations living below the poverty line. In 2010, we see that poverty rates have dropped for both men and women, with men showing a bigger rise in poverty rate, with the highest point being at 50%. Then in 2012, we see an increase in poverty rates for both men and women, with women representing the highest levels of poverty.

Malawi

- **How did monthly food expenditures between people of different genders in Malawi change between the years 2004 and 2010?** 
![Malawi Multi Year Analysis of Monthly Food Expenditures](/writing/multiyrMalawi_Food.png)

 Based on this graph, we can see that in 2004, men and women spend about the same amount of food, with most points lying between $0-$20/month, but in 2010, we see the spending range increase to $15-$70+/month.

- **How did monthly non-food expenditures differ between people of different genders in Malawi change between 2004 and 2010?**
![Malawi Multi Year Analysis of Monthly Non-Food Expenditures](/writing/multiyrMalawi_NFood.png)

 Based on this graph, we can see that in both 2004 and 2012, men tend to spend more on non-food expenditures. We can also see the range of expenditures change from being anywhere between $0-$30/month in 2004 and increasing to $0-$100/month in 2010.

- **How did the poverty headcount ratio differ between people of different genders in Malawi change between 1998, 2004, and 2010?**
![Malawi Multi Year Analysis of Monthly Food Expenditures](/writing/multiyrMalawi_headct.png)

 Based on this graph, we can see that across all of the years portrayed, that women tend to experience higher rates of poverty than men. In 1998, the range of people living under the poverty line was anywhere between 40% to 100%. In 2004, this range changes to 65%-100%. In 2010, you see the range experience a bit of a decrease, with points lying between 0%-95%.

Madagascar

- **How did monthly food expenditures between people of different genders in Madagascar change between the years 2001, 2005, and 2010?**
![Madagascar Multi Year Analysis of Monthly Food Expenditures](/writing/multiyrMadagascar_Food.png)

 In 2001, men seem to spend more than women on food, in 2005, both women and men seem to spend the same on food, and in 2010, women seem to spend a little bit more than men on average. We also see the ranges of  food expenditures change between the years with points lying between $20-$45/month in 2001, $25-$50/month in 2005, and $0-$48/month in 2010.

- **How did monthly non-food expenditures differ between people of different genders in Madagascar change between 2001, 2005, and 2010?**
![Madagascar Multi Year Analysis of Monthly Non-Food Expenditures](/writing/multiyrMadagascar_NFood.png)

 Based on the graph, it seems that women spend more than men on non-food expenditures across all survey years. Additionally, the range across all of the years plotted, has points lying between $0-$40, with a majority of points lying under $20/month for survey years 2001 and 2010.

- **How did the poverty headcount ratio differ between people of different genders in Madagascar change between 2001, 2005, and 2010?**
![Madagascar Multi Year Analysis of Monthly Food Expenditures](/writing/multiyrMadagascar_headct.png)

 Based on the graph, we can see that across all of the survey years, that men and women tend to have similar rates of poverty. in 2001 and 2005, points range from 0%-90% living below the poverty line and in 2010, the range shifts to 55%-100%.

Senegal

- **How did monthly food expenditures between people of different genders in Senegal change between the years 2001, 2005, and 2011?** 
![Senegal Multi Year Analysis of Monthly Food Expenditures](/writing/multiyrSenegal_Food.png)

 Based on the graph, we can see that across all survey years, women tend to spend more than men on food expenditures. In 2001, most points lied between the $10-$35/month, in 2005 this range shifted to $25-$50, and in 2011 it increased to $35-$60/month.

- **How did monthly non-food expenditures differ between people of different genders in Senegal change between 2001, 2005, and 2011?**
![Madagascar Multi Year Analysis of Monthly Non-Food Expenditures](/writing/multiyrSenegal_NFood.png)

Based on the graph, we can see that across all survey years, women tend to spend more than men on non-food expenditures. Across all the years plotted, the majority of points for these expenses was anywhere between $5-$45/month range.


- **How did the poverty headcount ratio differ between people of different genders in Senegal change between 2001, 2005, and 2011?**
![Madagascar Multi Year Analysis of Monthly Food Expenditures](/writing/multiyrSenegal_headct.png)

Based on this graph, we can see that across all survey years, men tend to experience higher rates of poverty than women. The range of poverty in 2001 was anywhere between 45%-100%, in 2005 was anywhere 5%-80%, and in 2011 was anywhere between 0%-75% of the population living below the poverty line.

# Conclusion

Based on the graphs, women spend more money on monthly food expenditures than men do. Additionally, males and females spend the same amount of money on non food expenditures.  Based on the poverty headcount ratio graph, men are more likely to be below the international poverty line than women are. The multi-year analysis we completed for Ethiopia, Malawi, Madagascar, and Senegal all showed varying results, all showing improvements in the poverty rate and increases in both food and non-food expenditures. There were also shifts of influence from some spending being male dominated and shifting to being female dominated and vice versa, which is further detailed under each of the respective plots in the prior section.




(Did you remember to add your name(s) to the top of this document?)
