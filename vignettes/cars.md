<!--
%\VignetteEngine{knitr}
%\VignetteIndexEntry{Cars example}
%\VignetteDepends{ggplot2}
-->
# Cars example #
From [statmethods.net](http://www.statmethods.net/advgraphs/ggplot2.html).

<div class="chunk" id="cars_setup"><div class="rcode"><div class="source"><pre class="knitr r"># ggplot2 examples
library(ggplot2)
</pre></div>
<div class="message"><pre class="knitr r">## Loading required package: methods
</pre></div>
<div class="source"><pre class="knitr r">#use color brewer as default discrete colors
scale_colour_discrete <- function(...) scale_color_brewer(palette="Set1", ...)
scale_fill_discrete <- function(...) scale_fill_brewer(palette="Set1", ...)

data('mtcars')
# create factors with value labels
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
     labels=c("3gears","4gears","5gears"))
mtcars$am <- factor(mtcars$am,levels=c(0,1),
     labels=c("Automatic","Manual"))
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
   labels=c("4cyl","6cyl","8cyl"))
head(mtcars)
</pre></div>
<div class="output"><pre class="knitr r">##                    mpg  cyl disp  hp drat    wt  qsec vs        am   gear
## Mazda RX4         21.0 6cyl  160 110 3.90 2.620 16.46  0    Manual 4gears
## Mazda RX4 Wag     21.0 6cyl  160 110 3.90 2.875 17.02  0    Manual 4gears
## Datsun 710        22.8 4cyl  108  93 3.85 2.320 18.61  1    Manual 4gears
## Hornet 4 Drive    21.4 6cyl  258 110 3.08 3.215 19.44  1 Automatic 3gears
## Hornet Sportabout 18.7 8cyl  360 175 3.15 3.440 17.02  0 Automatic 3gears
## Valiant           18.1 6cyl  225 105 2.76 3.460 20.22  1 Automatic 3gears
##                   carb
## Mazda RX4            4
## Mazda RX4 Wag        4
## Datsun 710           1
## Hornet 4 Drive       1
## Hornet Sportabout    2
## Valiant              1
</pre></div>
</div></div>

##  Kernel density plots for mpg ##
Grouped by number of gears (indicated by color).
<div class="chunk" id="cars_density"><div class="rcode"><div class="source"><pre class="knitr r">qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5),
   main="Distribution of Gas Milage", xlab="Miles Per Gallon",
   ylab="Density")
</pre></div>
<div class="rimage default"><img src="figure/cars_density.png" title="plot of chunk cars_density" alt="plot of chunk cars_density" class="plot" /></div>
</div></div>

## Scatterplot of mpg vs. hp ##
For each combination of gears and cylinders in each facet, transmission type is represented by shape and color.
<div class="chunk" id="cars_scatter"><div class="rcode"><div class="source"><pre class="knitr r">qplot(hp, mpg, data=mtcars, shape=am, color=am,
   facets=gear~cyl, size=I(3),
   xlab="Horsepower", ylab="Miles per Gallon")
</pre></div>
<div class="rimage default"><img src="figure/cars_scatter.png" title="plot of chunk cars_scatter" alt="plot of chunk cars_scatter" class="plot" /></div>
</div></div>


## Regressions of mpg on weight ##
Separate for each number of cylinders.
<div class="chunk" id="cars_regressions"><div class="rcode"><div class="source"><pre class="knitr r">qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"),
   method="lm", formula=y~x, color=cyl,
   main="Regression of MPG on Weight",
   xlab="Weight", ylab="Miles per Gallon")
</pre></div>
<div class="rimage default"><img src="figure/cars_regressions.png" title="plot of chunk cars_regressions" alt="plot of chunk cars_regressions" class="plot" /></div>
</div></div>


## Boxplots of mpg by number of gears ##
Observations (points) are overlayed and jittered.
<div class="chunk" id="cars_boxplots"><div class="rcode"><div class="source"><pre class="knitr r">qplot(gear, mpg, data=mtcars, geom=c("boxplot", "jitter"),
   fill=gear, main="Mileage by Gear Number",
   xlab="", ylab="Miles per Gallon")
</pre></div>
<div class="rimage default"><img src="figure/cars_boxplots.png" title="plot of chunk cars_boxplots" alt="plot of chunk cars_boxplots" class="plot" /></div>
</div></div>


Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 20 10:57:07 AM
Last Modified: 2013 Sep 04 09:51:52 AM
