

# Illusions #
The R implementations for these are from Kohske Takahashi[(@kohske)](https://twitter.com/kohske).
See http://rpubs.com/kohske/R-de-illusion
from [statmethods.net](http://www.statmethods.net/advgraphs/ggplot2.html)

## Café wall illusion ##
All the lines are actually parallel

<div class="chunk" id="illusions_cafe_wall"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">library</span>(grid)
rs &lt;- <span class="functioncall">expand.grid</span>(x = <span class="functioncall">seq</span>(0, 1, 1/10), y = <span class="functioncall">seq</span>(0, 1, 1/10))
<span class="functioncall">grid.rect</span>(rs$x, rs$y, 1/10/2, 1/10/2, gp = <span class="functioncall">gpar</span>(fill = <span class="string">"black"</span>, col = <span class="keyword">NA</span>))
<span class="functioncall">grid.rect</span>(rs$x + 1/10/4, rs$y + 1/10/2, 1/10/2, 1/10/2, gp = <span class="functioncall">gpar</span>(fill = <span class="string">"black"</span>, 
    col = <span class="keyword">NA</span>))
ls &lt;- <span class="functioncall">expand.grid</span>(x = 0:1, y = <span class="functioncall">seq</span>(0, 1, 1/20) - 1/20/2)
<span class="functioncall">grid.polyline</span>(ls$x, ls$y, id = <span class="functioncall">gl</span>(<span class="functioncall">nrow</span>(ls)/2, 2), gp = <span class="functioncall">gpar</span>(col = <span class="string">"grey50"</span>, 
    lwd = 1))
</code></pre></div></div><div class="rimage default"><img src="figure/illusions_cafe_wall.png" title="plot of chunk illusions_cafe_wall" alt="plot of chunk illusions_cafe_wall" class="plot" /></div></div>


## Ouchi ##
Move your frame of reference to see the effect.

<div class="chunk" id="illusions_ouchi"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">grid.newpage</span>()
nx &lt;- 10
ny &lt;- 30
rs &lt;- <span class="functioncall">expand.grid</span>(x = <span class="functioncall">seq</span>(0, 1, 1/nx/2), y = <span class="functioncall">seq</span>(0, 1, 1/ny/2))
<span class="functioncall">grid.rect</span>(rs$x, rs$y, 1/nx/2, 1/ny/2, gp = <span class="functioncall">gpar</span>(col = <span class="keyword">NA</span>, fill = <span class="functioncall">c</span>(<span class="string">"black"</span>, 
    <span class="string">"white"</span>)))
rs &lt;- <span class="functioncall">expand.grid</span>(x = <span class="functioncall">seq</span>(0.25, 0.75, 1/nx/2), y = <span class="functioncall">seq</span>(0.25, 0.75, 1/ny/2))
<span class="functioncall">grid.rect</span>(rs$y, rs$x, 1/ny/2, 1/nx/2, gp = <span class="functioncall">gpar</span>(col = <span class="keyword">NA</span>, fill = <span class="functioncall">c</span>(<span class="string">"black"</span>, 
    <span class="string">"white"</span>)))
</code></pre></div></div><div class="rimage default"><img src="figure/illusions_ouchi.png" title="plot of chunk illusions_ouchi" alt="plot of chunk illusions_ouchi" class="plot" /></div></div>


## Fraser illusion ##
All the lines are actually parallel

<div class="chunk" id="illusions_fraser"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">library</span>(plyr)
<span class="functioncall">grid.newpage</span>()
n &lt;- 10
ny &lt;- 8
L &lt;- 0.01
c &lt;- <span class="functioncall">seq</span>(0, 1, length = n)
d &lt;- 1.2 * <span class="functioncall">diff</span>(c)[1]/2
col &lt;- <span class="functioncall">c</span>(<span class="string">"black"</span>, <span class="string">"white"</span>)
x &lt;- <span class="functioncall">c</span>(c - d, c, c + d, c)
y &lt;- <span class="functioncall">rep</span>(<span class="functioncall">c</span>(0, -d, 0, d), each = n)
w &lt;- <span class="functioncall">c</span>(c - d, c - d + L, c + d, c + d - L)
z &lt;- <span class="functioncall">c</span>(0, L, 0, -L)
ys &lt;- <span class="functioncall">seq</span>(0, 1, length = ny)
<span class="functioncall">grid.rect</span>(gp = <span class="functioncall">gpar</span>(fill = <span class="functioncall">gray</span>(0.5), col = <span class="keyword">NA</span>))
<span class="functioncall">l_ply</span>(1:ny, <span class="functioncall"><span class="keyword">function</span></span>(i) {
    n
    <span class="functioncall"><span class="keyword">if</span></span> (i%%2 == 0) {
        co &lt;- <span class="functioncall">rev</span>(col)
        z &lt;- -z
    } <span class="keyword">else</span> {
        co &lt;- col
    }
    <span class="functioncall">grid.polygon</span>(x, y + ys[i], id = <span class="functioncall">rep</span>(1:n, 4), gp = <span class="functioncall">gpar</span>(fill = co, col = <span class="keyword">NA</span>))
    <span class="functioncall">grid.polygon</span>(w, <span class="functioncall">rep</span>(z, each = n) + ys[i], id = <span class="functioncall">rep</span>(1:n, 4), gp = <span class="functioncall">gpar</span>(fill = <span class="functioncall">rev</span>(co), 
        col = <span class="keyword">NA</span>))
})
</code></pre></div></div><div class="rimage default"><img src="figure/illusions_fraser.png" title="plot of chunk illusions_fraser" alt="plot of chunk illusions_fraser" class="plot" /></div></div>


## Fraser-Wilcox illusion ##

<div class="chunk" id="illusions_fraser_wilcox"><div class="rcode"><div class="source"><pre class="knitr"><code class="r"><span class="functioncall">grid.newpage</span>()
No &lt;- 3
wo &lt;- 1/3/2
po &lt;- <span class="functioncall">seq</span>(0, 1, by = wo)[(1:No) * 2]
Nc &lt;- 8
tc &lt;- <span class="functioncall">seq</span>(<span class="keyword">pi</span> * 11/12, <span class="keyword">pi</span> * 1/12, len = Nc)
px &lt;- <span class="functioncall">c</span>(<span class="functioncall">outer</span>(wo * <span class="functioncall">cos</span>(tc), po, `+`))
wc &lt;- <span class="functioncall">rep</span>(<span class="functioncall">sin</span>(tc), No)
ag &lt;- <span class="functioncall">rep</span>(1:No, each = Nc)
dc &lt;- 21
th &lt;- <span class="functioncall">seq</span>(0, 2 * <span class="keyword">pi</span>, len = dc)
<span class="functioncall">grid.rect</span>(gp = <span class="functioncall">gpar</span>(col = <span class="keyword">NA</span>, fill = <span class="string">"#D2D200"</span>))
<span class="functioncall"><span class="keyword">for</span></span> (y0 <span class="keyword">in</span> <span class="functioncall">seq</span>(0, 1, len = 10)) {
    <span class="functioncall"><span class="keyword">for</span></span> (i <span class="keyword">in</span> <span class="functioncall">seq_along</span>(px)) {
        th &lt;- <span class="functioncall">seq</span>(<span class="keyword">pi</span>/2, <span class="keyword">pi</span>/2 + 2 * <span class="keyword">pi</span>, len = 21)
        <span class="functioncall"><span class="keyword">if</span></span> (ag[i]%%2 == 0) 
            th &lt;- <span class="functioncall">rev</span>(th)
        x &lt;- px[i] + 0.5 * 0.04 * <span class="functioncall">cos</span>(th) * wc[i]
        y &lt;- y0 + 0.04 * <span class="functioncall">sin</span>(th)
        <span class="functioncall">grid.polygon</span>(x, y, gp = <span class="functioncall">gpar</span>(fill = <span class="string">"#3278FE"</span>))
        <span class="functioncall">grid.polyline</span>(x[1:((dc + 1)/2)], y[1:((dc + 1)/2)], gp = <span class="functioncall">gpar</span>(lineend = <span class="string">"butt"</span>, 
            lwd = 3, col = <span class="functioncall">gray</span>(0)))
        <span class="functioncall">grid.polyline</span>(x[-(1:((dc - 1)/2))], y[-(1:((dc - 1)/2))], gp = <span class="functioncall">gpar</span>(lineend = <span class="string">"butt"</span>, 
            lwd = 3, col = <span class="functioncall">gray</span>(1)))
    }
}
</code></pre></div></div><div class="rimage default"><img src="figure/illusions_fraser_wilcox.png" title="plot of chunk illusions_fraser_wilcox" alt="plot of chunk illusions_fraser_wilcox" class="plot" /></div></div>


## Parallel curves ##
These curves are the same offset apart for every x, even though it looks like they converge.
<div class="chunk" id="illusions_parallel_lines"><div class="rcode"><div class="source"><pre class="knitr"><code class="r">x = 1:100
y = 1/<span class="functioncall">log10</span>(x)
y2 = y + 0.2
<span class="functioncall">plot</span>(x, y, type = <span class="string">"l"</span>, ylim = <span class="functioncall">c</span>(0, 1.5))
<span class="functioncall">lines</span>(x, y2)
</code></pre></div></div><div class="rimage default"><img src="figure/illusions_parallel_lines.png" title="plot of chunk illusions_parallel_lines" alt="plot of chunk illusions_parallel_lines" class="plot" /></div></div>

