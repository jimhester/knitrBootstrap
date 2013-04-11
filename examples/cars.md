# Cars example #
from [statmethods.net](http://www.statmethods.net/advgraphs/ggplot2.html)


```r
# ggplot2 examples
library(ggplot2)
```

```
## Attaching package: 'ggplot2'
```

```
## The following object(s) are masked _by_ '.GlobalEnv':
## 
## scale_colour_discrete, scale_fill_discrete
```

```r
rm(mtcars)
# use color brewer as default discrete colors
scale_colour_discrete <- function(...) scale_color_brewer(palette = "Set1", 
    ...)
scale_fill_discrete <- function(...) scale_fill_brewer(palette = "Set1", ...)

# create factors with value labels
mtcars$gear <- factor(mtcars$gear, levels = c(3, 4, 5), labels = c("3gears", 
    "4gears", "5gears"))
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("Automatic", "Manual"))
mtcars$cyl <- factor(mtcars$cyl, levels = c(4, 6, 8), labels = c("4cyl", "6cyl", 
    "8cyl"))
```


##  Kernel density plots for mpg ##
grouped by number of gears (indicated by color)

```r
qplot(mpg, data = mtcars, geom = "density", fill = gear, alpha = I(0.5), main = "Distribution of Gas Milage", 
    xlab = "Miles Per Gallon", ylab = "Density")
```

![plot of chunk cars_density](figure/cars_density.png) 

## Scatterplot of mpg vs. hp ##
for each combination of gears and cylinders in each facet, transmission type is represented by shape and color

```r
qplot(hp, mpg, data = mtcars, shape = am, color = am, facets = gear ~ cyl, size = I(3), 
    xlab = "Horsepower", ylab = "Miles per Gallon")
```

![plot of chunk cars_scatter](figure/cars_scatter.png) 


## Regressions of mpg on weight ##
Seperate for each number of cylinders

```r
qplot(wt, mpg, data = mtcars, geom = c("point", "smooth"), method = "lm", formula = y ~ 
    x, color = cyl, main = "Regression of MPG on Weight", xlab = "Weight", ylab = "Miles per Gallon")
```

![plot of chunk cars_regressions](figure/cars_regressions.png) 


## Boxplots of mpg by number of gears ##
observations (points) are overlayed and jittered

```r
qplot(gear, mpg, data = mtcars, geom = c("boxplot", "jitter"), fill = gear, 
    main = "Mileage by Gear Number", xlab = "", ylab = "Miles per Gallon")
```

![plot of chunk cars_boxplots](figure/cars_boxplots.png) 


Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 20 10:57:07 AM
Last Modified: 2013 Apr 11 08:13:45 AM
