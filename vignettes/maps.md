<!--
%\VignetteEngine{knitr}
%\VignetteIndexEntry{Map examples}
%\VignetteDepends{ggplot2, reshape2, maps}
-->
# Map plots #

## USA Arrests ##
Examples from [http://docs.ggplot2.org/current/geom_map.html](http://docs.ggplot2.org/current/geom_map.html).
<div class="chunk" id="maps_arrests"><div class="rcode"><div class="source"><pre class="knitr r">library(ggplot2)
</pre></div>
<div class="message"><pre class="knitr r">## Loading required package: methods
</pre></div>
<div class="source"><pre class="knitr r">crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
library(reshape2) # for melt
crimesm <- melt(crimes, id = 1)
library(maps)
states_map <- map_data("state")
ggplot(crimes, aes(map_id = state)) + geom_map(aes(fill = Murder), map = states_map) + expand_limits(x = states_map$long, y = states_map$lat)
last_plot() + coord_map()
ggplot(crimesm, aes(map_id = state)) + geom_map(aes(fill = value), map = states_map) + expand_limits(x = states_map$long, y = states_map$lat) + facet_wrap( ~ variable)
great_lakes_states = c('michigan', 'illinois', 'ohio', 'wisconsin', 'indiana')
great_lakes_map = subset(states_map, region %in% great_lakes_states)
ggplot(subset(crimesm, state %in% great_lakes_states), aes(map_id = state)) + geom_map(aes(fill = value), map = great_lakes_map) + expand_limits(x=great_lakes_map$long, y=great_lakes_map$lat) + facet_wrap( ~ variable)
</pre></div>
<div class="rimage default"><img src="figure/maps_arrests1.png" title="plot of chunk maps_arrests" alt="plot of chunk maps_arrests" class="plot" />
<img src="figure/maps_arrests2.png" title="plot of chunk maps_arrests" alt="plot of chunk maps_arrests" class="plot" />
<img src="figure/maps_arrests3.png" title="plot of chunk maps_arrests" alt="plot of chunk maps_arrests" class="plot" />
<img src="figure/maps_arrests4.png" title="plot of chunk maps_arrests" alt="plot of chunk maps_arrests" class="plot" /></div>
</div></div>

Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 28 02:44:48 PM
Last Modified: 2013 Sep 04 09:54:11 AM
