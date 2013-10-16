<!--
%\VignetteEngine{knitr}
%\VignetteIndexEntry{2D Graphs}
%\VignetteDepends{xtable, corrplot, igraph}
-->
# Tables #
### Regular R output ###
<div class="chunk" id="2d_data"><div class="rcode"><div class="source"><pre class="knitr r">#for the dataset
data('mtcars')
mcor <-cor(mtcars)
# Print mcor and round to 2 digits
round(mcor,digits=2)
</pre></div>
<div class="output"><pre class="knitr r">##        mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
## mpg   1.00 -0.85 -0.85 -0.78  0.68 -0.87  0.42  0.66  0.60  0.48 -0.55
## cyl  -0.85  1.00  0.90  0.83 -0.70  0.78 -0.59 -0.81 -0.52 -0.49  0.53
## disp -0.85  0.90  1.00  0.79 -0.71  0.89 -0.43 -0.71 -0.59 -0.56  0.39
## hp   -0.78  0.83  0.79  1.00 -0.45  0.66 -0.71 -0.72 -0.24 -0.13  0.75
## drat  0.68 -0.70 -0.71 -0.45  1.00 -0.71  0.09  0.44  0.71  0.70 -0.09
## wt   -0.87  0.78  0.89  0.66 -0.71  1.00 -0.17 -0.55 -0.69 -0.58  0.43
## qsec  0.42 -0.59 -0.43 -0.71  0.09 -0.17  1.00  0.74 -0.23 -0.21 -0.66
## vs    0.66 -0.81 -0.71 -0.72  0.44 -0.55  0.74  1.00  0.17  0.21 -0.57
## am    0.60 -0.52 -0.59 -0.24  0.71 -0.69 -0.23  0.17  1.00  0.79  0.06
## gear  0.48 -0.49 -0.56 -0.13  0.70 -0.58 -0.21  0.21  0.79  1.00  0.27
## carb -0.55  0.53  0.39  0.75 -0.09  0.43 -0.66 -0.57  0.06  0.27  1.00
</pre></div>
</div></div>

### HTML table using xtable ###
<div class="source"><pre class="knitr r">library(xtable)
print(xtable(mcor), type='html', comment=F)
</pre></div>
<TABLE border=1>
<TR> <TH>  </TH> <TH> mpg </TH> <TH> cyl </TH> <TH> disp </TH> <TH> hp </TH> <TH> drat </TH> <TH> wt </TH> <TH> qsec </TH> <TH> vs </TH> <TH> am </TH> <TH> gear </TH> <TH> carb </TH>  </TR>
  <TR> <TD align="right"> mpg </TD> <TD align="right"> 1.00 </TD> <TD align="right"> -0.85 </TD> <TD align="right"> -0.85 </TD> <TD align="right"> -0.78 </TD> <TD align="right"> 0.68 </TD> <TD align="right"> -0.87 </TD> <TD align="right"> 0.42 </TD> <TD align="right"> 0.66 </TD> <TD align="right"> 0.60 </TD> <TD align="right"> 0.48 </TD> <TD align="right"> -0.55 </TD> </TR>
  <TR> <TD align="right"> cyl </TD> <TD align="right"> -0.85 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.90 </TD> <TD align="right"> 0.83 </TD> <TD align="right"> -0.70 </TD> <TD align="right"> 0.78 </TD> <TD align="right"> -0.59 </TD> <TD align="right"> -0.81 </TD> <TD align="right"> -0.52 </TD> <TD align="right"> -0.49 </TD> <TD align="right"> 0.53 </TD> </TR>
  <TR> <TD align="right"> disp </TD> <TD align="right"> -0.85 </TD> <TD align="right"> 0.90 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.79 </TD> <TD align="right"> -0.71 </TD> <TD align="right"> 0.89 </TD> <TD align="right"> -0.43 </TD> <TD align="right"> -0.71 </TD> <TD align="right"> -0.59 </TD> <TD align="right"> -0.56 </TD> <TD align="right"> 0.39 </TD> </TR>
  <TR> <TD align="right"> hp </TD> <TD align="right"> -0.78 </TD> <TD align="right"> 0.83 </TD> <TD align="right"> 0.79 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> -0.45 </TD> <TD align="right"> 0.66 </TD> <TD align="right"> -0.71 </TD> <TD align="right"> -0.72 </TD> <TD align="right"> -0.24 </TD> <TD align="right"> -0.13 </TD> <TD align="right"> 0.75 </TD> </TR>
  <TR> <TD align="right"> drat </TD> <TD align="right"> 0.68 </TD> <TD align="right"> -0.70 </TD> <TD align="right"> -0.71 </TD> <TD align="right"> -0.45 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> -0.71 </TD> <TD align="right"> 0.09 </TD> <TD align="right"> 0.44 </TD> <TD align="right"> 0.71 </TD> <TD align="right"> 0.70 </TD> <TD align="right"> -0.09 </TD> </TR>
  <TR> <TD align="right"> wt </TD> <TD align="right"> -0.87 </TD> <TD align="right"> 0.78 </TD> <TD align="right"> 0.89 </TD> <TD align="right"> 0.66 </TD> <TD align="right"> -0.71 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> -0.17 </TD> <TD align="right"> -0.55 </TD> <TD align="right"> -0.69 </TD> <TD align="right"> -0.58 </TD> <TD align="right"> 0.43 </TD> </TR>
  <TR> <TD align="right"> qsec </TD> <TD align="right"> 0.42 </TD> <TD align="right"> -0.59 </TD> <TD align="right"> -0.43 </TD> <TD align="right"> -0.71 </TD> <TD align="right"> 0.09 </TD> <TD align="right"> -0.17 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.74 </TD> <TD align="right"> -0.23 </TD> <TD align="right"> -0.21 </TD> <TD align="right"> -0.66 </TD> </TR>
  <TR> <TD align="right"> vs </TD> <TD align="right"> 0.66 </TD> <TD align="right"> -0.81 </TD> <TD align="right"> -0.71 </TD> <TD align="right"> -0.72 </TD> <TD align="right"> 0.44 </TD> <TD align="right"> -0.55 </TD> <TD align="right"> 0.74 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.17 </TD> <TD align="right"> 0.21 </TD> <TD align="right"> -0.57 </TD> </TR>
  <TR> <TD align="right"> am </TD> <TD align="right"> 0.60 </TD> <TD align="right"> -0.52 </TD> <TD align="right"> -0.59 </TD> <TD align="right"> -0.24 </TD> <TD align="right"> 0.71 </TD> <TD align="right"> -0.69 </TD> <TD align="right"> -0.23 </TD> <TD align="right"> 0.17 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.79 </TD> <TD align="right"> 0.06 </TD> </TR>
  <TR> <TD align="right"> gear </TD> <TD align="right"> 0.48 </TD> <TD align="right"> -0.49 </TD> <TD align="right"> -0.56 </TD> <TD align="right"> -0.13 </TD> <TD align="right"> 0.70 </TD> <TD align="right"> -0.58 </TD> <TD align="right"> -0.21 </TD> <TD align="right"> 0.21 </TD> <TD align="right"> 0.79 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.27 </TD> </TR>
  <TR> <TD align="right"> carb </TD> <TD align="right"> -0.55 </TD> <TD align="right"> 0.53 </TD> <TD align="right"> 0.39 </TD> <TD align="right"> 0.75 </TD> <TD align="right"> -0.09 </TD> <TD align="right"> 0.43 </TD> <TD align="right"> -0.66 </TD> <TD align="right"> -0.57 </TD> <TD align="right"> 0.06 </TD> <TD align="right"> 0.27 </TD> <TD align="right"> 1.00 </TD> </TR>
   </TABLE>


# 2d graphs #
These 2d examples are both from Winsong Chang's excellent [R Graphics Cookbook](http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/dp/1449316956).

## Correlation Matrix Example ##

### Correlation plot ###
<div class="chunk" id="2d_plot"><div class="rcode"><div class="source"><pre class="knitr r">library(corrplot)
corrplot(mcor)
</pre></div>
<div class="rimage default"><img src="figure/2d_plot.png" title="plot of chunk 2d_plot" alt="plot of chunk 2d_plot" class="plot" /></div>
</div></div>

## Network Graph Example ##
<div class="chunk" id="2d_network_data"><div class="rcode"><div class="source"><pre class="knitr r">library(igraph)
# Specify edges for a directed graph
gd <-graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(gd)
</pre></div>
<div class="rimage default"><img src="figure/2d_network_data1.png" title="plot of chunk 2d_network_data" alt="plot of chunk 2d_network_data" class="plot" /></div>
<div class="source"><pre class="knitr r"># For an undirected graph
gu <-graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6),directed=FALSE)
# No labels
plot(gu,vertex.label=NA)
</pre></div>
<div class="rimage default"><img src="figure/2d_network_data2.png" title="plot of chunk 2d_network_data" alt="plot of chunk 2d_network_data" class="plot" /></div>
</div></div>

Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 27 10:54:38 PM
Last Modified: 2013 Sep 04 09:53:09 AM
