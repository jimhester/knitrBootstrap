# Map plots #

## USA Arrests ##
<div class="chunk" id="maps_arrests"><div class="rcode"><div class="source"><pre class="knitr"><code class="r">library(ggplot2)
</code></pre></div><div class="message"><pre class="knitr"><code class="r">## Attaching package: 'ggplot2'
</code></pre></div><div class="message"><pre class="knitr"><code class="r">## The following object(s) are masked _by_ '.GlobalEnv':
## 
## scale_colour_discrete, scale_fill_discrete
</code></pre></div><div class="source"><pre class="knitr"><code class="r">crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
library(reshape2)  # for melt
crimesm <- melt(crimes, id = 1)
require(maps)
</code></pre></div><div class="message"><pre class="knitr"><code class="r">## Loading required package: maps
</code></pre></div><div class="source"><pre class="knitr"><code class="r">states_map <- map_data("state")
ggplot(crimes, aes(map_id = state)) + geom_map(aes(fill = Murder), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat)
</code></pre></div><div class="rimage default"><img src="figure/maps_arrests1.png" title="plot of chunk maps_arrests" alt="plot of chunk maps_arrests" class="plot" /></div>
<div class="source"><pre class="knitr"><code class="r">last_plot() + coord_map()
</code></pre></div><div class="rimage default"><img src="figure/maps_arrests2.png" title="plot of chunk maps_arrests" alt="plot of chunk maps_arrests" class="plot" /></div>
<div class="source"><pre class="knitr"><code class="r">ggplot(crimesm, aes(map_id = state)) + geom_map(aes(fill = value), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat) + facet_wrap(~variable)
</code></pre></div><div class="rimage default"><img src="figure/maps_arrests3.png" title="plot of chunk maps_arrests" alt="plot of chunk maps_arrests" class="plot" /></div>
</div></div>

### Use fig.show='hold' ###
These are the same plots with fig.show='hold' in the options
<div class="chunk" id="maps_figshow"><div class="rcode"><div class="source"><pre class="knitr"><code class="r">ggplot(crimes, aes(map_id = state)) + geom_map(aes(fill = Murder), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat)
last_plot() + coord_map()
ggplot(crimesm, aes(map_id = state)) + geom_map(aes(fill = value), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat) + facet_wrap(~variable)
</code></pre></div><div class="rimage default"><img src="figure/maps_figshow1.png" title="plot of chunk maps_figshow" alt="plot of chunk maps_figshow" class="plot" />
<img src="figure/maps_figshow2.png" title="plot of chunk maps_figshow" alt="plot of chunk maps_figshow" class="plot" />
<img src="figure/maps_figshow3.png" title="plot of chunk maps_figshow" alt="plot of chunk maps_figshow" class="plot" /></div>
</div></div>

Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 28 02:44:48 PM
Last Modified: 2013 Mar 28 03:33:39 PM
