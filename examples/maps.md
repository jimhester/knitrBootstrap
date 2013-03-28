# Map plots #

## USA Arrests ##

```r
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
crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
library(reshape2)  # for melt
crimesm <- melt(crimes, id = 1)
require(maps)
```

```
## Loading required package: maps
```

```r
states_map <- map_data("state")
ggplot(crimes, aes(map_id = state)) + geom_map(aes(fill = Murder), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat)
```

![plot of chunk maps_arrests](figure/maps_arrests1.svg) 

```r
last_plot() + coord_map()
```

![plot of chunk maps_arrests](figure/maps_arrests2.svg) 

```r
ggplot(crimesm, aes(map_id = state)) + geom_map(aes(fill = value), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat) + facet_wrap(~variable)
```

![plot of chunk maps_arrests](figure/maps_arrests3.svg) 

### Use fig.show='hold' ###
These are the same plots with fig.show='hold' in the options

```r
ggplot(crimes, aes(map_id = state)) + geom_map(aes(fill = Murder), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat)
last_plot() + coord_map()
ggplot(crimesm, aes(map_id = state)) + geom_map(aes(fill = value), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat) + facet_wrap(~variable)
```

![plot of chunk maps_figshow](figure/maps_figshow1.svg) ![plot of chunk maps_figshow](figure/maps_figshow2.svg) ![plot of chunk maps_figshow](figure/maps_figshow3.svg) 

Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 28 02:44:48 PM
Last Modified: 2013 Mar 28 03:18:18 PM
