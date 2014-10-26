shinyApp: Quick Identification of Unknown Flowers
========================================================
author: Jacob Spangler
date: 26-Oct-2014

What is shinyApp?
========================================================

shinyApp is a quick and easy to use web-based tool that can predict iris species based on user-selected parameters.

How does it work?
========================================================

shinyApp uses machine learning on the availabe iris dataset to determine the most likely iris species based on the selected user parameters.

The iris dataset consists of 150 measurements across 3 species of iris (setosa, versicolor and virginica). Each of the species is similar in apparence, but has noticably different trends in size.

The available user defined parameters are:
* Sepal Length
* Sepal Width
* Petal Length
* Petal Width

Traits of Iris Dataset
========================================================

![plot of chunk unnamed-chunk-1](shinyApp_Pitch-figure/unnamed-chunk-1-1.png) 

***

![plot of chunk unnamed-chunk-2](shinyApp_Pitch-figure/unnamed-chunk-2-1.png) 

Overall Performance
========================================================

The random forest model used by shinyApp was able to get a test performance of 97.2% using a 75/25 split of the iris dataset. 

Github repository:

shinyApp Location: http://jbspangler.shinyapps.io/shinyApp
