

# Cars example #
from [statmethods.net](http://www.statmethods.net/advgraphs/ggplot2.html)

<div class="chunk" id="cars_setup"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">render_html</span>()
<span class="comment"># ggplot2 examples</span>
<span class="functioncall">library</span>(ggplot2)
</code></pre></div><div class="message"><pre class="knitr"><code class="r">## Attaching package: 'ggplot2'
</code></pre></div><div class="message"><pre class="knitr"><code class="r">## The following object(s) are masked _by_ '.GlobalEnv':
## 
## scale_colour_discrete, scale_fill_discrete
</code></pre></div><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">rm</span>(mtcars)
<span class="comment"># use color brewer as default discrete colors</span>
scale_colour_discrete &lt;- <span class="functioncall"><span class="keyword">function</span></span>(...) <span class="functioncall">scale_color_brewer</span>(palette = <span class="string">"Set1"</span>, 
    ...)
scale_fill_discrete &lt;- <span class="functioncall"><span class="keyword">function</span></span>(...) <span class="functioncall">scale_fill_brewer</span>(palette = <span class="string">"Set1"</span>, ...)

<span class="comment"># create factors with value labels</span>
mtcars$gear &lt;- <span class="functioncall">factor</span>(mtcars$gear, levels = <span class="functioncall">c</span>(3, 4, 5), labels = <span class="functioncall">c</span>(<span class="string">"3gears"</span>, 
    <span class="string">"4gears"</span>, <span class="string">"5gears"</span>))
mtcars$am &lt;- <span class="functioncall">factor</span>(mtcars$am, levels = <span class="functioncall">c</span>(0, 1), labels = <span class="functioncall">c</span>(<span class="string">"Automatic"</span>, <span class="string">"Manual"</span>))
mtcars$cyl &lt;- <span class="functioncall">factor</span>(mtcars$cyl, levels = <span class="functioncall">c</span>(4, 6, 8), labels = <span class="functioncall">c</span>(<span class="string">"4cyl"</span>, <span class="string">"6cyl"</span>, 
    <span class="string">"8cyl"</span>))
</code></pre></div></div></div>

##  Kernel density plots for mpg ##
grouped by number of gears (indicated by color)
<div class="chunk" id="cars_density"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">qplot</span>(mpg, data = mtcars, geom = <span class="string">"density"</span>, fill = gear, alpha = <span class="functioncall">I</span>(0.5), main = <span class="string">"Distribution of Gas Milage"</span>, 
    xlab = <span class="string">"Miles Per Gallon"</span>, ylab = <span class="string">"Density"</span>)
</code></pre></div></div><div class="rimage default"><img src="figure/cars_density.png" title="plot of chunk cars_density" alt="plot of chunk cars_density" class="plot" /></div></div>

## Scatterplot of mpg vs. hp ##
for each combination of gears and cylinders in each facet, transmission type is represented by shape and color
<div class="chunk" id="cars_scatter"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">qplot</span>(hp, mpg, data = mtcars, shape = am, color = am, facets = gear ~ cyl, size = <span class="functioncall">I</span>(3), 
    xlab = <span class="string">"Horsepower"</span>, ylab = <span class="string">"Miles per Gallon"</span>)
</code></pre></div></div><div class="rimage default"><img src="figure/cars_scatter.png" title="plot of chunk cars_scatter" alt="plot of chunk cars_scatter" class="plot" /></div></div>


## Regressions of mpg on weight ##
Seperate for each number of cylinders
<div class="chunk" id="cars_regressions"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">qplot</span>(wt, mpg, data = mtcars, geom = <span class="functioncall">c</span>(<span class="string">"point"</span>, <span class="string">"smooth"</span>), method = <span class="string">"lm"</span>, formula = y ~ 
    x, color = cyl, main = <span class="string">"Regression of MPG on Weight"</span>, xlab = <span class="string">"Weight"</span>, ylab = <span class="string">"Miles per Gallon"</span>)
</code></pre></div></div><div class="rimage default"><img src="figure/cars_regressions.png" title="plot of chunk cars_regressions" alt="plot of chunk cars_regressions" class="plot" /></div></div>


## Boxplots of mpg by number of gears ##
observations (points) are overlayed and jittered
<div class="chunk" id="cars_boxplots"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">qplot</span>(gear, mpg, data = mtcars, geom = <span class="functioncall">c</span>(<span class="string">"boxplot"</span>, <span class="string">"jitter"</span>), fill = gear, 
    main = <span class="string">"Mileage by Gear Number"</span>, xlab = <span class="string">""</span>, ylab = <span class="string">"Miles per Gallon"</span>)
</code></pre></div></div><div class="rimage default"><img src="figure/cars_boxplots.png" title="plot of chunk cars_boxplots" alt="plot of chunk cars_boxplots" class="plot" /></div></div>


Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 20 10:57:07 AM
Last Modified: 2013 Apr 23 02:23:28 PM
