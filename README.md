# MechaCar_Statistical_Analysis

## Linear Regression to Predict MPG

The image below shows the summary of the multiple regression analysis. The overall p-value for this analysis is 5.35e-11. Since this value is less than the cut-off value of 0.05, we reject the null and conclude that the slope of the regression model is non-zero.

The column labeled "Pr(>|t|)" displays the p-values for each variable. The cut-off value is 0.05, meaning 3 variables of the 6 rejected the null. These variables are the intercept, the vehicle length, and the ground clearance. This result means that the variance of these variables were too large to have happended just by chance. The variance in the intercept tells us that there is variation in the model that is not explained by the 5 independent variables; there may be other variables that could be correlated with mpg.

The inclusion of variables that are not statistically significant (vehicle weight, spoiler angle, an AWD) in the regression model could be causing our model to overfitt the sample data. In other words, our data will predict the mpg of novel data less accurately. It may be a good idea to remove these variables if this regression is to be used to predict mpg on new data.

The multiple R-squared tells us the overall fit the model has on the dataset. The value is 0.7149, which is considered a high correlation in most industries. In other words, the model performs well in predicting the mpg of MechaCar prototypes. However, this model would likely improve if the non-correlated variables were removed, even if it meant the r-squared value would decrease, because this way our model would perform better on novel data, not just the sample data used in this analysis. 

![regression](images/linear_regression_analysis.png)

