
# 2d graphs #
These 2d examples are both from Winsong Chang's excellent [R Graphics Cookbook](http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/dp/1449316956)
## Correlation Matrix Example ##
### Correlation plot ###

```r
library(corrplot)
corrplot(mcor)
```

![plot of chunk 2d_3d_plot](figure/2d_3d_plot.png) 

### Regular R output ###

```r
# for the dataset
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
mcor <- cor(mtcars)
# Print mcor and round to 2 digits
round(mcor, digits = 2)
```

```
##        mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
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
```

### HTML table using xtable ###

```r
library(xtable)
print(xtable(mcor), type = "html")
```

<!-- html table generated in R 2.15.1 by xtable 1.7-0 package -->
<!-- Mon Apr  1 15:17:21 2013 -->
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

## Network Graph Example ##

```r
library(igraph)
# Specify edges for a directed graph
gd <- graph(c(1, 2, 2, 3, 2, 4, 1, 4, 5, 5, 3, 6))
plot(gd)
```

![plot of chunk 2d_3d_network_data](figure/2d_3d_network_data1.png) 

```r
# For an undirected graph
gu <- graph(c(1, 2, 2, 3, 2, 4, 1, 4, 5, 5, 3, 6), directed = FALSE)
# No labels
plot(gu, vertex.label = NA)
```

![plot of chunk 2d_3d_network_data](figure/2d_3d_network_data2.png) 

# 3d graphs #
This example is from [Yihui's response](http://stackoverflow.com/questions/14879210/including-a-interactive-3d-figure-with-knitr) to a stack overflow question.

Need to load the CanvasMatrix library and the hook_webgl code to get 3d graphs to work

```r
has_X11 = Sys.getenv("DISPLAY") != ""
if (has_X11) knit_hooks$set(webgl = hook_webgl)
```

```{html}
<script src="https://dl.dropbox.com/u/15335397/misc/CanvasMatrix.js"></script>
```
<script src="https://dl.dropbox.com/u/15335397/misc/CanvasMatrix.js"></script>

## point 3d graph ##

```r
library(rgl)
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x, y)
plot3d(x, y, z, col = rainbow(1000))
```

<script src="CanvasMatrix.js" type="text/javascript"></script>
<canvas id="_2d_3d_pointstextureCanvas" style="display: none;" width="256" height="256">
<img src="_2d_3d_pointssnapshot.png" alt="_2d_3d_pointssnapshot" width=505/><br>
	Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 6 ****** -->
<script id="_2d_3d_pointsvshader6" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	void main(void) {
	  gl_Position = prMatrix * mvMatrix * vec4(aPos, 1.);
	  gl_PointSize = 3.;
	  vDiffuse = aCol;
	}
</script>
<script id="_2d_3d_pointsfshader6" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  gl_FragColor = diffuse;
	}
</script> 
<!-- ****** text object 8 ****** -->
<script id="_2d_3d_pointsvshader8" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	attribute vec2 aTexcoord;
	varying vec2 vTexcoord;
	attribute vec2 aOfs;
	void main(void) {
	  vDiffuse = aCol;
	  vTexcoord = aTexcoord;
	  vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
	  pos = pos/pos.w;
	  gl_Position = pos + vec4(aOfs, 0.,0.);
	}
</script>
<script id="_2d_3d_pointsfshader8" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	varying vec2 vTexcoord;
	uniform sampler2D uSampler;
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  vec4 textureColor = diffuse*texture2D(uSampler, vTexcoord);
	  if (textureColor.a < 0.1)
	    discard;
	  else
	    gl_FragColor = textureColor;
	}
</script> 
<!-- ****** text object 9 ****** -->
<script id="_2d_3d_pointsvshader9" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	attribute vec2 aTexcoord;
	varying vec2 vTexcoord;
	attribute vec2 aOfs;
	void main(void) {
	  vDiffuse = aCol;
	  vTexcoord = aTexcoord;
	  vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
	  pos = pos/pos.w;
	  gl_Position = pos + vec4(aOfs, 0.,0.);
	}
</script>
<script id="_2d_3d_pointsfshader9" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	varying vec2 vTexcoord;
	uniform sampler2D uSampler;
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  vec4 textureColor = diffuse*texture2D(uSampler, vTexcoord);
	  if (textureColor.a < 0.1)
	    discard;
	  else
	    gl_FragColor = textureColor;
	}
</script> 
<!-- ****** text object 10 ****** -->
<script id="_2d_3d_pointsvshader10" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	attribute vec2 aTexcoord;
	varying vec2 vTexcoord;
	attribute vec2 aOfs;
	void main(void) {
	  vDiffuse = aCol;
	  vTexcoord = aTexcoord;
	  vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
	  pos = pos/pos.w;
	  gl_Position = pos + vec4(aOfs, 0.,0.);
	}
</script>
<script id="_2d_3d_pointsfshader10" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	varying vec2 vTexcoord;
	uniform sampler2D uSampler;
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  vec4 textureColor = diffuse*texture2D(uSampler, vTexcoord);
	  if (textureColor.a < 0.1)
	    discard;
	  else
	    gl_FragColor = textureColor;
	}
</script> 
<!-- ****** lines object 11 ****** -->
<script id="_2d_3d_pointsvshader11" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	void main(void) {
	  gl_Position = prMatrix * mvMatrix * vec4(aPos, 1.);
	  vDiffuse = aCol;
	}
</script>
<script id="_2d_3d_pointsfshader11" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  gl_FragColor = diffuse;
	}
</script> 
<!-- ****** text object 12 ****** -->
<script id="_2d_3d_pointsvshader12" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	attribute vec2 aTexcoord;
	varying vec2 vTexcoord;
	attribute vec2 aOfs;
	void main(void) {
	  vDiffuse = aCol;
	  vTexcoord = aTexcoord;
	  vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
	  pos = pos/pos.w;
	  gl_Position = pos + vec4(aOfs, 0.,0.);
	}
</script>
<script id="_2d_3d_pointsfshader12" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	varying vec2 vTexcoord;
	uniform sampler2D uSampler;
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  vec4 textureColor = diffuse*texture2D(uSampler, vTexcoord);
	  if (textureColor.a < 0.1)
	    discard;
	  else
	    gl_FragColor = textureColor;
	}
</script> 
<!-- ****** lines object 13 ****** -->
<script id="_2d_3d_pointsvshader13" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	void main(void) {
	  gl_Position = prMatrix * mvMatrix * vec4(aPos, 1.);
	  vDiffuse = aCol;
	}
</script>
<script id="_2d_3d_pointsfshader13" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  gl_FragColor = diffuse;
	}
</script> 
<!-- ****** text object 14 ****** -->
<script id="_2d_3d_pointsvshader14" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	attribute vec2 aTexcoord;
	varying vec2 vTexcoord;
	attribute vec2 aOfs;
	void main(void) {
	  vDiffuse = aCol;
	  vTexcoord = aTexcoord;
	  vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
	  pos = pos/pos.w;
	  gl_Position = pos + vec4(aOfs, 0.,0.);
	}
</script>
<script id="_2d_3d_pointsfshader14" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	varying vec2 vTexcoord;
	uniform sampler2D uSampler;
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  vec4 textureColor = diffuse*texture2D(uSampler, vTexcoord);
	  if (textureColor.a < 0.1)
	    discard;
	  else
	    gl_FragColor = textureColor;
	}
</script> 
<!-- ****** lines object 15 ****** -->
<script id="_2d_3d_pointsvshader15" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	void main(void) {
	  gl_Position = prMatrix * mvMatrix * vec4(aPos, 1.);
	  vDiffuse = aCol;
	}
</script>
<script id="_2d_3d_pointsfshader15" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  gl_FragColor = diffuse;
	}
</script> 
<!-- ****** text object 16 ****** -->
<script id="_2d_3d_pointsvshader16" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	attribute vec2 aTexcoord;
	varying vec2 vTexcoord;
	attribute vec2 aOfs;
	void main(void) {
	  vDiffuse = aCol;
	  vTexcoord = aTexcoord;
	  vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
	  pos = pos/pos.w;
	  gl_Position = pos + vec4(aOfs, 0.,0.);
	}
</script>
<script id="_2d_3d_pointsfshader16" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	varying vec2 vTexcoord;
	uniform sampler2D uSampler;
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  vec4 textureColor = diffuse*texture2D(uSampler, vTexcoord);
	  if (textureColor.a < 0.1)
	    discard;
	  else
	    gl_FragColor = textureColor;
	}
</script> 
<!-- ****** lines object 17 ****** -->
<script id="_2d_3d_pointsvshader17" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	void main(void) {
	  gl_Position = prMatrix * mvMatrix * vec4(aPos, 1.);
	  vDiffuse = aCol;
	}
</script>
<script id="_2d_3d_pointsfshader17" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	void main(void) {
	  vec4 diffuse;
	  diffuse = vDiffuse;
	  gl_FragColor = diffuse;
	}
</script> 
<script type="text/javascript"> 
	function getShader ( gl, id ){
	   var shaderScript = document.getElementById ( id );
	   var str = "";
	   var k = shaderScript.firstChild;
	   while ( k ){
	     if ( k.nodeType == 3 ) str += k.textContent;
	     k = k.nextSibling;
	   }
	   var shader;
	   if ( shaderScript.type == "x-shader/x-fragment" )
             shader = gl.createShader ( gl.FRAGMENT_SHADER );
	   else if ( shaderScript.type == "x-shader/x-vertex" )
             shader = gl.createShader(gl.VERTEX_SHADER);
	   else return null;
	   gl.shaderSource(shader, str);
	   gl.compileShader(shader);
	   if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
	     alert(gl.getShaderInfoLog(shader));
	   return shader;
	}
	var min = Math.min;
	var max = Math.max;
	var sqrt = Math.sqrt;
	var sin = Math.sin;
	var acos = Math.acos;
	var tan = Math.tan;
	var SQRT2 = Math.SQRT2;
	var PI = Math.PI;
	var log = Math.log;
	var exp = Math.exp;
	function _2d_3d_pointswebGLStart() {
	   var debug = function(msg) {
	     document.getElementById("_2d_3d_pointsdebug").innerHTML = msg;
	   }
	   debug("");
	   var canvas = document.getElementById("_2d_3d_pointscanvas");
	   if (!window.WebGLRenderingContext){
	     debug("<img src=\"_2d_3d_pointssnapshot.png\" alt=\"_2d_3d_pointssnapshot\" width=505/><br> Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
	     return;
	   }
	   var gl;
	   try {
	     // Try to grab the standard context. If it fails, fallback to experimental.
	     gl = canvas.getContext("webgl") 
	       || canvas.getContext("experimental-webgl");
	   }
	   catch(e) {}
	   if ( !gl ) {
	     debug("<img src=\"_2d_3d_pointssnapshot.png\" alt=\"_2d_3d_pointssnapshot\" width=505/><br> Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
	     return;
	   }
	   var width = 505;  var height = 505;
	   canvas.width = width;   canvas.height = height;
	   gl.viewport(0, 0, width, height);
	   var prMatrix = new CanvasMatrix4();
	   var mvMatrix = new CanvasMatrix4();
	   var normMatrix = new CanvasMatrix4();
	   var saveMat = new CanvasMatrix4();
	   saveMat.makeIdentity();
	   var distance;
	   var zoom = 1;
	   var fov = 30;
	   var userMatrix = new CanvasMatrix4();
	   userMatrix.load([
	    1, 0, 0, 0,
	    0, 0.3420201, -0.9396926, 0,
	    0, 0.9396926, 0.3420201, 0,
	    0, 0, 0, 1
		]);
	   function getPowerOfTwo(value) {
	     var pow = 1;
	     while(pow<value) {
	       pow *= 2;
	     }
	     return pow;
	   }
	   function handleLoadedTexture(texture, textureCanvas) {
	     gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
	     gl.bindTexture(gl.TEXTURE_2D, texture);
	     gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
	     gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
	     gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
	     gl.generateMipmap(gl.TEXTURE_2D);
	     gl.bindTexture(gl.TEXTURE_2D, null);
	   }
	   function loadImageToTexture(filename, texture) {   
	     var canvas = document.getElementById("_2d_3d_pointstextureCanvas");
	     var ctx = canvas.getContext("2d");
	     var image = new Image();
	     image.onload = function() {
	       var w = image.width;
	       var h = image.height;
	       var canvasX = getPowerOfTwo(w);
	       var canvasY = getPowerOfTwo(h);
	       canvas.width = canvasX;
	       canvas.height = canvasY;
	       ctx.imageSmoothingEnabled = true;
	       ctx.drawImage(image, 0, 0, canvasX, canvasY);
	       handleLoadedTexture(texture, canvas);
   	       drawScene();
	     }
	     image.src = filename;
	   }  	   
	   function drawTextToCanvas(text, cex) {
	     var canvasX, canvasY;
	     var textX, textY;
	     var textHeight = 20 * cex;
	     var textColour = "white";
	     var fontFamily = "Arial";
	     var backgroundColour = "rgba(0,0,0,0)";
	     var canvas = document.getElementById("_2d_3d_pointstextureCanvas");
	     var ctx = canvas.getContext("2d");
	     ctx.font = textHeight+"px "+fontFamily;
             canvasX = 1;
             var widths = [];
	     for (var i = 0; i < text.length; i++)  {
	       widths[i] = ctx.measureText(text[i]).width;
	       canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
	     }	  
	     canvasX = getPowerOfTwo(canvasX);
	     var offset = 2*textHeight; // offset to first baseline
	     var skip = 2*textHeight;   // skip between baselines	  
	     canvasY = getPowerOfTwo(offset + text.length*skip);
	     canvas.width = canvasX;
	     canvas.height = canvasY;
	     ctx.fillStyle = backgroundColour;
	     ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
	     ctx.fillStyle = textColour;
	     ctx.textAlign = "left";
	     ctx.textBaseline = "alphabetic";
	     ctx.font = textHeight+"px "+fontFamily;
	     for(var i = 0; i < text.length; i++) {
	       textY = i*skip + offset;
	       ctx.fillText(text[i], 0,  textY);
	     }
	     return {canvasX:canvasX, canvasY:canvasY,
	             widths:widths, textHeight:textHeight,
	             offset:offset, skip:skip};
	   }
	   // ****** points object 6 ******
	   var prog6  = gl.createProgram();
	   gl.attachShader(prog6, getShader( gl, "_2d_3d_pointsvshader6" ));
	   gl.attachShader(prog6, getShader( gl, "_2d_3d_pointsfshader6" ));
	   gl.linkProgram(prog6);
	   var v=new Float32Array([
	    -3.146906, -0.5712776, -1.304654, 1, 0, 0, 1,
	    -3.134337, 0.248515, -1.521878, 1, 0.007843138, 0, 1,
	    -3.105278, 0.4111612, -0.5294744, 1, 0.01176471, 0, 1,
	    -2.844787, 0.2585116, -3.378242, 1, 0.01960784, 0, 1,
	    -2.791817, 0.1122097, -1.978323, 1, 0.02352941, 0, 1,
	    -2.784959, -0.711042, -1.092817, 1, 0.03137255, 0, 1,
	    -2.559316, 0.7733727, -1.225769, 1, 0.03529412, 0, 1,
	    -2.507098, 0.926348, -1.363295, 1, 0.04313726, 0, 1,
	    -2.219861, -0.1773772, -2.665483, 1, 0.04705882, 0, 1,
	    -2.182233, 0.5145597, -0.2917455, 1, 0.05490196, 0, 1,
	    -2.175695, 0.409849, -0.7276564, 1, 0.05882353, 0, 1,
	    -2.123515, -1.553233, -3.529431, 1, 0.06666667, 0, 1,
	    -2.108868, 0.7112859, -2.601137, 1, 0.07058824, 0, 1,
	    -2.107958, 0.3210551, -2.226578, 1, 0.07843138, 0, 1,
	    -2.082845, -0.7608378, -0.9726609, 1, 0.08235294, 0, 1,
	    -2.075964, -0.417619, -2.095001, 1, 0.09019608, 0, 1,
	    -2.045905, -1.740814, -2.726324, 1, 0.09411765, 0, 1,
	    -2.015503, 0.5158128, 0.3482236, 1, 0.1019608, 0, 1,
	    -1.975963, -0.6694118, -0.9182349, 1, 0.1098039, 0, 1,
	    -1.975519, -0.6343129, -1.65338, 1, 0.1137255, 0, 1,
	    -1.906926, -0.09151675, -1.442231, 1, 0.1215686, 0, 1,
	    -1.904514, -0.4434961, -0.9564227, 1, 0.1254902, 0, 1,
	    -1.85512, 0.5082575, 0.1973629, 1, 0.1333333, 0, 1,
	    -1.822428, -0.5014544, -2.710975, 1, 0.1372549, 0, 1,
	    -1.797449, -0.3575618, -1.998557, 1, 0.145098, 0, 1,
	    -1.782416, 1.279261, -1.751515, 1, 0.1490196, 0, 1,
	    -1.763729, 0.5726739, -0.9573719, 1, 0.1568628, 0, 1,
	    -1.763319, -0.7835662, -1.334636, 1, 0.1607843, 0, 1,
	    -1.742096, -0.9785421, -2.791204, 1, 0.1686275, 0, 1,
	    -1.700091, -1.819068, -1.916485, 1, 0.172549, 0, 1,
	    -1.68357, 1.154099, -1.988515, 1, 0.1803922, 0, 1,
	    -1.669532, -0.248904, -0.5265087, 1, 0.1843137, 0, 1,
	    -1.668744, -0.6991448, -1.238914, 1, 0.1921569, 0, 1,
	    -1.667124, 0.1051634, -0.9729878, 1, 0.1960784, 0, 1,
	    -1.654439, 0.3109881, -1.270912, 1, 0.2039216, 0, 1,
	    -1.646071, -1.072061, -2.164583, 1, 0.2117647, 0, 1,
	    -1.643901, 0.4731493, -0.5499268, 1, 0.2156863, 0, 1,
	    -1.614742, -0.6113654, -3.146717, 1, 0.2235294, 0, 1,
	    -1.614431, 0.3969905, -0.01469224, 1, 0.227451, 0, 1,
	    -1.602143, 1.321779, -1.702532, 1, 0.2352941, 0, 1,
	    -1.578714, -0.6235344, -1.455792, 1, 0.2392157, 0, 1,
	    -1.568384, 0.8056578, -0.1188443, 1, 0.2470588, 0, 1,
	    -1.564701, 0.4206351, -1.274573, 1, 0.2509804, 0, 1,
	    -1.548427, -0.3611487, -1.965855, 1, 0.2588235, 0, 1,
	    -1.545828, 0.8012204, 1.728047, 1, 0.2627451, 0, 1,
	    -1.539553, -0.6062017, -0.8984288, 1, 0.2705882, 0, 1,
	    -1.523834, -2.172777, -0.5945879, 1, 0.2745098, 0, 1,
	    -1.514153, 1.109383, 0.2944165, 1, 0.282353, 0, 1,
	    -1.510714, 0.7304044, -1.373346, 1, 0.2862745, 0, 1,
	    -1.478655, -0.2409343, -0.6857944, 1, 0.2941177, 0, 1,
	    -1.441429, 0.04861115, -1.787688, 1, 0.3019608, 0, 1,
	    -1.423033, 1.2977, -0.1867998, 1, 0.3058824, 0, 1,
	    -1.419441, 0.6224449, -2.11411, 1, 0.3137255, 0, 1,
	    -1.408561, -0.6275776, -3.129275, 1, 0.3176471, 0, 1,
	    -1.405361, -1.414594, -1.85091, 1, 0.3254902, 0, 1,
	    -1.403119, -1.053484, -0.9741056, 1, 0.3294118, 0, 1,
	    -1.353278, 0.1074707, -0.7104663, 1, 0.3372549, 0, 1,
	    -1.350894, 1.399289, 1.547451, 1, 0.3411765, 0, 1,
	    -1.350585, -1.494398, -1.915541, 1, 0.3490196, 0, 1,
	    -1.350136, 0.158276, -1.801652, 1, 0.3529412, 0, 1,
	    -1.348556, 0.3851964, -1.102027, 1, 0.3607843, 0, 1,
	    -1.344257, 0.2971409, -1.088968, 1, 0.3647059, 0, 1,
	    -1.342256, -0.7882853, -3.550071, 1, 0.372549, 0, 1,
	    -1.331255, 0.8563269, -2.042815, 1, 0.3764706, 0, 1,
	    -1.330984, 0.6317903, -0.374843, 1, 0.3843137, 0, 1,
	    -1.329692, 0.6013628, -1.211427, 1, 0.3882353, 0, 1,
	    -1.323953, -0.885012, -1.614565, 1, 0.3960784, 0, 1,
	    -1.318757, 0.2187881, -0.8594832, 1, 0.4039216, 0, 1,
	    -1.316377, 0.8568754, -1.276602, 1, 0.4078431, 0, 1,
	    -1.304337, -0.4078288, -2.24041, 1, 0.4156863, 0, 1,
	    -1.299299, 0.6680412, -0.2038958, 1, 0.4196078, 0, 1,
	    -1.284557, 1.122775, -1.496067, 1, 0.427451, 0, 1,
	    -1.270918, -0.05961537, -2.034209, 1, 0.4313726, 0, 1,
	    -1.270175, 1.671815, 0.02826078, 1, 0.4392157, 0, 1,
	    -1.266914, -1.131811, -3.476238, 1, 0.4431373, 0, 1,
	    -1.263694, -1.220749, -0.7848217, 1, 0.4509804, 0, 1,
	    -1.261683, 1.072679, -1.486606, 1, 0.454902, 0, 1,
	    -1.258951, 0.3480777, -0.9418088, 1, 0.4627451, 0, 1,
	    -1.256753, -0.7612935, -1.25694, 1, 0.4666667, 0, 1,
	    -1.254661, 0.005102762, -2.537105, 1, 0.4745098, 0, 1,
	    -1.253345, 1.361341, -2.024161, 1, 0.4784314, 0, 1,
	    -1.2522, 0.8167412, -1.034257, 1, 0.4862745, 0, 1,
	    -1.248363, -0.766192, -1.972353, 1, 0.4901961, 0, 1,
	    -1.242884, -0.2611029, -0.9402236, 1, 0.4980392, 0, 1,
	    -1.242698, -0.99998, -3.090504, 1, 0.5058824, 0, 1,
	    -1.242606, 1.597389, 0.2824649, 1, 0.509804, 0, 1,
	    -1.240279, 1.457333, -1.962362, 1, 0.5176471, 0, 1,
	    -1.234339, -0.01223461, -1.659283, 1, 0.5215687, 0, 1,
	    -1.22696, -0.6901382, -1.96381, 1, 0.5294118, 0, 1,
	    -1.217991, 1.482551, -2.592246, 1, 0.5333334, 0, 1,
	    -1.204893, -0.3863956, -0.406497, 1, 0.5411765, 0, 1,
	    -1.203505, 0.704877, -1.922794, 1, 0.5450981, 0, 1,
	    -1.198965, 1.780028, -0.6224378, 1, 0.5529412, 0, 1,
	    -1.180786, -1.684559, -1.381659, 1, 0.5568628, 0, 1,
	    -1.177147, 1.293021, -2.23198, 1, 0.5647059, 0, 1,
	    -1.175963, 0.8844612, -0.9076601, 1, 0.5686275, 0, 1,
	    -1.169231, -1.966052, -3.258402, 1, 0.5764706, 0, 1,
	    -1.16338, 0.2019109, -0.2026392, 1, 0.5803922, 0, 1,
	    -1.162047, -0.158064, -2.22184, 1, 0.5882353, 0, 1,
	    -1.160422, 0.8181173, -3.090211, 1, 0.5921569, 0, 1,
	    -1.143501, -1.139719, -2.174399, 1, 0.6, 0, 1,
	    -1.13811, -1.547854, -3.938524, 1, 0.6078432, 0, 1,
	    -1.12428, -1.954584, -3.690095, 1, 0.6117647, 0, 1,
	    -1.099015, -0.3165934, -2.808158, 1, 0.6196079, 0, 1,
	    -1.083318, -0.2172817, -2.306851, 1, 0.6235294, 0, 1,
	    -1.077073, -0.4354704, -2.805918, 1, 0.6313726, 0, 1,
	    -1.069129, 0.2470699, -1.037625, 1, 0.6352941, 0, 1,
	    -1.063868, 1.489288, -1.91411, 1, 0.6431373, 0, 1,
	    -1.056137, -0.112663, -2.033748, 1, 0.6470588, 0, 1,
	    -1.051814, 0.4170049, -0.9544704, 1, 0.654902, 0, 1,
	    -1.050652, 0.4397123, -0.4781988, 1, 0.6588235, 0, 1,
	    -1.046518, -1.395492, -0.9369832, 1, 0.6666667, 0, 1,
	    -1.043192, 1.424446, 1.331642, 1, 0.6705883, 0, 1,
	    -1.042061, 0.6473455, -2.174601, 1, 0.6784314, 0, 1,
	    -1.036252, 1.121711, 0.7223151, 1, 0.682353, 0, 1,
	    -1.023946, 1.574672, -1.524623, 1, 0.6901961, 0, 1,
	    -1.019738, 0.9291021, -1.079201, 1, 0.6941177, 0, 1,
	    -1.011781, -1.683624, -3.193164, 1, 0.7019608, 0, 1,
	    -1.006389, 0.4458798, -1.864044, 1, 0.7098039, 0, 1,
	    -0.9992222, -0.3342909, -1.045937, 1, 0.7137255, 0, 1,
	    -0.9987044, 0.4009832, -1.739187, 1, 0.7215686, 0, 1,
	    -0.9906636, 0.3365992, -0.1872034, 1, 0.7254902, 0, 1,
	    -0.9885818, -0.6630397, -3.011725, 1, 0.7333333, 0, 1,
	    -0.9858498, -0.6165054, -2.871337, 1, 0.7372549, 0, 1,
	    -0.9637575, 0.2259502, -2.846959, 1, 0.7450981, 0, 1,
	    -0.9609846, 0.1987238, -2.750869, 1, 0.7490196, 0, 1,
	    -0.9564541, 0.1054265, -2.44845, 1, 0.7568628, 0, 1,
	    -0.9484985, -0.1368229, -2.273682, 1, 0.7607843, 0, 1,
	    -0.9462824, -2.453158, -2.793691, 1, 0.7686275, 0, 1,
	    -0.9410186, 0.2286697, -0.02012112, 1, 0.772549, 0, 1,
	    -0.9350691, 0.7474854, -0.5998926, 1, 0.7803922, 0, 1,
	    -0.9338174, -0.6736547, -3.541515, 1, 0.7843137, 0, 1,
	    -0.9333303, -0.4228021, -1.356742, 1, 0.7921569, 0, 1,
	    -0.9285724, 0.7868004, -0.6114022, 1, 0.7960784, 0, 1,
	    -0.9274378, 0.1899723, -2.554821, 1, 0.8039216, 0, 1,
	    -0.9270687, -1.086267, -2.73507, 1, 0.8117647, 0, 1,
	    -0.9241491, 0.651414, -1.696126, 1, 0.8156863, 0, 1,
	    -0.9224845, -1.213655, -3.862764, 1, 0.8235294, 0, 1,
	    -0.9105715, 0.1732961, -0.8506026, 1, 0.827451, 0, 1,
	    -0.9014618, 0.8663479, -0.6602482, 1, 0.8352941, 0, 1,
	    -0.896875, -1.584243, 0.06355696, 1, 0.8392157, 0, 1,
	    -0.8922928, -0.734427, -1.48562, 1, 0.8470588, 0, 1,
	    -0.8915675, -0.508348, -0.9729213, 1, 0.8509804, 0, 1,
	    -0.8900894, 2.449038, 1.072617, 1, 0.8588235, 0, 1,
	    -0.8895386, 0.884676, -1.855799, 1, 0.8627451, 0, 1,
	    -0.8813864, 0.602551, -0.7905866, 1, 0.8705882, 0, 1,
	    -0.8769144, 0.4863247, -2.000475, 1, 0.8745098, 0, 1,
	    -0.8759423, -1.255609, -1.5528, 1, 0.8823529, 0, 1,
	    -0.8731839, 0.2577762, -1.697623, 1, 0.8862745, 0, 1,
	    -0.8676267, 0.3076334, -1.42433, 1, 0.8941177, 0, 1,
	    -0.861423, -0.4365948, -0.5851231, 1, 0.8980392, 0, 1,
	    -0.8579227, -1.79311, -4.317077, 1, 0.9058824, 0, 1,
	    -0.8567008, -1.050415, -2.989239, 1, 0.9137255, 0, 1,
	    -0.8562334, 2.048608, -0.215252, 1, 0.9176471, 0, 1,
	    -0.8479262, 1.40403, 0.6415924, 1, 0.9254902, 0, 1,
	    -0.8451576, 1.887418, -0.6090735, 1, 0.9294118, 0, 1,
	    -0.8439097, 0.5406764, -1.715353, 1, 0.9372549, 0, 1,
	    -0.8433421, 0.4210153, 0.1196949, 1, 0.9411765, 0, 1,
	    -0.8427588, -1.276794, -2.68511, 1, 0.9490196, 0, 1,
	    -0.8348377, 2.08715, -2.062088, 1, 0.9529412, 0, 1,
	    -0.8339448, 0.8461385, -1.665005, 1, 0.9607843, 0, 1,
	    -0.8280094, 1.0042, -2.274293, 1, 0.9647059, 0, 1,
	    -0.8266994, -0.03096794, -0.04414596, 1, 0.972549, 0, 1,
	    -0.8258437, -0.6556534, -0.5602338, 1, 0.9764706, 0, 1,
	    -0.8251136, 0.4861742, -0.417044, 1, 0.9843137, 0, 1,
	    -0.8247356, 0.6820828, -1.278578, 1, 0.9882353, 0, 1,
	    -0.8203144, -1.276851, -3.019026, 1, 0.9960784, 0, 1,
	    -0.8177901, 0.3213887, -0.7713414, 0.9960784, 1, 0, 1,
	    -0.8165891, -0.7036674, -4.15295, 0.9921569, 1, 0, 1,
	    -0.8150407, 0.6713377, -0.7895522, 0.9843137, 1, 0, 1,
	    -0.8138458, -1.249855, -2.435738, 0.9803922, 1, 0, 1,
	    -0.8114775, 0.03451108, -1.630864, 0.972549, 1, 0, 1,
	    -0.8100463, -0.385196, -4.028915, 0.9686275, 1, 0, 1,
	    -0.8095151, -0.1198825, -3.076871, 0.9607843, 1, 0, 1,
	    -0.8037989, 1.372023, -1.905989, 0.9568627, 1, 0, 1,
	    -0.7980696, 1.944187, 0.6418205, 0.9490196, 1, 0, 1,
	    -0.7976149, 2.442152, -2.631703, 0.945098, 1, 0, 1,
	    -0.7969353, 1.091605, -0.7113526, 0.9372549, 1, 0, 1,
	    -0.7918938, -0.05553446, -1.166415, 0.9333333, 1, 0, 1,
	    -0.7845574, 0.1485611, -0.6848181, 0.9254902, 1, 0, 1,
	    -0.7807397, 0.1970667, -0.9168099, 0.9215686, 1, 0, 1,
	    -0.773112, -0.6765202, -2.873966, 0.9137255, 1, 0, 1,
	    -0.7723824, 0.2148958, -0.6569834, 0.9098039, 1, 0, 1,
	    -0.7720271, 0.6960204, 1.116547, 0.9019608, 1, 0, 1,
	    -0.7702914, -1.017149, -1.025351, 0.8941177, 1, 0, 1,
	    -0.7692175, 0.3225454, -0.5279848, 0.8901961, 1, 0, 1,
	    -0.7692167, 0.1178737, -2.262358, 0.8823529, 1, 0, 1,
	    -0.7633673, -0.5374758, -2.184233, 0.8784314, 1, 0, 1,
	    -0.7600652, -0.6135046, -0.9990761, 0.8705882, 1, 0, 1,
	    -0.7590914, 1.005812, 0.6560819, 0.8666667, 1, 0, 1,
	    -0.7571398, 0.2669497, -1.779227, 0.8588235, 1, 0, 1,
	    -0.7534277, -1.300633, -2.55425, 0.854902, 1, 0, 1,
	    -0.746401, 0.9671679, -0.3548419, 0.8470588, 1, 0, 1,
	    -0.7399771, 1.083189, -2.172747, 0.8431373, 1, 0, 1,
	    -0.7378447, -0.6015003, -2.562219, 0.8352941, 1, 0, 1,
	    -0.7292724, -1.768666, -2.287215, 0.8313726, 1, 0, 1,
	    -0.7283937, 0.9216552, -1.130372, 0.8235294, 1, 0, 1,
	    -0.7219724, -0.7795299, -2.520902, 0.8196079, 1, 0, 1,
	    -0.7207498, -1.113274, -1.967158, 0.8117647, 1, 0, 1,
	    -0.7187565, 1.472141, -1.299803, 0.8078431, 1, 0, 1,
	    -0.7144001, 0.3179776, -2.145253, 0.8, 1, 0, 1,
	    -0.698133, -1.594768, -4.333265, 0.7921569, 1, 0, 1,
	    -0.6925234, -0.5931301, -0.4367567, 0.7882353, 1, 0, 1,
	    -0.6881326, 0.7885892, -1.950298, 0.7803922, 1, 0, 1,
	    -0.6774251, 1.093204, -1.18088, 0.7764706, 1, 0, 1,
	    -0.6714011, -0.6395965, -1.193849, 0.7686275, 1, 0, 1,
	    -0.6706638, 2.312945, -1.669243, 0.7647059, 1, 0, 1,
	    -0.6704843, -1.459646, -2.46984, 0.7568628, 1, 0, 1,
	    -0.6683666, 0.3225191, -0.2641588, 0.7529412, 1, 0, 1,
	    -0.6663373, 0.1425802, -1.85336, 0.7450981, 1, 0, 1,
	    -0.6633891, -0.5392434, -3.028617, 0.7411765, 1, 0, 1,
	    -0.6608772, -1.168995, -2.651999, 0.7333333, 1, 0, 1,
	    -0.6581141, -0.08257785, -1.905536, 0.7294118, 1, 0, 1,
	    -0.6568323, 1.534663, 1.520873, 0.7215686, 1, 0, 1,
	    -0.6503637, -2.063147, -2.144985, 0.7176471, 1, 0, 1,
	    -0.6501253, -0.7646272, -2.667742, 0.7098039, 1, 0, 1,
	    -0.6499103, 0.2876472, -2.293922, 0.7058824, 1, 0, 1,
	    -0.6393084, -0.2631749, -2.032567, 0.6980392, 1, 0, 1,
	    -0.6341143, -0.2899572, -1.287892, 0.6901961, 1, 0, 1,
	    -0.6325483, 0.1316676, -2.527893, 0.6862745, 1, 0, 1,
	    -0.6324074, 1.605149, 0.8613677, 0.6784314, 1, 0, 1,
	    -0.6296275, -0.7818165, -3.349368, 0.6745098, 1, 0, 1,
	    -0.6254754, -0.311826, -2.125525, 0.6666667, 1, 0, 1,
	    -0.6250575, 0.8057449, -1.24985, 0.6627451, 1, 0, 1,
	    -0.6234838, 0.410206, -1.474074, 0.654902, 1, 0, 1,
	    -0.6201516, -0.9955272, -0.6796204, 0.6509804, 1, 0, 1,
	    -0.6180312, -0.2337765, -2.067816, 0.6431373, 1, 0, 1,
	    -0.6166437, -0.2005289, -1.678214, 0.6392157, 1, 0, 1,
	    -0.6138217, 0.2034352, -1.249851, 0.6313726, 1, 0, 1,
	    -0.6110006, 1.402202, -1.15887, 0.627451, 1, 0, 1,
	    -0.6108452, -1.02281, -3.897901, 0.6196079, 1, 0, 1,
	    -0.6081173, -0.3934186, -1.15633, 0.6156863, 1, 0, 1,
	    -0.6078006, 0.1552292, 0.1578512, 0.6078432, 1, 0, 1,
	    -0.604095, -0.2144339, -2.049018, 0.6039216, 1, 0, 1,
	    -0.6037118, -1.442537, -2.77374, 0.5960785, 1, 0, 1,
	    -0.6035097, 0.5289484, -0.4048283, 0.5882353, 1, 0, 1,
	    -0.600808, -1.956989, -2.579975, 0.5843138, 1, 0, 1,
	    -0.5990881, -0.4800493, -2.852541, 0.5764706, 1, 0, 1,
	    -0.597191, 0.7598799, -1.60397, 0.572549, 1, 0, 1,
	    -0.5966045, 0.6119961, -0.4447828, 0.5647059, 1, 0, 1,
	    -0.5959867, -0.4076791, -1.910798, 0.5607843, 1, 0, 1,
	    -0.5944453, 0.9104955, 0.05282759, 0.5529412, 1, 0, 1,
	    -0.5941672, 0.9183374, 0.8773606, 0.5490196, 1, 0, 1,
	    -0.5890618, -0.1920007, -3.165771, 0.5411765, 1, 0, 1,
	    -0.5838025, -1.856761, -1.05959, 0.5372549, 1, 0, 1,
	    -0.5808733, 0.4331484, -1.716445, 0.5294118, 1, 0, 1,
	    -0.5805127, 2.141285, 0.126408, 0.5254902, 1, 0, 1,
	    -0.5803594, 0.9050992, 1.498898, 0.5176471, 1, 0, 1,
	    -0.5768038, -0.2484804, -1.961669, 0.5137255, 1, 0, 1,
	    -0.5755417, -0.9629737, -3.25248, 0.5058824, 1, 0, 1,
	    -0.57231, 0.7343075, -0.3094182, 0.5019608, 1, 0, 1,
	    -0.5722368, -1.027968, -3.677606, 0.4941176, 1, 0, 1,
	    -0.5676376, 0.7835763, 0.4413729, 0.4862745, 1, 0, 1,
	    -0.5637824, 0.3480551, -0.6315777, 0.4823529, 1, 0, 1,
	    -0.5630603, -0.8797238, -3.140658, 0.4745098, 1, 0, 1,
	    -0.5624196, -2.505322, -0.4070503, 0.4705882, 1, 0, 1,
	    -0.5595977, 0.8344491, -0.051674, 0.4627451, 1, 0, 1,
	    -0.5588534, 0.4508642, -2.695847, 0.4588235, 1, 0, 1,
	    -0.5562833, 0.1754092, -0.9679792, 0.4509804, 1, 0, 1,
	    -0.556233, 1.973876, 1.226979, 0.4470588, 1, 0, 1,
	    -0.5544715, -0.3478633, -1.486561, 0.4392157, 1, 0, 1,
	    -0.5542025, 0.5521333, -0.9708505, 0.4352941, 1, 0, 1,
	    -0.5534842, 0.4935877, 0.1988247, 0.427451, 1, 0, 1,
	    -0.5505091, -2.71785, -3.262528, 0.4235294, 1, 0, 1,
	    -0.5482972, -0.3088809, -2.189965, 0.4156863, 1, 0, 1,
	    -0.5482841, 0.3156894, -2.417357, 0.4117647, 1, 0, 1,
	    -0.5476352, -2.035521, -2.919295, 0.4039216, 1, 0, 1,
	    -0.5433849, -0.8061776, -2.904838, 0.3960784, 1, 0, 1,
	    -0.5407544, -0.3418379, -1.3983, 0.3921569, 1, 0, 1,
	    -0.5407423, 1.875264, 0.1397846, 0.3843137, 1, 0, 1,
	    -0.5386612, 0.0359333, -1.856493, 0.3803922, 1, 0, 1,
	    -0.5365623, -0.8798941, -2.095544, 0.372549, 1, 0, 1,
	    -0.5353712, -0.185546, -2.766385, 0.3686275, 1, 0, 1,
	    -0.5329637, -0.7479315, -4.18485, 0.3607843, 1, 0, 1,
	    -0.5327457, -0.4302462, -1.767011, 0.3568628, 1, 0, 1,
	    -0.5277362, 1.995825, 1.078273, 0.3490196, 1, 0, 1,
	    -0.5274831, -0.08972351, -1.623962, 0.345098, 1, 0, 1,
	    -0.5239906, -2.080991, -1.643902, 0.3372549, 1, 0, 1,
	    -0.5238396, -1.119969, -3.003465, 0.3333333, 1, 0, 1,
	    -0.5221364, 1.233639, -0.0353597, 0.3254902, 1, 0, 1,
	    -0.5203137, -2.533156, -3.13496, 0.3215686, 1, 0, 1,
	    -0.5175972, 1.813367, -1.060525, 0.3137255, 1, 0, 1,
	    -0.5174648, -0.6151349, -3.830195, 0.3098039, 1, 0, 1,
	    -0.5167973, -1.096893, -3.772897, 0.3019608, 1, 0, 1,
	    -0.5160482, -1.02983, -1.740719, 0.2941177, 1, 0, 1,
	    -0.5149626, 1.206922, -0.1737793, 0.2901961, 1, 0, 1,
	    -0.5107267, -1.568057, -1.600756, 0.282353, 1, 0, 1,
	    -0.508549, 1.232373, -0.3814973, 0.2784314, 1, 0, 1,
	    -0.5062495, -2.509341, -3.043851, 0.2705882, 1, 0, 1,
	    -0.5058689, -1.41598, -0.3344893, 0.2666667, 1, 0, 1,
	    -0.5056818, -0.9429926, -1.472941, 0.2588235, 1, 0, 1,
	    -0.504693, -0.7804936, -1.870265, 0.254902, 1, 0, 1,
	    -0.5022391, -0.7806193, -1.047498, 0.2470588, 1, 0, 1,
	    -0.5022026, 0.1302363, -1.469969, 0.2431373, 1, 0, 1,
	    -0.4972048, 0.1495005, -0.8163399, 0.2352941, 1, 0, 1,
	    -0.4968185, 0.9255279, -1.278087, 0.2313726, 1, 0, 1,
	    -0.4899775, 0.4339317, -0.0355177, 0.2235294, 1, 0, 1,
	    -0.4821446, 1.210129, -1.051643, 0.2196078, 1, 0, 1,
	    -0.4785571, -0.9228835, -2.204039, 0.2117647, 1, 0, 1,
	    -0.4755331, -0.5838196, -2.591827, 0.2078431, 1, 0, 1,
	    -0.4715798, 0.4418818, -0.8419792, 0.2, 1, 0, 1,
	    -0.4678596, -0.8590072, -2.540234, 0.1921569, 1, 0, 1,
	    -0.4658183, -0.9836263, -3.522256, 0.1882353, 1, 0, 1,
	    -0.4655098, 0.2730663, -0.4474838, 0.1803922, 1, 0, 1,
	    -0.4642281, -0.2957813, -3.42211, 0.1764706, 1, 0, 1,
	    -0.4592587, -1.141325, -2.443703, 0.1686275, 1, 0, 1,
	    -0.4585588, 1.111784, 1.493338, 0.1647059, 1, 0, 1,
	    -0.4577912, 0.7822915, -0.6320353, 0.1568628, 1, 0, 1,
	    -0.4374818, 0.4828807, -0.7506601, 0.1529412, 1, 0, 1,
	    -0.4372454, -1.618357, -1.792162, 0.145098, 1, 0, 1,
	    -0.4337441, -0.1100942, -1.306092, 0.1411765, 1, 0, 1,
	    -0.4290987, 1.80997, -1.779823, 0.1333333, 1, 0, 1,
	    -0.4282664, 0.4472926, -0.511809, 0.1294118, 1, 0, 1,
	    -0.4272493, 0.3903974, -0.5387366, 0.1215686, 1, 0, 1,
	    -0.4223464, -0.2574878, -2.805543, 0.1176471, 1, 0, 1,
	    -0.4212975, -0.5984384, -2.017767, 0.1098039, 1, 0, 1,
	    -0.4199424, -0.7147787, -2.581635, 0.1058824, 1, 0, 1,
	    -0.4192354, 1.339764, -0.9549408, 0.09803922, 1, 0, 1,
	    -0.4186761, 0.5152234, -2.928306, 0.09019608, 1, 0, 1,
	    -0.4185404, 1.134547, -1.857512, 0.08627451, 1, 0, 1,
	    -0.4110831, 1.5233, 1.201643, 0.07843138, 1, 0, 1,
	    -0.4090314, -1.088871, -2.120044, 0.07450981, 1, 0, 1,
	    -0.4081623, -0.3464304, -2.631243, 0.06666667, 1, 0, 1,
	    -0.4073839, -0.2174345, 0.2535879, 0.0627451, 1, 0, 1,
	    -0.40403, -0.3297348, -1.583895, 0.05490196, 1, 0, 1,
	    -0.4037551, -1.002485, -2.307231, 0.05098039, 1, 0, 1,
	    -0.4010081, 1.645148, 0.01662885, 0.04313726, 1, 0, 1,
	    -0.3983037, -0.07565211, -3.252917, 0.03921569, 1, 0, 1,
	    -0.3955089, -0.1296063, -1.610743, 0.03137255, 1, 0, 1,
	    -0.3946153, -0.05112975, -1.068483, 0.02745098, 1, 0, 1,
	    -0.3938779, 0.3542585, -0.3829606, 0.01960784, 1, 0, 1,
	    -0.3901234, 0.5057293, -0.508234, 0.01568628, 1, 0, 1,
	    -0.3895523, 1.928361, -0.6577095, 0.007843138, 1, 0, 1,
	    -0.3883483, 0.1644049, -0.6534674, 0.003921569, 1, 0, 1,
	    -0.3881361, 0.158911, -1.266313, 0, 1, 0.003921569, 1,
	    -0.382921, -0.5437154, -3.201255, 0, 1, 0.01176471, 1,
	    -0.3780563, 1.00523, 0.9527998, 0, 1, 0.01568628, 1,
	    -0.3776144, 0.3596236, -0.3224455, 0, 1, 0.02352941, 1,
	    -0.3744657, -0.4089455, -2.730864, 0, 1, 0.02745098, 1,
	    -0.3691164, 0.3924235, -0.04163681, 0, 1, 0.03529412, 1,
	    -0.3681612, 0.8484211, -0.4331209, 0, 1, 0.03921569, 1,
	    -0.3658142, -0.1259927, -2.787268, 0, 1, 0.04705882, 1,
	    -0.3656541, -1.769258, -3.264807, 0, 1, 0.05098039, 1,
	    -0.3621577, 0.5186518, -1.26929, 0, 1, 0.05882353, 1,
	    -0.3594102, 0.5993645, -0.2667509, 0, 1, 0.0627451, 1,
	    -0.3585275, -0.466471, -2.217079, 0, 1, 0.07058824, 1,
	    -0.355275, -0.9844773, -2.703272, 0, 1, 0.07450981, 1,
	    -0.3527319, 1.359403, 0.5999845, 0, 1, 0.08235294, 1,
	    -0.352475, -0.7707894, -2.402272, 0, 1, 0.08627451, 1,
	    -0.3520515, 0.2696897, -0.6723036, 0, 1, 0.09411765, 1,
	    -0.3492198, -0.7094553, -2.803467, 0, 1, 0.1019608, 1,
	    -0.3480962, 1.624813, 0.07259585, 0, 1, 0.1058824, 1,
	    -0.344635, -1.482004, -1.800469, 0, 1, 0.1137255, 1,
	    -0.3442965, -0.3376086, -2.692225, 0, 1, 0.1176471, 1,
	    -0.3441124, 0.8602437, 0.6817973, 0, 1, 0.1254902, 1,
	    -0.3380788, -0.4874431, -4.421466, 0, 1, 0.1294118, 1,
	    -0.3368179, 2.410093, -0.4199505, 0, 1, 0.1372549, 1,
	    -0.3365316, 0.6248595, -2.435249, 0, 1, 0.1411765, 1,
	    -0.3338947, -0.5421219, -2.431083, 0, 1, 0.1490196, 1,
	    -0.333557, -0.3628028, -1.072562, 0, 1, 0.1529412, 1,
	    -0.3317678, 0.9199321, -0.6055669, 0, 1, 0.1607843, 1,
	    -0.330737, -1.978217, -2.582861, 0, 1, 0.1647059, 1,
	    -0.3260545, 0.06898483, -0.333717, 0, 1, 0.172549, 1,
	    -0.3215501, 1.083413, -0.171606, 0, 1, 0.1764706, 1,
	    -0.313439, 0.8701847, -1.105385, 0, 1, 0.1843137, 1,
	    -0.3124214, -0.04303386, -1.402502, 0, 1, 0.1882353, 1,
	    -0.3110935, 1.142621, -1.690594, 0, 1, 0.1960784, 1,
	    -0.3094802, -0.5113324, -2.595321, 0, 1, 0.2039216, 1,
	    -0.3094503, 0.01566579, -2.37246, 0, 1, 0.2078431, 1,
	    -0.3081426, 0.534472, 0.5742407, 0, 1, 0.2156863, 1,
	    -0.3036126, -0.1781094, -1.348739, 0, 1, 0.2196078, 1,
	    -0.3032993, -1.335325, -3.395204, 0, 1, 0.227451, 1,
	    -0.3026674, 0.4504538, 0.2771848, 0, 1, 0.2313726, 1,
	    -0.3020836, 0.3269546, -0.7411179, 0, 1, 0.2392157, 1,
	    -0.3019416, 0.3453073, -1.854304, 0, 1, 0.2431373, 1,
	    -0.2998228, -0.1004444, -2.320544, 0, 1, 0.2509804, 1,
	    -0.2951051, -0.7609642, -2.653528, 0, 1, 0.254902, 1,
	    -0.2829821, -1.527421, -3.078332, 0, 1, 0.2627451, 1,
	    -0.2826391, -1.579932, -2.567279, 0, 1, 0.2666667, 1,
	    -0.2782823, -1.49829, -3.481922, 0, 1, 0.2745098, 1,
	    -0.2739094, -0.02716695, -1.061899, 0, 1, 0.2784314, 1,
	    -0.273807, 1.293368, 0.6527152, 0, 1, 0.2862745, 1,
	    -0.2701552, 1.12544, -0.3593934, 0, 1, 0.2901961, 1,
	    -0.2697906, -0.4814015, -1.602767, 0, 1, 0.2980392, 1,
	    -0.2687963, 0.3146024, -0.02789904, 0, 1, 0.3058824, 1,
	    -0.2669718, -0.04393019, -0.305895, 0, 1, 0.3098039, 1,
	    -0.2646875, 2.250575, 0.4976667, 0, 1, 0.3176471, 1,
	    -0.2628971, -1.139807, -2.771086, 0, 1, 0.3215686, 1,
	    -0.2616044, 0.8398768, -0.9705845, 0, 1, 0.3294118, 1,
	    -0.2613579, -0.662352, -3.023235, 0, 1, 0.3333333, 1,
	    -0.2589692, 1.269843, 1.784347, 0, 1, 0.3411765, 1,
	    -0.2559773, -0.03987281, -1.531622, 0, 1, 0.345098, 1,
	    -0.2540849, 1.077409, 0.7009481, 0, 1, 0.3529412, 1,
	    -0.2519991, 0.5422587, -1.459898, 0, 1, 0.3568628, 1,
	    -0.2518965, -1.451766, -1.316867, 0, 1, 0.3647059, 1,
	    -0.2497863, -1.709049, -4.173556, 0, 1, 0.3686275, 1,
	    -0.2494824, -0.01369181, -2.982078, 0, 1, 0.3764706, 1,
	    -0.2489398, 1.074033, -0.1772438, 0, 1, 0.3803922, 1,
	    -0.2464253, -0.4828018, -3.049135, 0, 1, 0.3882353, 1,
	    -0.2449035, -0.4857075, -1.202632, 0, 1, 0.3921569, 1,
	    -0.241074, -0.1957724, -1.091178, 0, 1, 0.4, 1,
	    -0.2408574, 1.36362, 0.4192437, 0, 1, 0.4078431, 1,
	    -0.2389979, 1.342056, -0.7444946, 0, 1, 0.4117647, 1,
	    -0.2379653, -0.6410658, -3.232724, 0, 1, 0.4196078, 1,
	    -0.2357378, 0.3535997, -2.397672, 0, 1, 0.4235294, 1,
	    -0.2295292, -2.288062, -3.258923, 0, 1, 0.4313726, 1,
	    -0.2275949, -1.644812, -3.401342, 0, 1, 0.4352941, 1,
	    -0.2258574, 0.5265185, -2.456925, 0, 1, 0.4431373, 1,
	    -0.21882, -0.1689301, -2.553904, 0, 1, 0.4470588, 1,
	    -0.2181713, -1.539013, -2.828825, 0, 1, 0.454902, 1,
	    -0.2173591, 0.7394462, 0.03918895, 0, 1, 0.4588235, 1,
	    -0.2072974, -2.060975, -3.772219, 0, 1, 0.4666667, 1,
	    -0.203924, 0.2766502, -0.2344728, 0, 1, 0.4705882, 1,
	    -0.2013895, 0.8521972, -1.752884, 0, 1, 0.4784314, 1,
	    -0.2011171, -0.7694003, -3.334274, 0, 1, 0.4823529, 1,
	    -0.1997897, -0.1248894, -2.778023, 0, 1, 0.4901961, 1,
	    -0.1967926, 1.772658, 1.957504, 0, 1, 0.4941176, 1,
	    -0.1958932, 1.060793, 1.085092, 0, 1, 0.5019608, 1,
	    -0.1946303, -0.9888282, -1.947513, 0, 1, 0.509804, 1,
	    -0.1917287, 0.7360084, 0.1712901, 0, 1, 0.5137255, 1,
	    -0.1911082, 0.7397816, -1.04648, 0, 1, 0.5215687, 1,
	    -0.1874687, -0.2764769, -2.262976, 0, 1, 0.5254902, 1,
	    -0.1873757, -1.039375, -2.843038, 0, 1, 0.5333334, 1,
	    -0.1851625, -0.9291976, -2.030553, 0, 1, 0.5372549, 1,
	    -0.1851138, 1.575213, 1.535333, 0, 1, 0.5450981, 1,
	    -0.1821494, -1.692657, -2.737273, 0, 1, 0.5490196, 1,
	    -0.1752969, 0.2940099, -2.626934, 0, 1, 0.5568628, 1,
	    -0.1659382, -2.441261, -2.809585, 0, 1, 0.5607843, 1,
	    -0.163654, -0.4527542, -1.356123, 0, 1, 0.5686275, 1,
	    -0.1606634, 2.991073, 0.4782645, 0, 1, 0.572549, 1,
	    -0.1576124, 0.3569745, 0.6303179, 0, 1, 0.5803922, 1,
	    -0.1534395, -0.954977, -2.653033, 0, 1, 0.5843138, 1,
	    -0.1522292, 0.7653247, 0.6416019, 0, 1, 0.5921569, 1,
	    -0.1509453, -0.2816854, -4.479161, 0, 1, 0.5960785, 1,
	    -0.1500672, -0.4382569, -3.302971, 0, 1, 0.6039216, 1,
	    -0.1473517, -1.503978, -4.498125, 0, 1, 0.6117647, 1,
	    -0.1461316, -0.1017964, -0.8142517, 0, 1, 0.6156863, 1,
	    -0.1423407, -0.2740314, -3.848071, 0, 1, 0.6235294, 1,
	    -0.1383621, 0.8806437, -0.4872388, 0, 1, 0.627451, 1,
	    -0.1373772, 0.5814228, 0.7706033, 0, 1, 0.6352941, 1,
	    -0.1325886, -1.971623, -4.304446, 0, 1, 0.6392157, 1,
	    -0.1284147, -0.1718713, -2.090194, 0, 1, 0.6470588, 1,
	    -0.1265674, -0.766098, -1.939488, 0, 1, 0.6509804, 1,
	    -0.123748, -1.918078, -3.924432, 0, 1, 0.6588235, 1,
	    -0.1233463, 0.1728626, -1.949802, 0, 1, 0.6627451, 1,
	    -0.1209411, -2.005036, -2.855737, 0, 1, 0.6705883, 1,
	    -0.1112446, -0.7321181, -1.39885, 0, 1, 0.6745098, 1,
	    -0.1104278, 1.746379, -1.114783, 0, 1, 0.682353, 1,
	    -0.1086822, 0.9327964, 0.5422625, 0, 1, 0.6862745, 1,
	    -0.1030602, 0.4069289, 0.3550104, 0, 1, 0.6941177, 1,
	    -0.1012124, 0.05825811, -1.153062, 0, 1, 0.7019608, 1,
	    -0.1005178, 0.8863389, -1.146608, 0, 1, 0.7058824, 1,
	    -0.09724838, -1.9825, -3.346423, 0, 1, 0.7137255, 1,
	    -0.08620283, 0.01753785, -1.443287, 0, 1, 0.7176471, 1,
	    -0.08267802, 1.633479, 0.5640126, 0, 1, 0.7254902, 1,
	    -0.07644721, 0.1216177, -0.1611494, 0, 1, 0.7294118, 1,
	    -0.07584929, -1.70791, -2.284637, 0, 1, 0.7372549, 1,
	    -0.07544135, -0.549445, -4.993936, 0, 1, 0.7411765, 1,
	    -0.07298101, 0.07622332, 0.2014921, 0, 1, 0.7490196, 1,
	    -0.07160003, 1.466032, 1.216336, 0, 1, 0.7529412, 1,
	    -0.06777745, 1.258644, -0.03803592, 0, 1, 0.7607843, 1,
	    -0.06746908, 0.5495446, 0.4309206, 0, 1, 0.7647059, 1,
	    -0.06438684, 0.3707801, -0.8757008, 0, 1, 0.772549, 1,
	    -0.06041819, 0.2087022, 0.0986514, 0, 1, 0.7764706, 1,
	    -0.05612661, -0.873939, -3.476143, 0, 1, 0.7843137, 1,
	    -0.05105953, -0.187751, -2.939152, 0, 1, 0.7882353, 1,
	    -0.05035799, 0.5416489, 1.336646, 0, 1, 0.7960784, 1,
	    -0.04806987, -0.3484504, -3.66882, 0, 1, 0.8039216, 1,
	    -0.04769731, 0.8468616, 1.061986, 0, 1, 0.8078431, 1,
	    -0.03893302, 0.1241221, -1.220656, 0, 1, 0.8156863, 1,
	    -0.03122259, 2.067839, -1.952612, 0, 1, 0.8196079, 1,
	    -0.02643794, -0.07515208, -3.652461, 0, 1, 0.827451, 1,
	    -0.02190245, -0.831677, -2.523222, 0, 1, 0.8313726, 1,
	    -0.01904898, 1.002635, -0.06830373, 0, 1, 0.8392157, 1,
	    -0.01882363, -0.1555776, -1.42546, 0, 1, 0.8431373, 1,
	    -0.006162655, 0.1417896, 0.2246207, 0, 1, 0.8509804, 1,
	    -0.001978099, -2.557477, -3.984644, 0, 1, 0.854902, 1,
	    -0.0006411519, 0.2711741, 0.7407174, 0, 1, 0.8627451, 1,
	    0.002684396, 0.1370125, -1.127363, 0, 1, 0.8666667, 1,
	    0.00935031, -0.5888843, 2.357699, 0, 1, 0.8745098, 1,
	    0.009396544, -0.7890562, 2.516465, 0, 1, 0.8784314, 1,
	    0.01474558, 2.896137, -0.7479557, 0, 1, 0.8862745, 1,
	    0.01885581, 0.6713749, -0.5047849, 0, 1, 0.8901961, 1,
	    0.01977203, 1.377004, 1.196761, 0, 1, 0.8980392, 1,
	    0.02135491, -0.7866012, 3.176321, 0, 1, 0.9058824, 1,
	    0.0214231, -0.6427302, 2.64819, 0, 1, 0.9098039, 1,
	    0.02344659, -0.2242682, 1.096097, 0, 1, 0.9176471, 1,
	    0.02346797, 0.32885, -0.8329481, 0, 1, 0.9215686, 1,
	    0.02433512, 1.59945, -0.3973347, 0, 1, 0.9294118, 1,
	    0.02707356, 0.6718062, -0.575007, 0, 1, 0.9333333, 1,
	    0.03152223, -0.3218891, 4.662323, 0, 1, 0.9411765, 1,
	    0.03337971, 0.9726634, -1.983114, 0, 1, 0.945098, 1,
	    0.03914932, -0.6249298, 3.6008, 0, 1, 0.9529412, 1,
	    0.04798634, 0.5140319, -0.9879534, 0, 1, 0.9568627, 1,
	    0.05140029, -0.9275215, 1.390923, 0, 1, 0.9647059, 1,
	    0.05256736, 0.5828131, -0.404224, 0, 1, 0.9686275, 1,
	    0.05495751, 0.5072066, -0.01825715, 0, 1, 0.9764706, 1,
	    0.05665368, -0.6852865, 3.482718, 0, 1, 0.9803922, 1,
	    0.05886716, -0.8506333, 3.191681, 0, 1, 0.9882353, 1,
	    0.06048632, 0.6184825, -1.52217, 0, 1, 0.9921569, 1,
	    0.06222105, -0.0799164, 3.586871, 0, 1, 1, 1,
	    0.0634957, -0.5704287, 2.86347, 0, 0.9921569, 1, 1,
	    0.06349958, 0.2222668, 0.193728, 0, 0.9882353, 1, 1,
	    0.06402669, 0.4744164, -0.4145285, 0, 0.9803922, 1, 1,
	    0.06409505, 1.274642, -0.3393115, 0, 0.9764706, 1, 1,
	    0.06591512, 0.4189887, -0.02887672, 0, 0.9686275, 1, 1,
	    0.0685517, 0.6649463, 0.3695101, 0, 0.9647059, 1, 1,
	    0.07128706, 0.1070163, 1.734852, 0, 0.9568627, 1, 1,
	    0.07447653, 1.856964, 0.09473345, 0, 0.9529412, 1, 1,
	    0.08023864, 0.6392882, -0.3772219, 0, 0.945098, 1, 1,
	    0.08412867, 0.4452681, -1.085224, 0, 0.9411765, 1, 1,
	    0.08694188, 0.5101318, -0.7955398, 0, 0.9333333, 1, 1,
	    0.09074077, -1.27671, 3.628413, 0, 0.9294118, 1, 1,
	    0.09245414, -0.6900249, 2.948334, 0, 0.9215686, 1, 1,
	    0.09577824, 1.073976, 0.5109665, 0, 0.9176471, 1, 1,
	    0.09730859, 0.3109652, -0.7046658, 0, 0.9098039, 1, 1,
	    0.0982546, 0.1197035, -0.3541018, 0, 0.9058824, 1, 1,
	    0.0993626, -0.9081126, 1.06977, 0, 0.8980392, 1, 1,
	    0.1005036, 0.5353631, 0.1420999, 0, 0.8901961, 1, 1,
	    0.1012065, 1.47328, -0.4447297, 0, 0.8862745, 1, 1,
	    0.1032722, 1.004504, 1.504925, 0, 0.8784314, 1, 1,
	    0.1034893, 1.498178, 0.7697437, 0, 0.8745098, 1, 1,
	    0.1044357, -0.2784082, 3.103603, 0, 0.8666667, 1, 1,
	    0.105415, 0.7108139, 0.2170161, 0, 0.8627451, 1, 1,
	    0.107469, -0.5850576, 3.659567, 0, 0.854902, 1, 1,
	    0.1116026, 1.282963, 1.808349, 0, 0.8509804, 1, 1,
	    0.1125453, 0.3673598, -0.9544663, 0, 0.8431373, 1, 1,
	    0.1133731, -1.094368, 3.151435, 0, 0.8392157, 1, 1,
	    0.1148459, 1.141966, 0.2851668, 0, 0.8313726, 1, 1,
	    0.1176106, -0.5946906, 2.500228, 0, 0.827451, 1, 1,
	    0.118661, 1.451137, -2.322983, 0, 0.8196079, 1, 1,
	    0.1187194, 0.07597494, 1.549424, 0, 0.8156863, 1, 1,
	    0.1225646, 1.531009, 0.7805818, 0, 0.8078431, 1, 1,
	    0.1243377, -1.369806, 2.910433, 0, 0.8039216, 1, 1,
	    0.125139, 0.8553287, -0.3385821, 0, 0.7960784, 1, 1,
	    0.1254386, -0.6305328, 1.625099, 0, 0.7882353, 1, 1,
	    0.1256115, -1.009791, 2.371844, 0, 0.7843137, 1, 1,
	    0.1258418, 0.9434718, -0.385615, 0, 0.7764706, 1, 1,
	    0.125853, -1.167187, 3.932257, 0, 0.772549, 1, 1,
	    0.1264993, -0.293355, 3.010561, 0, 0.7647059, 1, 1,
	    0.1293208, -0.5124702, 2.4108, 0, 0.7607843, 1, 1,
	    0.1313214, -0.6908646, 2.52695, 0, 0.7529412, 1, 1,
	    0.1354275, -2.7516, 1.693548, 0, 0.7490196, 1, 1,
	    0.1355987, 0.3206594, -0.5697745, 0, 0.7411765, 1, 1,
	    0.1380239, 1.754038, 0.4384715, 0, 0.7372549, 1, 1,
	    0.1395342, 0.5835829, 0.2471558, 0, 0.7294118, 1, 1,
	    0.1399661, 0.4019357, 0.8019391, 0, 0.7254902, 1, 1,
	    0.1407616, 0.9559378, -0.2629389, 0, 0.7176471, 1, 1,
	    0.1439307, -0.2662892, 3.144247, 0, 0.7137255, 1, 1,
	    0.146526, -2.537008, 2.503724, 0, 0.7058824, 1, 1,
	    0.1469316, 0.9570519, -0.2963376, 0, 0.6980392, 1, 1,
	    0.1473735, -0.9420941, 4.09257, 0, 0.6941177, 1, 1,
	    0.1481417, 0.2935501, -0.1525341, 0, 0.6862745, 1, 1,
	    0.1486187, 0.3841851, 1.014743, 0, 0.682353, 1, 1,
	    0.1536954, -1.290505, 2.820574, 0, 0.6745098, 1, 1,
	    0.1555094, -0.7562548, 3.898089, 0, 0.6705883, 1, 1,
	    0.16009, -2.708222, 1.647093, 0, 0.6627451, 1, 1,
	    0.1606313, -0.7100607, 2.052514, 0, 0.6588235, 1, 1,
	    0.1666282, 0.3647953, 0.3666989, 0, 0.6509804, 1, 1,
	    0.166877, 0.2573224, -0.4591549, 0, 0.6470588, 1, 1,
	    0.167406, 1.373063, -1.216478, 0, 0.6392157, 1, 1,
	    0.1702802, 1.371428, -0.3858452, 0, 0.6352941, 1, 1,
	    0.1707474, -1.017647, 5.718602, 0, 0.627451, 1, 1,
	    0.1725616, -0.001920941, 0.9047709, 0, 0.6235294, 1, 1,
	    0.1753329, -1.53859, 2.901831, 0, 0.6156863, 1, 1,
	    0.1772309, 0.818899, 1.414529, 0, 0.6117647, 1, 1,
	    0.1786804, -0.3169611, 2.822109, 0, 0.6039216, 1, 1,
	    0.1794468, -0.3928617, 3.187996, 0, 0.5960785, 1, 1,
	    0.1806585, -1.129774, 2.487241, 0, 0.5921569, 1, 1,
	    0.1808756, -1.255633, 2.522364, 0, 0.5843138, 1, 1,
	    0.1838257, -0.3787614, 3.417221, 0, 0.5803922, 1, 1,
	    0.1897637, 0.200388, -0.5155947, 0, 0.572549, 1, 1,
	    0.1915605, 0.3316032, 0.4352494, 0, 0.5686275, 1, 1,
	    0.1964126, 0.566957, 1.115001, 0, 0.5607843, 1, 1,
	    0.1978389, -0.3241129, 3.74856, 0, 0.5568628, 1, 1,
	    0.2038694, -0.7294331, 4.209773, 0, 0.5490196, 1, 1,
	    0.2053389, 0.03464797, 1.968973, 0, 0.5450981, 1, 1,
	    0.2087746, 0.2992425, -0.6335405, 0, 0.5372549, 1, 1,
	    0.21006, 1.056659, 1.625406, 0, 0.5333334, 1, 1,
	    0.2152234, -0.1068738, 1.512295, 0, 0.5254902, 1, 1,
	    0.2206562, 0.2900375, 2.667315, 0, 0.5215687, 1, 1,
	    0.222873, 0.2832681, 2.580414, 0, 0.5137255, 1, 1,
	    0.2241171, 0.6728143, 1.152559, 0, 0.509804, 1, 1,
	    0.2337841, -0.6258735, 1.944358, 0, 0.5019608, 1, 1,
	    0.2350513, -0.2238835, 1.462101, 0, 0.4941176, 1, 1,
	    0.2353569, -0.7212906, 3.638924, 0, 0.4901961, 1, 1,
	    0.2362264, 0.4493604, -0.7887953, 0, 0.4823529, 1, 1,
	    0.2400368, -0.5366085, 1.630091, 0, 0.4784314, 1, 1,
	    0.2415229, -0.6661571, 3.207326, 0, 0.4705882, 1, 1,
	    0.2470043, 0.6204684, 0.8344347, 0, 0.4666667, 1, 1,
	    0.2502289, 0.03066066, 1.106964, 0, 0.4588235, 1, 1,
	    0.2503278, -0.5963367, 4.730369, 0, 0.454902, 1, 1,
	    0.2529045, 0.3236012, 0.8712507, 0, 0.4470588, 1, 1,
	    0.2673806, -0.641915, 3.408188, 0, 0.4431373, 1, 1,
	    0.2680331, -0.6969092, 1.481344, 0, 0.4352941, 1, 1,
	    0.2733271, 0.1415346, 1.534087, 0, 0.4313726, 1, 1,
	    0.2742741, 0.5975989, 0.1822245, 0, 0.4235294, 1, 1,
	    0.2745458, 0.2266603, 2.766766, 0, 0.4196078, 1, 1,
	    0.2763074, -0.09337679, 3.451499, 0, 0.4117647, 1, 1,
	    0.2776593, 0.07490617, 1.550838, 0, 0.4078431, 1, 1,
	    0.2788401, -0.647515, 1.644519, 0, 0.4, 1, 1,
	    0.2826343, 0.4544829, -0.1152595, 0, 0.3921569, 1, 1,
	    0.2863498, 1.123861, 0.98369, 0, 0.3882353, 1, 1,
	    0.2868577, -0.1546116, 1.968632, 0, 0.3803922, 1, 1,
	    0.287193, 0.2008495, -0.9137121, 0, 0.3764706, 1, 1,
	    0.2878579, -0.5630318, 2.776659, 0, 0.3686275, 1, 1,
	    0.2885242, 0.6333605, 1.018503, 0, 0.3647059, 1, 1,
	    0.2893872, -0.2502802, 2.886539, 0, 0.3568628, 1, 1,
	    0.2921582, -0.6572485, 3.066561, 0, 0.3529412, 1, 1,
	    0.2952619, -0.7912555, 1.342153, 0, 0.345098, 1, 1,
	    0.2964316, 0.7277011, 0.2915743, 0, 0.3411765, 1, 1,
	    0.2996753, 0.329513, 0.3086734, 0, 0.3333333, 1, 1,
	    0.2999119, -0.9614558, 2.864053, 0, 0.3294118, 1, 1,
	    0.3058871, -0.6120535, 1.885973, 0, 0.3215686, 1, 1,
	    0.3064969, 0.2713085, 1.55763, 0, 0.3176471, 1, 1,
	    0.3095053, -1.149585, 2.258307, 0, 0.3098039, 1, 1,
	    0.3103172, -1.504749, 3.158721, 0, 0.3058824, 1, 1,
	    0.310455, 0.1565094, 3.633473, 0, 0.2980392, 1, 1,
	    0.3113659, 0.07286981, 0.7706331, 0, 0.2901961, 1, 1,
	    0.3127033, -0.4787644, 3.014737, 0, 0.2862745, 1, 1,
	    0.3127133, -1.719565, 2.770733, 0, 0.2784314, 1, 1,
	    0.3127345, 0.6350339, -0.345854, 0, 0.2745098, 1, 1,
	    0.3129807, -1.088139, 1.926424, 0, 0.2666667, 1, 1,
	    0.3152396, 0.2383602, 0.6925154, 0, 0.2627451, 1, 1,
	    0.3158601, -1.250354, 3.198709, 0, 0.254902, 1, 1,
	    0.3164833, -0.4806198, 3.040296, 0, 0.2509804, 1, 1,
	    0.3166527, 0.4771256, -0.1935689, 0, 0.2431373, 1, 1,
	    0.3179831, -0.8430509, 3.588178, 0, 0.2392157, 1, 1,
	    0.3184476, -0.2047973, 2.406387, 0, 0.2313726, 1, 1,
	    0.3192748, 1.288043, 1.656519, 0, 0.227451, 1, 1,
	    0.3256402, 0.9503942, 1.366579, 0, 0.2196078, 1, 1,
	    0.3282624, 1.160226, -0.164822, 0, 0.2156863, 1, 1,
	    0.3295287, -0.01250615, 1.192147, 0, 0.2078431, 1, 1,
	    0.3339483, 0.5935233, -0.01067705, 0, 0.2039216, 1, 1,
	    0.3353907, 0.4329312, 1.303046, 0, 0.1960784, 1, 1,
	    0.3384637, 0.5633002, 0.9922484, 0, 0.1882353, 1, 1,
	    0.3504854, -0.7400095, 2.459779, 0, 0.1843137, 1, 1,
	    0.3600509, -0.5285054, 4.044986, 0, 0.1764706, 1, 1,
	    0.360457, 0.5171832, -0.5819032, 0, 0.172549, 1, 1,
	    0.3709561, 0.3568837, 1.018982, 0, 0.1647059, 1, 1,
	    0.3718033, 0.3394521, 1.776997, 0, 0.1607843, 1, 1,
	    0.3737286, 0.6014382, -0.2051698, 0, 0.1529412, 1, 1,
	    0.3749932, -1.013703, 1.718812, 0, 0.1490196, 1, 1,
	    0.3767531, -1.309373, 1.826223, 0, 0.1411765, 1, 1,
	    0.377688, -0.01668403, 1.331275, 0, 0.1372549, 1, 1,
	    0.3779905, 2.550335, -2.370061, 0, 0.1294118, 1, 1,
	    0.3784848, -0.59738, 0.05074979, 0, 0.1254902, 1, 1,
	    0.3786251, 0.3468566, -0.2157864, 0, 0.1176471, 1, 1,
	    0.3790829, -0.4314109, 1.942715, 0, 0.1137255, 1, 1,
	    0.3853398, -0.8672554, 1.754472, 0, 0.1058824, 1, 1,
	    0.3885857, 0.7235286, 0.09149545, 0, 0.09803922, 1, 1,
	    0.3889861, 0.8168375, 1.811493, 0, 0.09411765, 1, 1,
	    0.3917461, -0.3357968, 3.677267, 0, 0.08627451, 1, 1,
	    0.3959354, 0.3375202, 0.716698, 0, 0.08235294, 1, 1,
	    0.3961742, 1.124228, -0.6594911, 0, 0.07450981, 1, 1,
	    0.4051493, 1.357452, -1.070944, 0, 0.07058824, 1, 1,
	    0.4052444, 1.308945, -0.5024581, 0, 0.0627451, 1, 1,
	    0.4073742, 0.5133456, 0.3368632, 0, 0.05882353, 1, 1,
	    0.4111703, 0.2843893, 0.6177497, 0, 0.05098039, 1, 1,
	    0.4122218, 0.8189287, 1.182502, 0, 0.04705882, 1, 1,
	    0.4178078, 2.344186, -1.44777, 0, 0.03921569, 1, 1,
	    0.4189467, 1.937613, 1.87601, 0, 0.03529412, 1, 1,
	    0.4231388, 0.8195015, 2.094129, 0, 0.02745098, 1, 1,
	    0.424119, -0.2472915, 3.406912, 0, 0.02352941, 1, 1,
	    0.424559, -0.01286793, 1.270934, 0, 0.01568628, 1, 1,
	    0.4297599, -0.1773188, 2.052016, 0, 0.01176471, 1, 1,
	    0.4355095, -0.3620487, 3.598024, 0, 0.003921569, 1, 1,
	    0.4362352, -0.3402111, 3.896871, 0.003921569, 0, 1, 1,
	    0.4370445, -1.411741, 3.143247, 0.007843138, 0, 1, 1,
	    0.4385339, 0.5355537, 0.1318852, 0.01568628, 0, 1, 1,
	    0.4441085, 0.1519492, 0.9680952, 0.01960784, 0, 1, 1,
	    0.4465165, -0.2041376, 1.542393, 0.02745098, 0, 1, 1,
	    0.4506291, -0.3376233, 2.113893, 0.03137255, 0, 1, 1,
	    0.4577557, -0.654692, 2.833218, 0.03921569, 0, 1, 1,
	    0.4630362, 0.4783258, -0.3530323, 0.04313726, 0, 1, 1,
	    0.4648041, 1.301685, -0.4534476, 0.05098039, 0, 1, 1,
	    0.4648103, -0.3191301, 2.690529, 0.05490196, 0, 1, 1,
	    0.4680496, 0.5784166, 0.4704468, 0.0627451, 0, 1, 1,
	    0.4681277, 1.645844, -2.054503, 0.06666667, 0, 1, 1,
	    0.4690839, -0.8468521, 1.890677, 0.07450981, 0, 1, 1,
	    0.4692178, -1.46034, 3.7861, 0.07843138, 0, 1, 1,
	    0.4692325, 0.8287479, -0.8283293, 0.08627451, 0, 1, 1,
	    0.47423, -1.595465, 5.066729, 0.09019608, 0, 1, 1,
	    0.4772587, 0.5986832, 1.042695, 0.09803922, 0, 1, 1,
	    0.4775211, 0.3226559, 1.203215, 0.1058824, 0, 1, 1,
	    0.4790347, 0.2628274, 0.9842513, 0.1098039, 0, 1, 1,
	    0.4840285, -0.1509168, 0.2731763, 0.1176471, 0, 1, 1,
	    0.4930865, -0.4009362, 3.3385, 0.1215686, 0, 1, 1,
	    0.4944445, 0.009459609, 0.2673546, 0.1294118, 0, 1, 1,
	    0.4946137, -1.982834, 3.829047, 0.1333333, 0, 1, 1,
	    0.4955674, -0.6076651, 1.763301, 0.1411765, 0, 1, 1,
	    0.5015975, 1.844471, -0.1648325, 0.145098, 0, 1, 1,
	    0.5019742, 0.1729139, 0.7634119, 0.1529412, 0, 1, 1,
	    0.5051354, -0.8912881, 3.734654, 0.1568628, 0, 1, 1,
	    0.5059608, -1.483151, 3.79015, 0.1647059, 0, 1, 1,
	    0.5075394, 1.403084, 0.7990239, 0.1686275, 0, 1, 1,
	    0.5078124, 0.4391624, 0.4277813, 0.1764706, 0, 1, 1,
	    0.5078365, 1.169796, 1.365504, 0.1803922, 0, 1, 1,
	    0.5080156, 2.365582, -1.017207, 0.1882353, 0, 1, 1,
	    0.508217, 0.5804699, -0.4207647, 0.1921569, 0, 1, 1,
	    0.5092373, -0.07793348, 2.067893, 0.2, 0, 1, 1,
	    0.5133563, 1.3546, 0.4864367, 0.2078431, 0, 1, 1,
	    0.5164346, -0.5344878, 2.094717, 0.2117647, 0, 1, 1,
	    0.5168071, 1.851359, -0.6211376, 0.2196078, 0, 1, 1,
	    0.5185365, 0.9798785, 1.284529, 0.2235294, 0, 1, 1,
	    0.5263866, -0.1607367, 3.192534, 0.2313726, 0, 1, 1,
	    0.5285566, -0.9426065, 2.132537, 0.2352941, 0, 1, 1,
	    0.5301027, -0.6175036, 2.467767, 0.2431373, 0, 1, 1,
	    0.5316739, 0.53807, 0.6514472, 0.2470588, 0, 1, 1,
	    0.5403644, -1.372862, 2.108675, 0.254902, 0, 1, 1,
	    0.5435418, -0.1697531, 3.91099, 0.2588235, 0, 1, 1,
	    0.5439378, -0.2674078, 2.930976, 0.2666667, 0, 1, 1,
	    0.5455008, -0.1041558, 2.191085, 0.2705882, 0, 1, 1,
	    0.5455562, 0.3414442, 0.401659, 0.2784314, 0, 1, 1,
	    0.5521696, 0.01178346, 0.1282329, 0.282353, 0, 1, 1,
	    0.5530366, 1.175297, -0.2270663, 0.2901961, 0, 1, 1,
	    0.5546782, -2.00732, 2.594937, 0.2941177, 0, 1, 1,
	    0.5604799, -0.7717065, 1.758717, 0.3019608, 0, 1, 1,
	    0.5755231, -1.162724, 1.973908, 0.3098039, 0, 1, 1,
	    0.5768685, 1.574613, 0.3121182, 0.3137255, 0, 1, 1,
	    0.5822859, 0.166344, 1.110792, 0.3215686, 0, 1, 1,
	    0.5835156, -0.06148805, 0.8465514, 0.3254902, 0, 1, 1,
	    0.5838928, 0.4525444, 1.160229, 0.3333333, 0, 1, 1,
	    0.5887665, 1.267171, 2.065183, 0.3372549, 0, 1, 1,
	    0.5923067, -1.156116, 2.975227, 0.345098, 0, 1, 1,
	    0.5938713, 2.369488, 0.5750431, 0.3490196, 0, 1, 1,
	    0.5958854, 0.1390521, 1.987572, 0.3568628, 0, 1, 1,
	    0.5979035, 1.114606, -0.4315263, 0.3607843, 0, 1, 1,
	    0.5983557, 0.2855224, 0.5912557, 0.3686275, 0, 1, 1,
	    0.6013268, 0.682777, 1.704886, 0.372549, 0, 1, 1,
	    0.6037338, 1.938635, 1.314758, 0.3803922, 0, 1, 1,
	    0.6039606, 0.2926959, 2.645162, 0.3843137, 0, 1, 1,
	    0.6065504, 0.6940221, 0.2052581, 0.3921569, 0, 1, 1,
	    0.6073797, 0.9195783, 1.186874, 0.3960784, 0, 1, 1,
	    0.6086635, -2.253681, 3.659407, 0.4039216, 0, 1, 1,
	    0.6114404, 0.8994322, 1.801719, 0.4117647, 0, 1, 1,
	    0.6120171, -0.4578825, 1.700825, 0.4156863, 0, 1, 1,
	    0.6122719, -0.2376282, 2.752255, 0.4235294, 0, 1, 1,
	    0.6156099, -0.7070799, 3.056303, 0.427451, 0, 1, 1,
	    0.6204832, -0.3464236, 1.88808, 0.4352941, 0, 1, 1,
	    0.6213993, -0.3168385, 0.7439248, 0.4392157, 0, 1, 1,
	    0.6310688, 0.3974715, 1.057217, 0.4470588, 0, 1, 1,
	    0.6318771, 1.018566, 1.646153, 0.4509804, 0, 1, 1,
	    0.638922, 0.1728967, 2.847359, 0.4588235, 0, 1, 1,
	    0.640323, 2.773763, 0.03879196, 0.4627451, 0, 1, 1,
	    0.6430998, 0.3774596, -0.6272722, 0.4705882, 0, 1, 1,
	    0.6452182, -0.8332902, 2.95344, 0.4745098, 0, 1, 1,
	    0.6456206, 1.298289, 1.311611, 0.4823529, 0, 1, 1,
	    0.6477954, 0.1362213, 1.387507, 0.4862745, 0, 1, 1,
	    0.6478414, 0.5027589, -0.3064246, 0.4941176, 0, 1, 1,
	    0.6479371, -0.004471456, 1.893931, 0.5019608, 0, 1, 1,
	    0.6485153, -0.004714838, 1.556458, 0.5058824, 0, 1, 1,
	    0.6519047, 1.39284, 0.5699655, 0.5137255, 0, 1, 1,
	    0.6520029, 0.04145228, 0.9511154, 0.5176471, 0, 1, 1,
	    0.6534989, 0.3105746, 0.5142825, 0.5254902, 0, 1, 1,
	    0.6610491, 1.784158, -1.168962, 0.5294118, 0, 1, 1,
	    0.6627481, 1.340337, 0.9985649, 0.5372549, 0, 1, 1,
	    0.6676952, 1.448129, 0.824648, 0.5411765, 0, 1, 1,
	    0.6685105, -1.790322, 2.292793, 0.5490196, 0, 1, 1,
	    0.6785948, -0.1113487, 1.916962, 0.5529412, 0, 1, 1,
	    0.6807631, -0.2955543, 2.212612, 0.5607843, 0, 1, 1,
	    0.681661, 0.9562439, 1.947829, 0.5647059, 0, 1, 1,
	    0.6843649, 0.8793927, 0.5710255, 0.572549, 0, 1, 1,
	    0.6902907, 2.5316, -1.539994, 0.5764706, 0, 1, 1,
	    0.6941721, -1.048027, 2.350192, 0.5843138, 0, 1, 1,
	    0.6942482, -0.7264248, 2.49225, 0.5882353, 0, 1, 1,
	    0.694833, -0.06180171, 1.988382, 0.5960785, 0, 1, 1,
	    0.6953302, 0.1295384, 1.50262, 0.6039216, 0, 1, 1,
	    0.7190703, 0.8315722, 1.283214, 0.6078432, 0, 1, 1,
	    0.7217805, 2.622222, 0.7049426, 0.6156863, 0, 1, 1,
	    0.725623, -0.0389486, -0.6787316, 0.6196079, 0, 1, 1,
	    0.7272677, -0.09712353, 0.6823136, 0.627451, 0, 1, 1,
	    0.7274969, -0.312641, 1.612684, 0.6313726, 0, 1, 1,
	    0.73785, -1.009135, 1.716006, 0.6392157, 0, 1, 1,
	    0.7387775, -2.336682, 4.086193, 0.6431373, 0, 1, 1,
	    0.7396144, -0.9859756, 2.101536, 0.6509804, 0, 1, 1,
	    0.7428803, 0.7452335, -0.4439097, 0.654902, 0, 1, 1,
	    0.7433899, -0.7591785, 3.231249, 0.6627451, 0, 1, 1,
	    0.7499155, -1.605444, 2.445455, 0.6666667, 0, 1, 1,
	    0.7501723, 0.3341838, -0.9824942, 0.6745098, 0, 1, 1,
	    0.7601088, 2.143367, 0.2082712, 0.6784314, 0, 1, 1,
	    0.7652365, -1.002614, -0.2779996, 0.6862745, 0, 1, 1,
	    0.7664897, 0.2496175, -0.03956432, 0.6901961, 0, 1, 1,
	    0.7732115, -0.08386909, 0.5430204, 0.6980392, 0, 1, 1,
	    0.7748011, 0.3260491, 1.491047, 0.7058824, 0, 1, 1,
	    0.7769456, -0.4447787, 3.717192, 0.7098039, 0, 1, 1,
	    0.787522, 0.5992452, -1.289758, 0.7176471, 0, 1, 1,
	    0.7889779, 0.4720393, 0.2867572, 0.7215686, 0, 1, 1,
	    0.792628, -0.6905006, 0.8791177, 0.7294118, 0, 1, 1,
	    0.7976006, 0.1075131, 3.449054, 0.7333333, 0, 1, 1,
	    0.8007438, -1.601552, 1.998169, 0.7411765, 0, 1, 1,
	    0.8016021, -0.7931526, 2.21756, 0.7450981, 0, 1, 1,
	    0.8101354, -0.3093846, 1.605937, 0.7529412, 0, 1, 1,
	    0.8125038, 1.072278, 1.517502, 0.7568628, 0, 1, 1,
	    0.826582, 2.209174, -0.259897, 0.7647059, 0, 1, 1,
	    0.8271821, -0.6014103, 2.314642, 0.7686275, 0, 1, 1,
	    0.8353666, -0.06918259, 1.129655, 0.7764706, 0, 1, 1,
	    0.8374588, 0.06811921, 1.147045, 0.7803922, 0, 1, 1,
	    0.8375767, -0.04555457, 1.75113, 0.7882353, 0, 1, 1,
	    0.837849, -0.2221144, 2.633168, 0.7921569, 0, 1, 1,
	    0.8460992, -0.5628378, -0.1360557, 0.8, 0, 1, 1,
	    0.8504699, -1.931817, 1.570592, 0.8078431, 0, 1, 1,
	    0.8623884, 1.140056, -0.4078649, 0.8117647, 0, 1, 1,
	    0.8627581, -0.04085077, 1.579054, 0.8196079, 0, 1, 1,
	    0.8667508, -1.962013, 0.6971025, 0.8235294, 0, 1, 1,
	    0.8687572, -1.277658, 2.81137, 0.8313726, 0, 1, 1,
	    0.8714008, 0.8517668, -0.06373629, 0.8352941, 0, 1, 1,
	    0.8741592, -0.1153671, 1.325661, 0.8431373, 0, 1, 1,
	    0.8756596, 1.284101, 1.957639, 0.8470588, 0, 1, 1,
	    0.8843211, -0.7752438, 2.659948, 0.854902, 0, 1, 1,
	    0.8855385, -1.483864, 2.859005, 0.8588235, 0, 1, 1,
	    0.8867202, -0.4801338, 3.127076, 0.8666667, 0, 1, 1,
	    0.8938996, 0.4740783, 1.14304, 0.8705882, 0, 1, 1,
	    0.8965645, -0.6103691, 1.770161, 0.8784314, 0, 1, 1,
	    0.8968723, 0.6226607, -0.2028, 0.8823529, 0, 1, 1,
	    0.8988951, -0.08538505, 1.713929, 0.8901961, 0, 1, 1,
	    0.9055098, 0.7400884, 2.279521, 0.8941177, 0, 1, 1,
	    0.9060996, 0.2607701, 2.156221, 0.9019608, 0, 1, 1,
	    0.9097569, -0.08277316, -0.1043864, 0.9098039, 0, 1, 1,
	    0.9160265, -0.8365319, 2.728422, 0.9137255, 0, 1, 1,
	    0.9251277, 0.7882298, 1.303153, 0.9215686, 0, 1, 1,
	    0.9280995, -0.09468097, 2.154608, 0.9254902, 0, 1, 1,
	    0.9310142, 0.2395939, 0.9817521, 0.9333333, 0, 1, 1,
	    0.9356867, -0.1357828, 1.734215, 0.9372549, 0, 1, 1,
	    0.9365985, -0.5257858, 1.517778, 0.945098, 0, 1, 1,
	    0.9493333, -1.561121, 1.810254, 0.9490196, 0, 1, 1,
	    0.9517287, -0.6542698, 1.093119, 0.9568627, 0, 1, 1,
	    0.9572201, 1.366893, -0.7396281, 0.9607843, 0, 1, 1,
	    0.9638126, 0.9320511, 0.5294102, 0.9686275, 0, 1, 1,
	    0.9725414, -0.9015846, 1.956841, 0.972549, 0, 1, 1,
	    0.9821439, 0.09662455, 2.804223, 0.9803922, 0, 1, 1,
	    0.9862073, 0.7613046, 2.347761, 0.9843137, 0, 1, 1,
	    0.9867401, -1.148309, 2.288214, 0.9921569, 0, 1, 1,
	    0.9882893, -0.9152396, 0.6054804, 0.9960784, 0, 1, 1,
	    0.9950202, -1.477745, 2.869324, 1, 0, 0.9960784, 1,
	    0.9964955, -0.7937958, 3.213031, 1, 0, 0.9882353, 1,
	    1.000531, 2.1332, -0.2739459, 1, 0, 0.9843137, 1,
	    1.008279, -0.2315226, 2.485331, 1, 0, 0.9764706, 1,
	    1.009855, -0.9199529, 2.057423, 1, 0, 0.972549, 1,
	    1.016603, -0.6893322, 1.693819, 1, 0, 0.9647059, 1,
	    1.018343, 0.5728964, 0.540145, 1, 0, 0.9607843, 1,
	    1.024095, -1.955043, 1.722651, 1, 0, 0.9529412, 1,
	    1.024819, 0.4422519, 1.049975, 1, 0, 0.9490196, 1,
	    1.034142, -0.3043166, 0.9580348, 1, 0, 0.9411765, 1,
	    1.038236, -1.227473, 2.062155, 1, 0, 0.9372549, 1,
	    1.051944, -1.803084, 3.005392, 1, 0, 0.9294118, 1,
	    1.054081, 0.01105669, 1.80238, 1, 0, 0.9254902, 1,
	    1.059752, 0.9086977, 2.426208, 1, 0, 0.9176471, 1,
	    1.060176, -0.2564352, 3.436311, 1, 0, 0.9137255, 1,
	    1.060711, 0.07077448, 0.3935172, 1, 0, 0.9058824, 1,
	    1.061058, -0.1944629, 0.5922515, 1, 0, 0.9019608, 1,
	    1.071582, -0.7431626, 0.9990129, 1, 0, 0.8941177, 1,
	    1.073924, 1.036125, 1.522193, 1, 0, 0.8862745, 1,
	    1.075867, -1.791269, 2.387355, 1, 0, 0.8823529, 1,
	    1.080241, -0.7931419, 2.796765, 1, 0, 0.8745098, 1,
	    1.080966, -0.7061115, 2.858695, 1, 0, 0.8705882, 1,
	    1.082265, -0.03964492, 2.932709, 1, 0, 0.8627451, 1,
	    1.08742, -1.595135, 2.607711, 1, 0, 0.8588235, 1,
	    1.091573, -1.599946, 1.766868, 1, 0, 0.8509804, 1,
	    1.1028, 0.593362, 1.549091, 1, 0, 0.8470588, 1,
	    1.103794, -0.819862, 1.634014, 1, 0, 0.8392157, 1,
	    1.10524, -0.2074208, 2.065174, 1, 0, 0.8352941, 1,
	    1.110625, -1.373495, 2.258403, 1, 0, 0.827451, 1,
	    1.116401, 0.846606, 0.7733734, 1, 0, 0.8235294, 1,
	    1.119795, 0.3900791, 0.484147, 1, 0, 0.8156863, 1,
	    1.131699, 0.02466753, 2.598433, 1, 0, 0.8117647, 1,
	    1.132014, -0.04533409, 1.391584, 1, 0, 0.8039216, 1,
	    1.143113, 0.2336769, -1.020012, 1, 0, 0.7960784, 1,
	    1.156638, 0.5858724, 0.3945679, 1, 0, 0.7921569, 1,
	    1.158904, 0.4880187, 2.0684, 1, 0, 0.7843137, 1,
	    1.167832, -1.214781, 1.77507, 1, 0, 0.7803922, 1,
	    1.175219, 2.101604, 0.6897209, 1, 0, 0.772549, 1,
	    1.179159, -0.7180746, 0.5825458, 1, 0, 0.7686275, 1,
	    1.183303, -1.673002, 2.361055, 1, 0, 0.7607843, 1,
	    1.184484, -0.1199609, 0.3239202, 1, 0, 0.7568628, 1,
	    1.188897, -0.5861961, 2.938979, 1, 0, 0.7490196, 1,
	    1.189827, 0.6820375, -0.7326043, 1, 0, 0.7450981, 1,
	    1.190257, 1.591504, 0.4412784, 1, 0, 0.7372549, 1,
	    1.194333, -1.765281, 1.896887, 1, 0, 0.7333333, 1,
	    1.200773, 0.6499419, 0.2036399, 1, 0, 0.7254902, 1,
	    1.201631, 0.8263245, 0.991703, 1, 0, 0.7215686, 1,
	    1.202116, -2.033519, 1.936447, 1, 0, 0.7137255, 1,
	    1.204326, -0.5549725, 2.541893, 1, 0, 0.7098039, 1,
	    1.208849, 0.1479044, -0.7894999, 1, 0, 0.7019608, 1,
	    1.22137, -1.281606, 3.787686, 1, 0, 0.6941177, 1,
	    1.230487, 0.4422073, 2.579968, 1, 0, 0.6901961, 1,
	    1.235646, 0.56871, 1.331515, 1, 0, 0.682353, 1,
	    1.239227, 0.9188312, 0.8454653, 1, 0, 0.6784314, 1,
	    1.245261, -0.01321147, 2.1169, 1, 0, 0.6705883, 1,
	    1.246321, -0.9496019, 2.603627, 1, 0, 0.6666667, 1,
	    1.246895, -1.072777, 1.406541, 1, 0, 0.6588235, 1,
	    1.248757, -0.4546725, 3.191783, 1, 0, 0.654902, 1,
	    1.256582, 0.4807982, 1.052114, 1, 0, 0.6470588, 1,
	    1.256814, -0.1697946, 2.367696, 1, 0, 0.6431373, 1,
	    1.256879, 0.8143222, 1.449809, 1, 0, 0.6352941, 1,
	    1.262077, 0.9882463, 1.308349, 1, 0, 0.6313726, 1,
	    1.267987, -1.248905, 2.435786, 1, 0, 0.6235294, 1,
	    1.277969, 0.09018766, 0.9848953, 1, 0, 0.6196079, 1,
	    1.289945, -0.9799273, 4.047998, 1, 0, 0.6117647, 1,
	    1.291815, 0.850948, 0.498627, 1, 0, 0.6078432, 1,
	    1.29209, 0.1784073, 2.492302, 1, 0, 0.6, 1,
	    1.292473, -0.5521322, 1.283763, 1, 0, 0.5921569, 1,
	    1.311343, -1.38302, 1.589138, 1, 0, 0.5882353, 1,
	    1.318792, -0.6556621, 2.169801, 1, 0, 0.5803922, 1,
	    1.320203, 0.1665176, 1.774064, 1, 0, 0.5764706, 1,
	    1.321605, -0.323479, 1.374414, 1, 0, 0.5686275, 1,
	    1.324607, -0.6409555, 2.733998, 1, 0, 0.5647059, 1,
	    1.32598, 1.049309, 2.081657, 1, 0, 0.5568628, 1,
	    1.326814, -0.4822658, 0.5541289, 1, 0, 0.5529412, 1,
	    1.339795, 1.02894, 1.963595, 1, 0, 0.5450981, 1,
	    1.344106, -0.05315825, 2.982058, 1, 0, 0.5411765, 1,
	    1.346783, -0.9339223, 2.79074, 1, 0, 0.5333334, 1,
	    1.347755, -0.8573796, 0.6307061, 1, 0, 0.5294118, 1,
	    1.349744, -0.2892578, 1.73359, 1, 0, 0.5215687, 1,
	    1.349985, -0.9957334, 2.566382, 1, 0, 0.5176471, 1,
	    1.351793, -0.143324, 0.9851077, 1, 0, 0.509804, 1,
	    1.358242, 0.2625671, 1.510299, 1, 0, 0.5058824, 1,
	    1.373103, 0.4622475, 1.102607, 1, 0, 0.4980392, 1,
	    1.381251, 1.46814, 1.278561, 1, 0, 0.4901961, 1,
	    1.394921, -0.4929661, 2.446249, 1, 0, 0.4862745, 1,
	    1.405178, -2.319766, 1.399064, 1, 0, 0.4784314, 1,
	    1.40589, 1.003013, 1.320962, 1, 0, 0.4745098, 1,
	    1.419621, -2.968235, 1.372425, 1, 0, 0.4666667, 1,
	    1.42117, -1.938501, 0.916844, 1, 0, 0.4627451, 1,
	    1.42367, -0.2537395, 1.293811, 1, 0, 0.454902, 1,
	    1.429692, -0.761341, 2.941511, 1, 0, 0.4509804, 1,
	    1.436889, 0.1712336, 1.80433, 1, 0, 0.4431373, 1,
	    1.437946, -0.6036823, 1.347931, 1, 0, 0.4392157, 1,
	    1.444032, 0.2173782, -0.07424051, 1, 0, 0.4313726, 1,
	    1.447426, 0.8817448, 1.392437, 1, 0, 0.427451, 1,
	    1.448833, 0.3255174, 2.778056, 1, 0, 0.4196078, 1,
	    1.451724, 0.938863, 1.694402, 1, 0, 0.4156863, 1,
	    1.462773, -0.01681317, 0.8286696, 1, 0, 0.4078431, 1,
	    1.470532, -1.169971, 2.363846, 1, 0, 0.4039216, 1,
	    1.471923, -0.348942, 2.450176, 1, 0, 0.3960784, 1,
	    1.476831, -1.026544, 3.322249, 1, 0, 0.3882353, 1,
	    1.481035, -1.235481, 2.208685, 1, 0, 0.3843137, 1,
	    1.483847, -1.980526, 3.922301, 1, 0, 0.3764706, 1,
	    1.489608, -0.7843097, 1.096418, 1, 0, 0.372549, 1,
	    1.495365, -0.08978285, 1.06749, 1, 0, 0.3647059, 1,
	    1.502201, -1.000314, 3.495071, 1, 0, 0.3607843, 1,
	    1.502646, -1.873896, 1.13789, 1, 0, 0.3529412, 1,
	    1.502841, -0.2225535, 2.706798, 1, 0, 0.3490196, 1,
	    1.506433, -0.04315935, 1.201199, 1, 0, 0.3411765, 1,
	    1.533617, 0.7769177, -0.1311385, 1, 0, 0.3372549, 1,
	    1.536033, -0.4165966, 2.615766, 1, 0, 0.3294118, 1,
	    1.54627, 0.9607139, -0.1578142, 1, 0, 0.3254902, 1,
	    1.564387, -0.6589846, 1.144906, 1, 0, 0.3176471, 1,
	    1.575632, 0.1439209, 1.396465, 1, 0, 0.3137255, 1,
	    1.581509, 0.04512141, 1.417093, 1, 0, 0.3058824, 1,
	    1.591857, -1.192806, 3.089855, 1, 0, 0.2980392, 1,
	    1.618286, -1.445339, 2.241405, 1, 0, 0.2941177, 1,
	    1.621152, -0.5797392, 2.340838, 1, 0, 0.2862745, 1,
	    1.625574, -0.2609198, 1.831234, 1, 0, 0.282353, 1,
	    1.642526, 0.2440425, 3.490282, 1, 0, 0.2745098, 1,
	    1.647565, -0.7557116, 1.574484, 1, 0, 0.2705882, 1,
	    1.648618, -0.5282515, 1.766431, 1, 0, 0.2627451, 1,
	    1.656555, -0.7691211, 1.590301, 1, 0, 0.2588235, 1,
	    1.657638, 0.3460461, 0.6540934, 1, 0, 0.2509804, 1,
	    1.664934, 0.908543, 0.7452061, 1, 0, 0.2470588, 1,
	    1.673134, 1.152812, -0.1570411, 1, 0, 0.2392157, 1,
	    1.685897, -1.068833, 2.590945, 1, 0, 0.2352941, 1,
	    1.706377, -0.1809381, 3.079979, 1, 0, 0.227451, 1,
	    1.707123, -0.6366596, 2.919613, 1, 0, 0.2235294, 1,
	    1.723335, -0.9886241, 3.096928, 1, 0, 0.2156863, 1,
	    1.740802, 1.460422, 1.605032, 1, 0, 0.2117647, 1,
	    1.753712, 1.154549, -0.4935765, 1, 0, 0.2039216, 1,
	    1.758245, -0.8311335, 1.999848, 1, 0, 0.1960784, 1,
	    1.782057, -1.011752, 0.8522137, 1, 0, 0.1921569, 1,
	    1.784419, 2.308835, -0.5229552, 1, 0, 0.1843137, 1,
	    1.795141, 0.7408503, 0.4378289, 1, 0, 0.1803922, 1,
	    1.802331, 0.5519655, 0.0465347, 1, 0, 0.172549, 1,
	    1.810428, 0.1506012, 1.270409, 1, 0, 0.1686275, 1,
	    1.815549, -0.6341668, 3.364062, 1, 0, 0.1607843, 1,
	    1.816261, -0.2268587, -0.3492798, 1, 0, 0.1568628, 1,
	    1.817325, 1.911896, 0.02770647, 1, 0, 0.1490196, 1,
	    1.826421, -0.7667181, 3.312913, 1, 0, 0.145098, 1,
	    1.83525, 0.3374636, 0.170308, 1, 0, 0.1372549, 1,
	    1.862124, -0.1968413, 1.050991, 1, 0, 0.1333333, 1,
	    1.892428, 0.4639156, 3.091737, 1, 0, 0.1254902, 1,
	    1.908017, 1.298384, 1.20424, 1, 0, 0.1215686, 1,
	    1.909095, 0.08150677, 1.188115, 1, 0, 0.1137255, 1,
	    1.919446, -0.6533684, 1.220637, 1, 0, 0.1098039, 1,
	    1.930657, 1.396768, 1.130304, 1, 0, 0.1019608, 1,
	    1.961479, -0.0152872, 1.748603, 1, 0, 0.09411765, 1,
	    1.981595, 1.141245, 0.6661756, 1, 0, 0.09019608, 1,
	    1.997316, -1.006013, 3.154423, 1, 0, 0.08235294, 1,
	    2.022787, 0.1929931, 0.874485, 1, 0, 0.07843138, 1,
	    2.034021, 0.6707531, 2.203459, 1, 0, 0.07058824, 1,
	    2.069897, -0.7277015, 0.9936925, 1, 0, 0.06666667, 1,
	    2.119831, 0.3045081, 1.940907, 1, 0, 0.05882353, 1,
	    2.121357, 0.08749314, 1.43993, 1, 0, 0.05490196, 1,
	    2.199703, 0.8771846, -0.4442711, 1, 0, 0.04705882, 1,
	    2.214262, -0.3995659, 1.360927, 1, 0, 0.04313726, 1,
	    2.311405, 1.51049, -0.7325897, 1, 0, 0.03529412, 1,
	    2.343624, -0.7479159, 1.342487, 1, 0, 0.03137255, 1,
	    2.414212, 1.666164, 1.195174, 1, 0, 0.02352941, 1,
	    2.486379, 1.270544, 1.837873, 1, 0, 0.01960784, 1,
	    2.656876, -0.720034, 1.518874, 1, 0, 0.01176471, 1,
	    2.753708, -0.2648011, 1.251784, 1, 0, 0.007843138, 1
	   ]);
	   var posLoc6 = gl.getAttribLocation(prog6, "aPos");
	   var colLoc6 = gl.getAttribLocation(prog6, "aCol");
	   var buf6 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf6);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var mvMatLoc6 = gl.getUniformLocation(prog6,"mvMatrix");
	   var prMatLoc6 = gl.getUniformLocation(prog6,"prMatrix");
	   // ****** text object 8 ******
	   var prog8  = gl.createProgram();
	   gl.attachShader(prog8, getShader( gl, "_2d_3d_pointsvshader8" ));
	   gl.attachShader(prog8, getShader( gl, "_2d_3d_pointsfshader8" ));
	   gl.linkProgram(prog8);
	   var texts = [
	    "x"
	   ];
	   var texinfo = drawTextToCanvas(texts, 1);	 
	   var canvasX8 = texinfo.canvasX;
	   var canvasY8 = texinfo.canvasY;
	   var ofsLoc8 = gl.getAttribLocation(prog8, "aOfs");
	   var texture8 = gl.createTexture();
	   var texLoc8 = gl.getAttribLocation(prog8, "aTexcoord");
	   var sampler8 = gl.getUniformLocation(prog8,"uSampler");
    	   handleLoadedTexture(texture8, document.getElementById("_2d_3d_pointstextureCanvas"));
	   var v=new Float32Array([
	    -0.196599, -3.978338, -6.809711, 0, -0.5, 0.5, 0.5,
	    -0.196599, -3.978338, -6.809711, 1, -0.5, 0.5, 0.5,
	    -0.196599, -3.978338, -6.809711, 1, 1.5, 0.5, 0.5,
	    -0.196599, -3.978338, -6.809711, 0, 1.5, 0.5, 0.5
	   ]);
	   for (var i=0; i<1; i++) 
	     for (var j=0; j<4; j++) {
	         ind = 7*(4*i + j) + 3;
	         v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i]/width;
	         v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight/height;
	         v[ind] *= texinfo.widths[i]/texinfo.canvasX;
	         v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
	           - v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
	     }
	   var posLoc8 = gl.getAttribLocation(prog8, "aPos");
	   var colLoc8 = gl.getAttribLocation(prog8, "aCol");
	   var f=new Uint16Array([
	    0, 1, 2, 0, 2, 3
	   ]);
	   var buf8 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf8);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var ibuf8 = gl.createBuffer();
	   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf8);
	   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
	   var mvMatLoc8 = gl.getUniformLocation(prog8,"mvMatrix");
	   var prMatLoc8 = gl.getUniformLocation(prog8,"prMatrix");
	   // ****** text object 9 ******
	   var prog9  = gl.createProgram();
	   gl.attachShader(prog9, getShader( gl, "_2d_3d_pointsvshader9" ));
	   gl.attachShader(prog9, getShader( gl, "_2d_3d_pointsfshader9" ));
	   gl.linkProgram(prog9);
	   var texts = [
	    "y"
	   ];
	   var texinfo = drawTextToCanvas(texts, 1);	 
	   var canvasX9 = texinfo.canvasX;
	   var canvasY9 = texinfo.canvasY;
	   var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
	   var texture9 = gl.createTexture();
	   var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
	   var sampler9 = gl.getUniformLocation(prog9,"uSampler");
    	   handleLoadedTexture(texture9, document.getElementById("_2d_3d_pointstextureCanvas"));
	   var v=new Float32Array([
	    -4.14706, 0.01141882, -6.809711, 0, -0.5, 0.5, 0.5,
	    -4.14706, 0.01141882, -6.809711, 1, -0.5, 0.5, 0.5,
	    -4.14706, 0.01141882, -6.809711, 1, 1.5, 0.5, 0.5,
	    -4.14706, 0.01141882, -6.809711, 0, 1.5, 0.5, 0.5
	   ]);
	   for (var i=0; i<1; i++) 
	     for (var j=0; j<4; j++) {
	         ind = 7*(4*i + j) + 3;
	         v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i]/width;
	         v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight/height;
	         v[ind] *= texinfo.widths[i]/texinfo.canvasX;
	         v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
	           - v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
	     }
	   var posLoc9 = gl.getAttribLocation(prog9, "aPos");
	   var colLoc9 = gl.getAttribLocation(prog9, "aCol");
	   var f=new Uint16Array([
	    0, 1, 2, 0, 2, 3
	   ]);
	   var buf9 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var ibuf9 = gl.createBuffer();
	   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
	   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
	   var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
	   var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
	   // ****** text object 10 ******
	   var prog10  = gl.createProgram();
	   gl.attachShader(prog10, getShader( gl, "_2d_3d_pointsvshader10" ));
	   gl.attachShader(prog10, getShader( gl, "_2d_3d_pointsfshader10" ));
	   gl.linkProgram(prog10);
	   var texts = [
	    "z"
	   ];
	   var texinfo = drawTextToCanvas(texts, 1);	 
	   var canvasX10 = texinfo.canvasX;
	   var canvasY10 = texinfo.canvasY;
	   var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
	   var texture10 = gl.createTexture();
	   var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
	   var sampler10 = gl.getUniformLocation(prog10,"uSampler");
    	   handleLoadedTexture(texture10, document.getElementById("_2d_3d_pointstextureCanvas"));
	   var v=new Float32Array([
	    -4.14706, -3.978338, 0.3623331, 0, -0.5, 0.5, 0.5,
	    -4.14706, -3.978338, 0.3623331, 1, -0.5, 0.5, 0.5,
	    -4.14706, -3.978338, 0.3623331, 1, 1.5, 0.5, 0.5,
	    -4.14706, -3.978338, 0.3623331, 0, 1.5, 0.5, 0.5
	   ]);
	   for (var i=0; i<1; i++) 
	     for (var j=0; j<4; j++) {
	         ind = 7*(4*i + j) + 3;
	         v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i]/width;
	         v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight/height;
	         v[ind] *= texinfo.widths[i]/texinfo.canvasX;
	         v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
	           - v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
	     }
	   var posLoc10 = gl.getAttribLocation(prog10, "aPos");
	   var colLoc10 = gl.getAttribLocation(prog10, "aCol");
	   var f=new Uint16Array([
	    0, 1, 2, 0, 2, 3
	   ]);
	   var buf10 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var ibuf10 = gl.createBuffer();
	   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
	   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
	   var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
	   var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
	   // ****** lines object 11 ******
	   var prog11  = gl.createProgram();
	   gl.attachShader(prog11, getShader( gl, "_2d_3d_pointsvshader11" ));
	   gl.attachShader(prog11, getShader( gl, "_2d_3d_pointsfshader11" ));
	   gl.linkProgram(prog11);
	   var v=new Float32Array([
	    -3, -3.057625, -5.154624,
	    2, -3.057625, -5.154624,
	    -3, -3.057625, -5.154624,
	    -3, -3.211077, -5.430472,
	    -2, -3.057625, -5.154624,
	    -2, -3.211077, -5.430472,
	    -1, -3.057625, -5.154624,
	    -1, -3.211077, -5.430472,
	    0, -3.057625, -5.154624,
	    0, -3.211077, -5.430472,
	    1, -3.057625, -5.154624,
	    1, -3.211077, -5.430472,
	    2, -3.057625, -5.154624,
	    2, -3.211077, -5.430472
	   ]);
	   var posLoc11 = gl.getAttribLocation(prog11, "aPos");
	   var colLoc11 = gl.getAttribLocation(prog11, "aCol");
	   var buf11 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
	   var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
	   // ****** text object 12 ******
	   var prog12  = gl.createProgram();
	   gl.attachShader(prog12, getShader( gl, "_2d_3d_pointsvshader12" ));
	   gl.attachShader(prog12, getShader( gl, "_2d_3d_pointsfshader12" ));
	   gl.linkProgram(prog12);
	   var texts = [
	    "-3",
	    "-2",
	    "-1",
	    "0",
	    "1",
	    "2"
	   ];
	   var texinfo = drawTextToCanvas(texts, 1);	 
	   var canvasX12 = texinfo.canvasX;
	   var canvasY12 = texinfo.canvasY;
	   var ofsLoc12 = gl.getAttribLocation(prog12, "aOfs");
	   var texture12 = gl.createTexture();
	   var texLoc12 = gl.getAttribLocation(prog12, "aTexcoord");
	   var sampler12 = gl.getUniformLocation(prog12,"uSampler");
    	   handleLoadedTexture(texture12, document.getElementById("_2d_3d_pointstextureCanvas"));
	   var v=new Float32Array([
	    -3, -3.517982, -5.982168, 0, -0.5, 0.5, 0.5,
	    -3, -3.517982, -5.982168, 1, -0.5, 0.5, 0.5,
	    -3, -3.517982, -5.982168, 1, 1.5, 0.5, 0.5,
	    -3, -3.517982, -5.982168, 0, 1.5, 0.5, 0.5,
	    -2, -3.517982, -5.982168, 0, -0.5, 0.5, 0.5,
	    -2, -3.517982, -5.982168, 1, -0.5, 0.5, 0.5,
	    -2, -3.517982, -5.982168, 1, 1.5, 0.5, 0.5,
	    -2, -3.517982, -5.982168, 0, 1.5, 0.5, 0.5,
	    -1, -3.517982, -5.982168, 0, -0.5, 0.5, 0.5,
	    -1, -3.517982, -5.982168, 1, -0.5, 0.5, 0.5,
	    -1, -3.517982, -5.982168, 1, 1.5, 0.5, 0.5,
	    -1, -3.517982, -5.982168, 0, 1.5, 0.5, 0.5,
	    0, -3.517982, -5.982168, 0, -0.5, 0.5, 0.5,
	    0, -3.517982, -5.982168, 1, -0.5, 0.5, 0.5,
	    0, -3.517982, -5.982168, 1, 1.5, 0.5, 0.5,
	    0, -3.517982, -5.982168, 0, 1.5, 0.5, 0.5,
	    1, -3.517982, -5.982168, 0, -0.5, 0.5, 0.5,
	    1, -3.517982, -5.982168, 1, -0.5, 0.5, 0.5,
	    1, -3.517982, -5.982168, 1, 1.5, 0.5, 0.5,
	    1, -3.517982, -5.982168, 0, 1.5, 0.5, 0.5,
	    2, -3.517982, -5.982168, 0, -0.5, 0.5, 0.5,
	    2, -3.517982, -5.982168, 1, -0.5, 0.5, 0.5,
	    2, -3.517982, -5.982168, 1, 1.5, 0.5, 0.5,
	    2, -3.517982, -5.982168, 0, 1.5, 0.5, 0.5
	   ]);
	   for (var i=0; i<6; i++) 
	     for (var j=0; j<4; j++) {
	         ind = 7*(4*i + j) + 3;
	         v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i]/width;
	         v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight/height;
	         v[ind] *= texinfo.widths[i]/texinfo.canvasX;
	         v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
	           - v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
	     }
	   var posLoc12 = gl.getAttribLocation(prog12, "aPos");
	   var colLoc12 = gl.getAttribLocation(prog12, "aCol");
	   var f=new Uint16Array([
	    0, 1, 2, 0, 2, 3,
	    4, 5, 6, 4, 6, 7,
	    8, 9, 10, 8, 10, 11,
	    12, 13, 14, 12, 14, 15,
	    16, 17, 18, 16, 18, 19,
	    20, 21, 22, 20, 22, 23
	   ]);
	   var buf12 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var ibuf12 = gl.createBuffer();
	   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf12);
	   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
	   var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
	   var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
	   // ****** lines object 13 ******
	   var prog13  = gl.createProgram();
	   gl.attachShader(prog13, getShader( gl, "_2d_3d_pointsvshader13" ));
	   gl.attachShader(prog13, getShader( gl, "_2d_3d_pointsfshader13" ));
	   gl.linkProgram(prog13);
	   var v=new Float32Array([
	    -3.235415, -2, -5.154624,
	    -3.235415, 2, -5.154624,
	    -3.235415, -2, -5.154624,
	    -3.387356, -2, -5.430472,
	    -3.235415, -1, -5.154624,
	    -3.387356, -1, -5.430472,
	    -3.235415, 0, -5.154624,
	    -3.387356, 0, -5.430472,
	    -3.235415, 1, -5.154624,
	    -3.387356, 1, -5.430472,
	    -3.235415, 2, -5.154624,
	    -3.387356, 2, -5.430472
	   ]);
	   var posLoc13 = gl.getAttribLocation(prog13, "aPos");
	   var colLoc13 = gl.getAttribLocation(prog13, "aCol");
	   var buf13 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
	   var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
	   // ****** text object 14 ******
	   var prog14  = gl.createProgram();
	   gl.attachShader(prog14, getShader( gl, "_2d_3d_pointsvshader14" ));
	   gl.attachShader(prog14, getShader( gl, "_2d_3d_pointsfshader14" ));
	   gl.linkProgram(prog14);
	   var texts = [
	    "-2",
	    "-1",
	    "0",
	    "1",
	    "2"
	   ];
	   var texinfo = drawTextToCanvas(texts, 1);	 
	   var canvasX14 = texinfo.canvasX;
	   var canvasY14 = texinfo.canvasY;
	   var ofsLoc14 = gl.getAttribLocation(prog14, "aOfs");
	   var texture14 = gl.createTexture();
	   var texLoc14 = gl.getAttribLocation(prog14, "aTexcoord");
	   var sampler14 = gl.getUniformLocation(prog14,"uSampler");
    	   handleLoadedTexture(texture14, document.getElementById("_2d_3d_pointstextureCanvas"));
	   var v=new Float32Array([
	    -3.691237, -2, -5.982168, 0, -0.5, 0.5, 0.5,
	    -3.691237, -2, -5.982168, 1, -0.5, 0.5, 0.5,
	    -3.691237, -2, -5.982168, 1, 1.5, 0.5, 0.5,
	    -3.691237, -2, -5.982168, 0, 1.5, 0.5, 0.5,
	    -3.691237, -1, -5.982168, 0, -0.5, 0.5, 0.5,
	    -3.691237, -1, -5.982168, 1, -0.5, 0.5, 0.5,
	    -3.691237, -1, -5.982168, 1, 1.5, 0.5, 0.5,
	    -3.691237, -1, -5.982168, 0, 1.5, 0.5, 0.5,
	    -3.691237, 0, -5.982168, 0, -0.5, 0.5, 0.5,
	    -3.691237, 0, -5.982168, 1, -0.5, 0.5, 0.5,
	    -3.691237, 0, -5.982168, 1, 1.5, 0.5, 0.5,
	    -3.691237, 0, -5.982168, 0, 1.5, 0.5, 0.5,
	    -3.691237, 1, -5.982168, 0, -0.5, 0.5, 0.5,
	    -3.691237, 1, -5.982168, 1, -0.5, 0.5, 0.5,
	    -3.691237, 1, -5.982168, 1, 1.5, 0.5, 0.5,
	    -3.691237, 1, -5.982168, 0, 1.5, 0.5, 0.5,
	    -3.691237, 2, -5.982168, 0, -0.5, 0.5, 0.5,
	    -3.691237, 2, -5.982168, 1, -0.5, 0.5, 0.5,
	    -3.691237, 2, -5.982168, 1, 1.5, 0.5, 0.5,
	    -3.691237, 2, -5.982168, 0, 1.5, 0.5, 0.5
	   ]);
	   for (var i=0; i<5; i++) 
	     for (var j=0; j<4; j++) {
	         ind = 7*(4*i + j) + 3;
	         v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i]/width;
	         v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight/height;
	         v[ind] *= texinfo.widths[i]/texinfo.canvasX;
	         v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
	           - v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
	     }
	   var posLoc14 = gl.getAttribLocation(prog14, "aPos");
	   var colLoc14 = gl.getAttribLocation(prog14, "aCol");
	   var f=new Uint16Array([
	    0, 1, 2, 0, 2, 3,
	    4, 5, 6, 4, 6, 7,
	    8, 9, 10, 8, 10, 11,
	    12, 13, 14, 12, 14, 15,
	    16, 17, 18, 16, 18, 19
	   ]);
	   var buf14 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var ibuf14 = gl.createBuffer();
	   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf14);
	   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
	   var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
	   var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
	   // ****** lines object 15 ******
	   var prog15  = gl.createProgram();
	   gl.attachShader(prog15, getShader( gl, "_2d_3d_pointsvshader15" ));
	   gl.attachShader(prog15, getShader( gl, "_2d_3d_pointsfshader15" ));
	   gl.linkProgram(prog15);
	   var v=new Float32Array([
	    -3.235415, -3.057625, -4,
	    -3.235415, -3.057625, 4,
	    -3.235415, -3.057625, -4,
	    -3.387356, -3.211077, -4,
	    -3.235415, -3.057625, -2,
	    -3.387356, -3.211077, -2,
	    -3.235415, -3.057625, 0,
	    -3.387356, -3.211077, 0,
	    -3.235415, -3.057625, 2,
	    -3.387356, -3.211077, 2,
	    -3.235415, -3.057625, 4,
	    -3.387356, -3.211077, 4
	   ]);
	   var posLoc15 = gl.getAttribLocation(prog15, "aPos");
	   var colLoc15 = gl.getAttribLocation(prog15, "aCol");
	   var buf15 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
	   var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
	   // ****** text object 16 ******
	   var prog16  = gl.createProgram();
	   gl.attachShader(prog16, getShader( gl, "_2d_3d_pointsvshader16" ));
	   gl.attachShader(prog16, getShader( gl, "_2d_3d_pointsfshader16" ));
	   gl.linkProgram(prog16);
	   var texts = [
	    "-4",
	    "-2",
	    "0",
	    "2",
	    "4"
	   ];
	   var texinfo = drawTextToCanvas(texts, 1);	 
	   var canvasX16 = texinfo.canvasX;
	   var canvasY16 = texinfo.canvasY;
	   var ofsLoc16 = gl.getAttribLocation(prog16, "aOfs");
	   var texture16 = gl.createTexture();
	   var texLoc16 = gl.getAttribLocation(prog16, "aTexcoord");
	   var sampler16 = gl.getUniformLocation(prog16,"uSampler");
    	   handleLoadedTexture(texture16, document.getElementById("_2d_3d_pointstextureCanvas"));
	   var v=new Float32Array([
	    -3.691237, -3.517982, -4, 0, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, -4, 1, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, -4, 1, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, -4, 0, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, -2, 0, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, -2, 1, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, -2, 1, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, -2, 0, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, 0, 0, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, 0, 1, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, 0, 1, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, 0, 0, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, 2, 0, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, 2, 1, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, 2, 1, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, 2, 0, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, 4, 0, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, 4, 1, -0.5, 0.5, 0.5,
	    -3.691237, -3.517982, 4, 1, 1.5, 0.5, 0.5,
	    -3.691237, -3.517982, 4, 0, 1.5, 0.5, 0.5
	   ]);
	   for (var i=0; i<5; i++) 
	     for (var j=0; j<4; j++) {
	         ind = 7*(4*i + j) + 3;
	         v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i]/width;
	         v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight/height;
	         v[ind] *= texinfo.widths[i]/texinfo.canvasX;
	         v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
	           - v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
	     }
	   var posLoc16 = gl.getAttribLocation(prog16, "aPos");
	   var colLoc16 = gl.getAttribLocation(prog16, "aCol");
	   var f=new Uint16Array([
	    0, 1, 2, 0, 2, 3,
	    4, 5, 6, 4, 6, 7,
	    8, 9, 10, 8, 10, 11,
	    12, 13, 14, 12, 14, 15,
	    16, 17, 18, 16, 18, 19
	   ]);
	   var buf16 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var ibuf16 = gl.createBuffer();
	   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf16);
	   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
	   var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
	   var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
	   // ****** lines object 17 ******
	   var prog17  = gl.createProgram();
	   gl.attachShader(prog17, getShader( gl, "_2d_3d_pointsvshader17" ));
	   gl.attachShader(prog17, getShader( gl, "_2d_3d_pointsfshader17" ));
	   gl.linkProgram(prog17);
	   var v=new Float32Array([
	    -3.235415, -3.057625, -5.154624,
	    -3.235415, 3.080462, -5.154624,
	    -3.235415, -3.057625, 5.87929,
	    -3.235415, 3.080462, 5.87929,
	    -3.235415, -3.057625, -5.154624,
	    -3.235415, -3.057625, 5.87929,
	    -3.235415, 3.080462, -5.154624,
	    -3.235415, 3.080462, 5.87929,
	    -3.235415, -3.057625, -5.154624,
	    2.842217, -3.057625, -5.154624,
	    -3.235415, -3.057625, 5.87929,
	    2.842217, -3.057625, 5.87929,
	    -3.235415, 3.080462, -5.154624,
	    2.842217, 3.080462, -5.154624,
	    -3.235415, 3.080462, 5.87929,
	    2.842217, 3.080462, 5.87929,
	    2.842217, -3.057625, -5.154624,
	    2.842217, 3.080462, -5.154624,
	    2.842217, -3.057625, 5.87929,
	    2.842217, 3.080462, 5.87929,
	    2.842217, -3.057625, -5.154624,
	    2.842217, -3.057625, 5.87929,
	    2.842217, 3.080462, -5.154624,
	    2.842217, 3.080462, 5.87929
	   ]);
	   var posLoc17 = gl.getAttribLocation(prog17, "aPos");
	   var colLoc17 = gl.getAttribLocation(prog17, "aCol");
	   var buf17 = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
	   var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
	   gl.enable(gl.DEPTH_TEST);
	   gl.depthFunc(gl.LEQUAL);
	   gl.clearDepth(1.0);
	   gl.clearColor(1, 1, 1, 1);
	   var xOffs = yOffs = 0,  drag  = 0;
	   drawScene();
	   function drawScene(){
	     gl.depthMask(true);
	     gl.disable(gl.BLEND);
	     var radius = 7.48261;
	     var s = sin(fov*PI/360);
	     var t = tan(fov*PI/360);
	     var distance = radius/s;
	     var near = distance - radius;
	     var far = distance + radius;
	     var hlen = t*near;
	     var aspect = width/height;
	     prMatrix.makeIdentity();
	     if (aspect > 1)
	       prMatrix.frustum(-hlen*aspect*zoom, hlen*aspect*zoom, 
	                        -hlen*zoom, hlen*zoom, near, far);
	     else  
	       prMatrix.frustum(-hlen*zoom, hlen*zoom, 
	                        -hlen*zoom/aspect, hlen*zoom/aspect, 
	                        near, far);
	     mvMatrix.makeIdentity();
	     mvMatrix.translate( 0.196599, -0.01141882, -0.3623331 );
	     mvMatrix.scale( 1.331167, 1.318056, 0.7332252 );   
	     mvMatrix.multRight( userMatrix );  
	     mvMatrix.translate(0, 0, -distance);
	     gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
	     // ****** points object 6 *******
	     gl.useProgram(prog6);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf6);
	     gl.uniformMatrix4fv( prMatLoc6, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc6, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc6 );
	     gl.enableVertexAttribArray( colLoc6 );
	     gl.vertexAttribPointer(colLoc6, 4, gl.FLOAT, false, 28, 12);
	     gl.vertexAttribPointer(posLoc6,  3, gl.FLOAT, false, 28,  0);
	     gl.drawArrays(gl.POINTS, 0, 1000);
	     // ****** text object 8 *******
	     gl.useProgram(prog8);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf8);
	     gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf8);
	     gl.uniformMatrix4fv( prMatLoc8, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc8, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc8 );
	     gl.disableVertexAttribArray( colLoc8 );
	     gl.vertexAttrib4f( colLoc8, 0, 0, 0, 1 );
	     gl.enableVertexAttribArray( texLoc8 );
	     gl.vertexAttribPointer(texLoc8, 2, gl.FLOAT, false, 28, 12);
	     gl.activeTexture(gl.TEXTURE0);
	     gl.bindTexture(gl.TEXTURE_2D, texture8);
	     gl.uniform1i( sampler8, 0);
	     gl.enableVertexAttribArray( ofsLoc8 );
	     gl.vertexAttribPointer(ofsLoc8, 2, gl.FLOAT, false, 28, 20);
	     gl.vertexAttribPointer(posLoc8,  3, gl.FLOAT, false, 28,  0);
	     gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
	     // ****** text object 9 *******
	     gl.useProgram(prog9);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
	     gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
	     gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc9 );
	     gl.disableVertexAttribArray( colLoc9 );
	     gl.vertexAttrib4f( colLoc9, 0, 0, 0, 1 );
	     gl.enableVertexAttribArray( texLoc9 );
	     gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
	     gl.activeTexture(gl.TEXTURE0);
	     gl.bindTexture(gl.TEXTURE_2D, texture9);
	     gl.uniform1i( sampler9, 0);
	     gl.enableVertexAttribArray( ofsLoc9 );
	     gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
	     gl.vertexAttribPointer(posLoc9,  3, gl.FLOAT, false, 28,  0);
	     gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
	     // ****** text object 10 *******
	     gl.useProgram(prog10);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
	     gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
	     gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc10 );
	     gl.disableVertexAttribArray( colLoc10 );
	     gl.vertexAttrib4f( colLoc10, 0, 0, 0, 1 );
	     gl.enableVertexAttribArray( texLoc10 );
	     gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
	     gl.activeTexture(gl.TEXTURE0);
	     gl.bindTexture(gl.TEXTURE_2D, texture10);
	     gl.uniform1i( sampler10, 0);
	     gl.enableVertexAttribArray( ofsLoc10 );
	     gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
	     gl.vertexAttribPointer(posLoc10,  3, gl.FLOAT, false, 28,  0);
	     gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
	     // ****** lines object 11 *******
	     gl.useProgram(prog11);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
	     gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc11 );
	     gl.disableVertexAttribArray( colLoc11 );
	     gl.vertexAttrib4f( colLoc11, 0, 0, 0, 1 );
	     gl.lineWidth( 1 );
	     gl.vertexAttribPointer(posLoc11,  3, gl.FLOAT, false, 12,  0);
	     gl.drawArrays(gl.LINES, 0, 14);
	     // ****** text object 12 *******
	     gl.useProgram(prog12);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
	     gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf12);
	     gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc12 );
	     gl.disableVertexAttribArray( colLoc12 );
	     gl.vertexAttrib4f( colLoc12, 0, 0, 0, 1 );
	     gl.enableVertexAttribArray( texLoc12 );
	     gl.vertexAttribPointer(texLoc12, 2, gl.FLOAT, false, 28, 12);
	     gl.activeTexture(gl.TEXTURE0);
	     gl.bindTexture(gl.TEXTURE_2D, texture12);
	     gl.uniform1i( sampler12, 0);
	     gl.enableVertexAttribArray( ofsLoc12 );
	     gl.vertexAttribPointer(ofsLoc12, 2, gl.FLOAT, false, 28, 20);
	     gl.vertexAttribPointer(posLoc12,  3, gl.FLOAT, false, 28,  0);
	     gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
	     // ****** lines object 13 *******
	     gl.useProgram(prog13);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
	     gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc13 );
	     gl.disableVertexAttribArray( colLoc13 );
	     gl.vertexAttrib4f( colLoc13, 0, 0, 0, 1 );
	     gl.lineWidth( 1 );
	     gl.vertexAttribPointer(posLoc13,  3, gl.FLOAT, false, 12,  0);
	     gl.drawArrays(gl.LINES, 0, 12);
	     // ****** text object 14 *******
	     gl.useProgram(prog14);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
	     gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf14);
	     gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc14 );
	     gl.disableVertexAttribArray( colLoc14 );
	     gl.vertexAttrib4f( colLoc14, 0, 0, 0, 1 );
	     gl.enableVertexAttribArray( texLoc14 );
	     gl.vertexAttribPointer(texLoc14, 2, gl.FLOAT, false, 28, 12);
	     gl.activeTexture(gl.TEXTURE0);
	     gl.bindTexture(gl.TEXTURE_2D, texture14);
	     gl.uniform1i( sampler14, 0);
	     gl.enableVertexAttribArray( ofsLoc14 );
	     gl.vertexAttribPointer(ofsLoc14, 2, gl.FLOAT, false, 28, 20);
	     gl.vertexAttribPointer(posLoc14,  3, gl.FLOAT, false, 28,  0);
	     gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
	     // ****** lines object 15 *******
	     gl.useProgram(prog15);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
	     gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc15 );
	     gl.disableVertexAttribArray( colLoc15 );
	     gl.vertexAttrib4f( colLoc15, 0, 0, 0, 1 );
	     gl.lineWidth( 1 );
	     gl.vertexAttribPointer(posLoc15,  3, gl.FLOAT, false, 12,  0);
	     gl.drawArrays(gl.LINES, 0, 12);
	     // ****** text object 16 *******
	     gl.useProgram(prog16);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
	     gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf16);
	     gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc16 );
	     gl.disableVertexAttribArray( colLoc16 );
	     gl.vertexAttrib4f( colLoc16, 0, 0, 0, 1 );
	     gl.enableVertexAttribArray( texLoc16 );
	     gl.vertexAttribPointer(texLoc16, 2, gl.FLOAT, false, 28, 12);
	     gl.activeTexture(gl.TEXTURE0);
	     gl.bindTexture(gl.TEXTURE_2D, texture16);
	     gl.uniform1i( sampler16, 0);
	     gl.enableVertexAttribArray( ofsLoc16 );
	     gl.vertexAttribPointer(ofsLoc16, 2, gl.FLOAT, false, 28, 20);
	     gl.vertexAttribPointer(posLoc16,  3, gl.FLOAT, false, 28,  0);
	     gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
	     // ****** lines object 17 *******
	     gl.useProgram(prog17);
	     gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
	     gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc17 );
	     gl.disableVertexAttribArray( colLoc17 );
	     gl.vertexAttrib4f( colLoc17, 0, 0, 0, 1 );
	     gl.lineWidth( 1 );
	     gl.vertexAttribPointer(posLoc17,  3, gl.FLOAT, false, 12,  0);
	     gl.drawArrays(gl.LINES, 0, 24);
	     gl.flush ();
	   }
	   var vlen = function(v) {
	     return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
	   }
	   var xprod = function(a, b) {
	     return [a[1]*b[2] - a[2]*b[1],
	             a[2]*b[0] - a[0]*b[2],
	             a[0]*b[1] - a[1]*b[0]];
	   }
	   var screenToVector = function(x, y) {
	     var radius = max(width, height)/2.0;
	     var cx = width/2.0;
	     var cy = height/2.0;
	     var px = (x-cx)/radius;
	     var py = (y-cy)/radius;
	     var plen = sqrt(px*px+py*py);
	     if (plen > 1.e-6) { 
	       px = px/plen;
	       py = py/plen;
	     }
	     var angle = (SQRT2 - plen)/SQRT2*PI/2;
	     var z = sin(angle);
	     var zlen = sqrt(1.0 - z*z);
	     px = px * zlen;
	     py = py * zlen;
	     return [px, py, z];
	   }
	   var rotBase;
	   var trackballdown = function(x,y) {
	     rotBase = screenToVector(x, y);
	     saveMat.load(userMatrix);
	   }
	   var trackballmove = function(x,y) {
	     var rotCurrent = screenToVector(x,y);
	     var dot = rotBase[0]*rotCurrent[0] + 
	   	       rotBase[1]*rotCurrent[1] + 
	   	       rotBase[2]*rotCurrent[2];
	     var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
	     var axis = xprod(rotBase, rotCurrent);
	     userMatrix.load(saveMat);
	     userMatrix.rotate(angle, axis[0], axis[1], axis[2]);
	     drawScene();
	   }
	   var y0zoom = 0;
	   var zoom0 = 1;
	   var zoomdown = function(x, y) {
	     y0zoom = y;
	     zoom0 = log(zoom);
	   }
	   var zoommove = function(x, y) {
	     zoom = exp(zoom0 + (y-y0zoom)/height);
	     drawScene();
	   }
	   var y0fov = 0;
	   var fov0 = 1;
	   var fovdown = function(x, y) {
	     y0fov = y;
	     fov0 = fov;
	   }
	   var fovmove = function(x, y) {
	     fov = max(1, min(179, fov0 + 180*(y-y0fov)/height));
	     drawScene();
	   }
	   var mousedown = [trackballdown, zoomdown, fovdown];
	   var mousemove = [trackballmove, zoommove, fovmove];
	   function relMouseCoords(event){
	     var totalOffsetX = 0;
	     var totalOffsetY = 0;
	     var currentElement = canvas;
	     do{
	       totalOffsetX += currentElement.offsetLeft;
	       totalOffsetY += currentElement.offsetTop;
	     }
	     while(currentElement = currentElement.offsetParent)
	     var canvasX = event.pageX - totalOffsetX;
	     var canvasY = event.pageY - totalOffsetY;
	     return {x:canvasX, y:canvasY}
	   }
	   canvas.onmousedown = function ( ev ){
	     if (!ev.which) // Use w3c defns in preference to MS
	       switch (ev.button) {
	       case 0: ev.which = 1; break;
	       case 1: 
	       case 4: ev.which = 2; break;
	       case 2: ev.which = 3;
	     }
	     drag = ev.which;
	     var f = mousedown[drag-1];
	     if (f) {
	       var coords = relMouseCoords(ev);
	       f(coords.x, height-coords.y); 
	       ev.preventDefault();
	     }
	   }    
	   canvas.onmouseup = function ( ev ){	
	     drag = 0;
	   }
	   canvas.onmouseout = canvas.onmouseup;
	   canvas.onmousemove = function ( ev ){
	     if ( drag == 0 ) return;
	     var f = mousemove[drag-1];
	     if (f) {
	       var coords = relMouseCoords(ev);
	       f(coords.x, height-coords.y);
	     }
	   }
	   var wheelHandler = function(ev) {
	     var del = 1.1;
	     if (ev.shiftKey) del = 1.01;
	     var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
	     zoom *= ds;
	     drawScene();
	     ev.preventDefault();
	   };
	   canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
	   canvas.addEventListener("mousewheel", wheelHandler, false);
	}
</script>
<canvas id="_2d_3d_pointscanvas" width="1" height="1"></canvas> 
<p id="_2d_3d_pointsdebug">
<img src="_2d_3d_pointssnapshot.png" alt="_2d_3d_pointssnapshot" width=505/><br>
	You must enable Javascript to view this page properly.</p>
<script>_2d_3d_pointswebGLStart();</script>

## spheres 3d graph ##

```r
open3d()
```

```
## [1] 2
```

```r
spheres3d(x, y, z, col = rainbow(1000))
```

<script src="CanvasMatrix.js" type="text/javascript"></script>
<canvas id="_2d_3d_spherestextureCanvas" style="display: none;" width="256" height="256">
<img src="_2d_3d_spheressnapshot.png" alt="_2d_3d_spheressnapshot" width=505/><br>
	Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 22 ****** -->
<script id="_2d_3d_spheresvshader22" type="x-shader/x-vertex">
	attribute vec3 aPos;
	attribute vec4 aCol;
	uniform mat4 mvMatrix;
	uniform mat4 prMatrix;
	varying vec4 vDiffuse;
	attribute vec3 aNorm;
	uniform mat4 normMatrix;
	varying vec3 vNormal;
	const vec3 diffuse = vec3(1., 1., 1.); // light only
	void main(void) {
	  gl_Position = prMatrix * mvMatrix * vec4(aPos, 1.);
	  vDiffuse = vec4(aCol.rgb * diffuse, aCol.a);
	  vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
	}
</script>
<script id="_2d_3d_spheresfshader22" type="x-shader/x-fragment"> 
	#ifdef GL_ES
	precision highp float;
	#endif
	varying vec4 vDiffuse; // carries alpha
	const vec3 ambient_plus_emission = vec3(0., 0., 0.);
	const vec3 specular = vec3(1., 1., 1.);// light*material
	const float shininess = 50.;
	const vec3 lightDir = vec3(0., 0., 1.);
	const vec3 halfVec = vec3(0., 0., 1.);
	const vec3 eye = vec3(0., 0., 1.);
	varying vec3 vNormal;
	void main(void) {
	  vec4 diffuse;
	  vec3 n = normalize(vNormal);
	  vec3 col = ambient_plus_emission;
	  n = -faceforward(n, n, eye);
	  float nDotL = dot(n, lightDir);
	  col = col + max(nDotL, 0.) * vDiffuse.rgb;
	  col = col + pow(max(dot(halfVec, n), 0.), shininess) * specular;
	  diffuse = vec4(col, vDiffuse.a);
	  gl_FragColor = diffuse;
	}
</script> 
<script type="text/javascript"> 
	function getShader ( gl, id ){
	   var shaderScript = document.getElementById ( id );
	   var str = "";
	   var k = shaderScript.firstChild;
	   while ( k ){
	     if ( k.nodeType == 3 ) str += k.textContent;
	     k = k.nextSibling;
	   }
	   var shader;
	   if ( shaderScript.type == "x-shader/x-fragment" )
             shader = gl.createShader ( gl.FRAGMENT_SHADER );
	   else if ( shaderScript.type == "x-shader/x-vertex" )
             shader = gl.createShader(gl.VERTEX_SHADER);
	   else return null;
	   gl.shaderSource(shader, str);
	   gl.compileShader(shader);
	   if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
	     alert(gl.getShaderInfoLog(shader));
	   return shader;
	}
	var min = Math.min;
	var max = Math.max;
	var sqrt = Math.sqrt;
	var sin = Math.sin;
	var acos = Math.acos;
	var tan = Math.tan;
	var SQRT2 = Math.SQRT2;
	var PI = Math.PI;
	var log = Math.log;
	var exp = Math.exp;
	function _2d_3d_sphereswebGLStart() {
	   var debug = function(msg) {
	     document.getElementById("_2d_3d_spheresdebug").innerHTML = msg;
	   }
	   debug("");
	   var canvas = document.getElementById("_2d_3d_spherescanvas");
	   if (!window.WebGLRenderingContext){
	     debug("<img src=\"_2d_3d_spheressnapshot.png\" alt=\"_2d_3d_spheressnapshot\" width=505/><br> Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
	     return;
	   }
	   var gl;
	   try {
	     // Try to grab the standard context. If it fails, fallback to experimental.
	     gl = canvas.getContext("webgl") 
	       || canvas.getContext("experimental-webgl");
	   }
	   catch(e) {}
	   if ( !gl ) {
	     debug("<img src=\"_2d_3d_spheressnapshot.png\" alt=\"_2d_3d_spheressnapshot\" width=505/><br> Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
	     return;
	   }
	   var width = 505;  var height = 505;
	   canvas.width = width;   canvas.height = height;
	   gl.viewport(0, 0, width, height);
	   var prMatrix = new CanvasMatrix4();
	   var mvMatrix = new CanvasMatrix4();
	   var normMatrix = new CanvasMatrix4();
	   var saveMat = new CanvasMatrix4();
	   saveMat.makeIdentity();
	   var distance;
	   var zoom = 1;
	   var fov = 30;
	   var userMatrix = new CanvasMatrix4();
	   userMatrix.load([
	    1, 0, 0, 0,
	    0, 0.3420201, -0.9396926, 0,
	    0, 0.9396926, 0.3420201, 0,
	    0, 0, 0, 1
		]);
	   function getPowerOfTwo(value) {
	     var pow = 1;
	     while(pow<value) {
	       pow *= 2;
	     }
	     return pow;
	   }
	   function handleLoadedTexture(texture, textureCanvas) {
	     gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
	     gl.bindTexture(gl.TEXTURE_2D, texture);
	     gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
	     gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
	     gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
	     gl.generateMipmap(gl.TEXTURE_2D);
	     gl.bindTexture(gl.TEXTURE_2D, null);
	   }
	   function loadImageToTexture(filename, texture) {   
	     var canvas = document.getElementById("_2d_3d_spherestextureCanvas");
	     var ctx = canvas.getContext("2d");
	     var image = new Image();
	     image.onload = function() {
	       var w = image.width;
	       var h = image.height;
	       var canvasX = getPowerOfTwo(w);
	       var canvasY = getPowerOfTwo(h);
	       canvas.width = canvasX;
	       canvas.height = canvasY;
	       ctx.imageSmoothingEnabled = true;
	       ctx.drawImage(image, 0, 0, canvasX, canvasY);
	       handleLoadedTexture(texture, canvas);
   	       drawScene();
	     }
	     image.src = filename;
	   }  	   
	   // ****** sphere object ******
	   var v=new Float32Array([
	    -1, 0, 0,
	    1, 0, 0,
	    0, -1, 0,
	    0, 1, 0,
	    0, 0, -1,
	    0, 0, 1,
	    -0.7071068, 0, -0.7071068,
	    -0.7071068, -0.7071068, 0,
	    0, -0.7071068, -0.7071068,
	    -0.7071068, 0, 0.7071068,
	    0, -0.7071068, 0.7071068,
	    -0.7071068, 0.7071068, 0,
	    0, 0.7071068, -0.7071068,
	    0, 0.7071068, 0.7071068,
	    0.7071068, -0.7071068, 0,
	    0.7071068, 0, -0.7071068,
	    0.7071068, 0, 0.7071068,
	    0.7071068, 0.7071068, 0,
	    -0.9349975, 0, -0.3546542,
	    -0.9349975, -0.3546542, 0,
	    -0.77044, -0.4507894, -0.4507894,
	    0, -0.3546542, -0.9349975,
	    -0.3546542, 0, -0.9349975,
	    -0.4507894, -0.4507894, -0.77044,
	    -0.3546542, -0.9349975, 0,
	    0, -0.9349975, -0.3546542,
	    -0.4507894, -0.77044, -0.4507894,
	    -0.9349975, 0, 0.3546542,
	    -0.77044, -0.4507894, 0.4507894,
	    0, -0.9349975, 0.3546542,
	    -0.4507894, -0.77044, 0.4507894,
	    -0.3546542, 0, 0.9349975,
	    0, -0.3546542, 0.9349975,
	    -0.4507894, -0.4507894, 0.77044,
	    -0.9349975, 0.3546542, 0,
	    -0.77044, 0.4507894, -0.4507894,
	    0, 0.9349975, -0.3546542,
	    -0.3546542, 0.9349975, 0,
	    -0.4507894, 0.77044, -0.4507894,
	    0, 0.3546542, -0.9349975,
	    -0.4507894, 0.4507894, -0.77044,
	    -0.77044, 0.4507894, 0.4507894,
	    0, 0.3546542, 0.9349975,
	    -0.4507894, 0.4507894, 0.77044,
	    0, 0.9349975, 0.3546542,
	    -0.4507894, 0.77044, 0.4507894,
	    0.9349975, -0.3546542, 0,
	    0.9349975, 0, -0.3546542,
	    0.77044, -0.4507894, -0.4507894,
	    0.3546542, -0.9349975, 0,
	    0.4507894, -0.77044, -0.4507894,
	    0.3546542, 0, -0.9349975,
	    0.4507894, -0.4507894, -0.77044,
	    0.9349975, 0, 0.3546542,
	    0.77044, -0.4507894, 0.4507894,
	    0.3546542, 0, 0.9349975,
	    0.4507894, -0.4507894, 0.77044,
	    0.4507894, -0.77044, 0.4507894,
	    0.9349975, 0.3546542, 0,
	    0.77044, 0.4507894, -0.4507894,
	    0.4507894, 0.4507894, -0.77044,
	    0.3546542, 0.9349975, 0,
	    0.4507894, 0.77044, -0.4507894,
	    0.77044, 0.4507894, 0.4507894,
	    0.4507894, 0.77044, 0.4507894,
	    0.4507894, 0.4507894, 0.77044
	   ]);
	   var f=new Uint16Array([
	    0, 18, 19,
	    6, 20, 18,
	    7, 19, 20,
	    19, 18, 20,
	    4, 21, 22,
	    8, 23, 21,
	    6, 22, 23,
	    22, 21, 23,
	    2, 24, 25,
	    7, 26, 24,
	    8, 25, 26,
	    25, 24, 26,
	    7, 20, 26,
	    6, 23, 20,
	    8, 26, 23,
	    26, 20, 23,
	    0, 19, 27,
	    7, 28, 19,
	    9, 27, 28,
	    27, 19, 28,
	    2, 29, 24,
	    10, 30, 29,
	    7, 24, 30,
	    24, 29, 30,
	    5, 31, 32,
	    9, 33, 31,
	    10, 32, 33,
	    32, 31, 33,
	    9, 28, 33,
	    7, 30, 28,
	    10, 33, 30,
	    33, 28, 30,
	    0, 34, 18,
	    11, 35, 34,
	    6, 18, 35,
	    18, 34, 35,
	    3, 36, 37,
	    12, 38, 36,
	    11, 37, 38,
	    37, 36, 38,
	    4, 22, 39,
	    6, 40, 22,
	    12, 39, 40,
	    39, 22, 40,
	    6, 35, 40,
	    11, 38, 35,
	    12, 40, 38,
	    40, 35, 38,
	    0, 27, 34,
	    9, 41, 27,
	    11, 34, 41,
	    34, 27, 41,
	    5, 42, 31,
	    13, 43, 42,
	    9, 31, 43,
	    31, 42, 43,
	    3, 37, 44,
	    11, 45, 37,
	    13, 44, 45,
	    44, 37, 45,
	    11, 41, 45,
	    9, 43, 41,
	    13, 45, 43,
	    45, 41, 43,
	    1, 46, 47,
	    14, 48, 46,
	    15, 47, 48,
	    47, 46, 48,
	    2, 25, 49,
	    8, 50, 25,
	    14, 49, 50,
	    49, 25, 50,
	    4, 51, 21,
	    15, 52, 51,
	    8, 21, 52,
	    21, 51, 52,
	    15, 48, 52,
	    14, 50, 48,
	    8, 52, 50,
	    52, 48, 50,
	    1, 53, 46,
	    16, 54, 53,
	    14, 46, 54,
	    46, 53, 54,
	    5, 32, 55,
	    10, 56, 32,
	    16, 55, 56,
	    55, 32, 56,
	    2, 49, 29,
	    14, 57, 49,
	    10, 29, 57,
	    29, 49, 57,
	    14, 54, 57,
	    16, 56, 54,
	    10, 57, 56,
	    57, 54, 56,
	    1, 47, 58,
	    15, 59, 47,
	    17, 58, 59,
	    58, 47, 59,
	    4, 39, 51,
	    12, 60, 39,
	    15, 51, 60,
	    51, 39, 60,
	    3, 61, 36,
	    17, 62, 61,
	    12, 36, 62,
	    36, 61, 62,
	    17, 59, 62,
	    15, 60, 59,
	    12, 62, 60,
	    62, 59, 60,
	    1, 58, 53,
	    17, 63, 58,
	    16, 53, 63,
	    53, 58, 63,
	    3, 44, 61,
	    13, 64, 44,
	    17, 61, 64,
	    61, 44, 64,
	    5, 55, 42,
	    16, 65, 55,
	    13, 42, 65,
	    42, 55, 65,
	    16, 63, 65,
	    17, 64, 63,
	    13, 65, 64,
	    65, 63, 64
	   ]);
	   var sphereBuf = gl.createBuffer();
	   gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
	   gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
	   var sphereIbuf = gl.createBuffer();
	   gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
	   gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
	   // ****** spheres object 22 ******
	   var prog22  = gl.createProgram();
	   gl.attachShader(prog22, getShader( gl, "_2d_3d_spheresvshader22" ));
	   gl.attachShader(prog22, getShader( gl, "_2d_3d_spheresfshader22" ));
	   gl.linkProgram(prog22);
	   var v=new Float32Array([
	    -3.146906, -0.5712776, -1.304654, 1, 0, 0, 1, 1,
	    -3.134337, 0.248515, -1.521878, 1, 0.007843138, 0, 1, 1,
	    -3.105278, 0.4111612, -0.5294744, 1, 0.01176471, 0, 1, 1,
	    -2.844787, 0.2585116, -3.378242, 1, 0.01960784, 0, 1, 1,
	    -2.791817, 0.1122097, -1.978323, 1, 0.02352941, 0, 1, 1,
	    -2.784959, -0.711042, -1.092817, 1, 0.03137255, 0, 1, 1,
	    -2.559316, 0.7733727, -1.225769, 1, 0.03529412, 0, 1, 1,
	    -2.507098, 0.926348, -1.363295, 1, 0.04313726, 0, 1, 1,
	    -2.219861, -0.1773772, -2.665483, 1, 0.04705882, 0, 1, 1,
	    -2.182233, 0.5145597, -0.2917455, 1, 0.05490196, 0, 1, 1,
	    -2.175695, 0.409849, -0.7276564, 1, 0.05882353, 0, 1, 1,
	    -2.123515, -1.553233, -3.529431, 1, 0.06666667, 0, 1, 1,
	    -2.108868, 0.7112859, -2.601137, 1, 0.07058824, 0, 1, 1,
	    -2.107958, 0.3210551, -2.226578, 1, 0.07843138, 0, 1, 1,
	    -2.082845, -0.7608378, -0.9726609, 1, 0.08235294, 0, 1, 1,
	    -2.075964, -0.417619, -2.095001, 1, 0.09019608, 0, 1, 1,
	    -2.045905, -1.740814, -2.726324, 1, 0.09411765, 0, 1, 1,
	    -2.015503, 0.5158128, 0.3482236, 1, 0.1019608, 0, 1, 1,
	    -1.975963, -0.6694118, -0.9182349, 1, 0.1098039, 0, 1, 1,
	    -1.975519, -0.6343129, -1.65338, 1, 0.1137255, 0, 1, 1,
	    -1.906926, -0.09151675, -1.442231, 1, 0.1215686, 0, 1, 1,
	    -1.904514, -0.4434961, -0.9564227, 1, 0.1254902, 0, 1, 1,
	    -1.85512, 0.5082575, 0.1973629, 1, 0.1333333, 0, 1, 1,
	    -1.822428, -0.5014544, -2.710975, 1, 0.1372549, 0, 1, 1,
	    -1.797449, -0.3575618, -1.998557, 1, 0.145098, 0, 1, 1,
	    -1.782416, 1.279261, -1.751515, 1, 0.1490196, 0, 1, 1,
	    -1.763729, 0.5726739, -0.9573719, 1, 0.1568628, 0, 1, 1,
	    -1.763319, -0.7835662, -1.334636, 1, 0.1607843, 0, 1, 1,
	    -1.742096, -0.9785421, -2.791204, 1, 0.1686275, 0, 1, 1,
	    -1.700091, -1.819068, -1.916485, 1, 0.172549, 0, 1, 1,
	    -1.68357, 1.154099, -1.988515, 1, 0.1803922, 0, 1, 1,
	    -1.669532, -0.248904, -0.5265087, 1, 0.1843137, 0, 1, 1,
	    -1.668744, -0.6991448, -1.238914, 1, 0.1921569, 0, 1, 1,
	    -1.667124, 0.1051634, -0.9729878, 1, 0.1960784, 0, 1, 1,
	    -1.654439, 0.3109881, -1.270912, 1, 0.2039216, 0, 1, 1,
	    -1.646071, -1.072061, -2.164583, 1, 0.2117647, 0, 1, 1,
	    -1.643901, 0.4731493, -0.5499268, 1, 0.2156863, 0, 1, 1,
	    -1.614742, -0.6113654, -3.146717, 1, 0.2235294, 0, 1, 1,
	    -1.614431, 0.3969905, -0.01469224, 1, 0.227451, 0, 1, 1,
	    -1.602143, 1.321779, -1.702532, 1, 0.2352941, 0, 1, 1,
	    -1.578714, -0.6235344, -1.455792, 1, 0.2392157, 0, 1, 1,
	    -1.568384, 0.8056578, -0.1188443, 1, 0.2470588, 0, 1, 1,
	    -1.564701, 0.4206351, -1.274573, 1, 0.2509804, 0, 1, 1,
	    -1.548427, -0.3611487, -1.965855, 1, 0.2588235, 0, 1, 1,
	    -1.545828, 0.8012204, 1.728047, 1, 0.2627451, 0, 1, 1,
	    -1.539553, -0.6062017, -0.8984288, 1, 0.2705882, 0, 1, 1,
	    -1.523834, -2.172777, -0.5945879, 1, 0.2745098, 0, 1, 1,
	    -1.514153, 1.109383, 0.2944165, 1, 0.282353, 0, 1, 1,
	    -1.510714, 0.7304044, -1.373346, 1, 0.2862745, 0, 1, 1,
	    -1.478655, -0.2409343, -0.6857944, 1, 0.2941177, 0, 1, 1,
	    -1.441429, 0.04861115, -1.787688, 1, 0.3019608, 0, 1, 1,
	    -1.423033, 1.2977, -0.1867998, 1, 0.3058824, 0, 1, 1,
	    -1.419441, 0.6224449, -2.11411, 1, 0.3137255, 0, 1, 1,
	    -1.408561, -0.6275776, -3.129275, 1, 0.3176471, 0, 1, 1,
	    -1.405361, -1.414594, -1.85091, 1, 0.3254902, 0, 1, 1,
	    -1.403119, -1.053484, -0.9741056, 1, 0.3294118, 0, 1, 1,
	    -1.353278, 0.1074707, -0.7104663, 1, 0.3372549, 0, 1, 1,
	    -1.350894, 1.399289, 1.547451, 1, 0.3411765, 0, 1, 1,
	    -1.350585, -1.494398, -1.915541, 1, 0.3490196, 0, 1, 1,
	    -1.350136, 0.158276, -1.801652, 1, 0.3529412, 0, 1, 1,
	    -1.348556, 0.3851964, -1.102027, 1, 0.3607843, 0, 1, 1,
	    -1.344257, 0.2971409, -1.088968, 1, 0.3647059, 0, 1, 1,
	    -1.342256, -0.7882853, -3.550071, 1, 0.372549, 0, 1, 1,
	    -1.331255, 0.8563269, -2.042815, 1, 0.3764706, 0, 1, 1,
	    -1.330984, 0.6317903, -0.374843, 1, 0.3843137, 0, 1, 1,
	    -1.329692, 0.6013628, -1.211427, 1, 0.3882353, 0, 1, 1,
	    -1.323953, -0.885012, -1.614565, 1, 0.3960784, 0, 1, 1,
	    -1.318757, 0.2187881, -0.8594832, 1, 0.4039216, 0, 1, 1,
	    -1.316377, 0.8568754, -1.276602, 1, 0.4078431, 0, 1, 1,
	    -1.304337, -0.4078288, -2.24041, 1, 0.4156863, 0, 1, 1,
	    -1.299299, 0.6680412, -0.2038958, 1, 0.4196078, 0, 1, 1,
	    -1.284557, 1.122775, -1.496067, 1, 0.427451, 0, 1, 1,
	    -1.270918, -0.05961537, -2.034209, 1, 0.4313726, 0, 1, 1,
	    -1.270175, 1.671815, 0.02826078, 1, 0.4392157, 0, 1, 1,
	    -1.266914, -1.131811, -3.476238, 1, 0.4431373, 0, 1, 1,
	    -1.263694, -1.220749, -0.7848217, 1, 0.4509804, 0, 1, 1,
	    -1.261683, 1.072679, -1.486606, 1, 0.454902, 0, 1, 1,
	    -1.258951, 0.3480777, -0.9418088, 1, 0.4627451, 0, 1, 1,
	    -1.256753, -0.7612935, -1.25694, 1, 0.4666667, 0, 1, 1,
	    -1.254661, 0.005102762, -2.537105, 1, 0.4745098, 0, 1, 1,
	    -1.253345, 1.361341, -2.024161, 1, 0.4784314, 0, 1, 1,
	    -1.2522, 0.8167412, -1.034257, 1, 0.4862745, 0, 1, 1,
	    -1.248363, -0.766192, -1.972353, 1, 0.4901961, 0, 1, 1,
	    -1.242884, -0.2611029, -0.9402236, 1, 0.4980392, 0, 1, 1,
	    -1.242698, -0.99998, -3.090504, 1, 0.5058824, 0, 1, 1,
	    -1.242606, 1.597389, 0.2824649, 1, 0.509804, 0, 1, 1,
	    -1.240279, 1.457333, -1.962362, 1, 0.5176471, 0, 1, 1,
	    -1.234339, -0.01223461, -1.659283, 1, 0.5215687, 0, 1, 1,
	    -1.22696, -0.6901382, -1.96381, 1, 0.5294118, 0, 1, 1,
	    -1.217991, 1.482551, -2.592246, 1, 0.5333334, 0, 1, 1,
	    -1.204893, -0.3863956, -0.406497, 1, 0.5411765, 0, 1, 1,
	    -1.203505, 0.704877, -1.922794, 1, 0.5450981, 0, 1, 1,
	    -1.198965, 1.780028, -0.6224378, 1, 0.5529412, 0, 1, 1,
	    -1.180786, -1.684559, -1.381659, 1, 0.5568628, 0, 1, 1,
	    -1.177147, 1.293021, -2.23198, 1, 0.5647059, 0, 1, 1,
	    -1.175963, 0.8844612, -0.9076601, 1, 0.5686275, 0, 1, 1,
	    -1.169231, -1.966052, -3.258402, 1, 0.5764706, 0, 1, 1,
	    -1.16338, 0.2019109, -0.2026392, 1, 0.5803922, 0, 1, 1,
	    -1.162047, -0.158064, -2.22184, 1, 0.5882353, 0, 1, 1,
	    -1.160422, 0.8181173, -3.090211, 1, 0.5921569, 0, 1, 1,
	    -1.143501, -1.139719, -2.174399, 1, 0.6, 0, 1, 1,
	    -1.13811, -1.547854, -3.938524, 1, 0.6078432, 0, 1, 1,
	    -1.12428, -1.954584, -3.690095, 1, 0.6117647, 0, 1, 1,
	    -1.099015, -0.3165934, -2.808158, 1, 0.6196079, 0, 1, 1,
	    -1.083318, -0.2172817, -2.306851, 1, 0.6235294, 0, 1, 1,
	    -1.077073, -0.4354704, -2.805918, 1, 0.6313726, 0, 1, 1,
	    -1.069129, 0.2470699, -1.037625, 1, 0.6352941, 0, 1, 1,
	    -1.063868, 1.489288, -1.91411, 1, 0.6431373, 0, 1, 1,
	    -1.056137, -0.112663, -2.033748, 1, 0.6470588, 0, 1, 1,
	    -1.051814, 0.4170049, -0.9544704, 1, 0.654902, 0, 1, 1,
	    -1.050652, 0.4397123, -0.4781988, 1, 0.6588235, 0, 1, 1,
	    -1.046518, -1.395492, -0.9369832, 1, 0.6666667, 0, 1, 1,
	    -1.043192, 1.424446, 1.331642, 1, 0.6705883, 0, 1, 1,
	    -1.042061, 0.6473455, -2.174601, 1, 0.6784314, 0, 1, 1,
	    -1.036252, 1.121711, 0.7223151, 1, 0.682353, 0, 1, 1,
	    -1.023946, 1.574672, -1.524623, 1, 0.6901961, 0, 1, 1,
	    -1.019738, 0.9291021, -1.079201, 1, 0.6941177, 0, 1, 1,
	    -1.011781, -1.683624, -3.193164, 1, 0.7019608, 0, 1, 1,
	    -1.006389, 0.4458798, -1.864044, 1, 0.7098039, 0, 1, 1,
	    -0.9992222, -0.3342909, -1.045937, 1, 0.7137255, 0, 1, 1,
	    -0.9987044, 0.4009832, -1.739187, 1, 0.7215686, 0, 1, 1,
	    -0.9906636, 0.3365992, -0.1872034, 1, 0.7254902, 0, 1, 1,
	    -0.9885818, -0.6630397, -3.011725, 1, 0.7333333, 0, 1, 1,
	    -0.9858498, -0.6165054, -2.871337, 1, 0.7372549, 0, 1, 1,
	    -0.9637575, 0.2259502, -2.846959, 1, 0.7450981, 0, 1, 1,
	    -0.9609846, 0.1987238, -2.750869, 1, 0.7490196, 0, 1, 1,
	    -0.9564541, 0.1054265, -2.44845, 1, 0.7568628, 0, 1, 1,
	    -0.9484985, -0.1368229, -2.273682, 1, 0.7607843, 0, 1, 1,
	    -0.9462824, -2.453158, -2.793691, 1, 0.7686275, 0, 1, 1,
	    -0.9410186, 0.2286697, -0.02012112, 1, 0.772549, 0, 1, 1,
	    -0.9350691, 0.7474854, -0.5998926, 1, 0.7803922, 0, 1, 1,
	    -0.9338174, -0.6736547, -3.541515, 1, 0.7843137, 0, 1, 1,
	    -0.9333303, -0.4228021, -1.356742, 1, 0.7921569, 0, 1, 1,
	    -0.9285724, 0.7868004, -0.6114022, 1, 0.7960784, 0, 1, 1,
	    -0.9274378, 0.1899723, -2.554821, 1, 0.8039216, 0, 1, 1,
	    -0.9270687, -1.086267, -2.73507, 1, 0.8117647, 0, 1, 1,
	    -0.9241491, 0.651414, -1.696126, 1, 0.8156863, 0, 1, 1,
	    -0.9224845, -1.213655, -3.862764, 1, 0.8235294, 0, 1, 1,
	    -0.9105715, 0.1732961, -0.8506026, 1, 0.827451, 0, 1, 1,
	    -0.9014618, 0.8663479, -0.6602482, 1, 0.8352941, 0, 1, 1,
	    -0.896875, -1.584243, 0.06355696, 1, 0.8392157, 0, 1, 1,
	    -0.8922928, -0.734427, -1.48562, 1, 0.8470588, 0, 1, 1,
	    -0.8915675, -0.508348, -0.9729213, 1, 0.8509804, 0, 1, 1,
	    -0.8900894, 2.449038, 1.072617, 1, 0.8588235, 0, 1, 1,
	    -0.8895386, 0.884676, -1.855799, 1, 0.8627451, 0, 1, 1,
	    -0.8813864, 0.602551, -0.7905866, 1, 0.8705882, 0, 1, 1,
	    -0.8769144, 0.4863247, -2.000475, 1, 0.8745098, 0, 1, 1,
	    -0.8759423, -1.255609, -1.5528, 1, 0.8823529, 0, 1, 1,
	    -0.8731839, 0.2577762, -1.697623, 1, 0.8862745, 0, 1, 1,
	    -0.8676267, 0.3076334, -1.42433, 1, 0.8941177, 0, 1, 1,
	    -0.861423, -0.4365948, -0.5851231, 1, 0.8980392, 0, 1, 1,
	    -0.8579227, -1.79311, -4.317077, 1, 0.9058824, 0, 1, 1,
	    -0.8567008, -1.050415, -2.989239, 1, 0.9137255, 0, 1, 1,
	    -0.8562334, 2.048608, -0.215252, 1, 0.9176471, 0, 1, 1,
	    -0.8479262, 1.40403, 0.6415924, 1, 0.9254902, 0, 1, 1,
	    -0.8451576, 1.887418, -0.6090735, 1, 0.9294118, 0, 1, 1,
	    -0.8439097, 0.5406764, -1.715353, 1, 0.9372549, 0, 1, 1,
	    -0.8433421, 0.4210153, 0.1196949, 1, 0.9411765, 0, 1, 1,
	    -0.8427588, -1.276794, -2.68511, 1, 0.9490196, 0, 1, 1,
	    -0.8348377, 2.08715, -2.062088, 1, 0.9529412, 0, 1, 1,
	    -0.8339448, 0.8461385, -1.665005, 1, 0.9607843, 0, 1, 1,
	    -0.8280094, 1.0042, -2.274293, 1, 0.9647059, 0, 1, 1,
	    -0.8266994, -0.03096794, -0.04414596, 1, 0.972549, 0, 1, 1,
	    -0.8258437, -0.6556534, -0.5602338, 1, 0.9764706, 0, 1, 1,
	    -0.8251136, 0.4861742, -0.417044, 1, 0.9843137, 0, 1, 1,
	    -0.8247356, 0.6820828, -1.278578, 1, 0.9882353, 0, 1, 1,
	    -0.8203144, -1.276851, -3.019026, 1, 0.9960784, 0, 1, 1,
	    -0.8177901, 0.3213887, -0.7713414, 0.9960784, 1, 0, 1, 1,
	    -0.8165891, -0.7036674, -4.15295, 0.9921569, 1, 0, 1, 1,
	    -0.8150407, 0.6713377, -0.7895522, 0.9843137, 1, 0, 1, 1,
	    -0.8138458, -1.249855, -2.435738, 0.9803922, 1, 0, 1, 1,
	    -0.8114775, 0.03451108, -1.630864, 0.972549, 1, 0, 1, 1,
	    -0.8100463, -0.385196, -4.028915, 0.9686275, 1, 0, 1, 1,
	    -0.8095151, -0.1198825, -3.076871, 0.9607843, 1, 0, 1, 1,
	    -0.8037989, 1.372023, -1.905989, 0.9568627, 1, 0, 1, 1,
	    -0.7980696, 1.944187, 0.6418205, 0.9490196, 1, 0, 1, 1,
	    -0.7976149, 2.442152, -2.631703, 0.945098, 1, 0, 1, 1,
	    -0.7969353, 1.091605, -0.7113526, 0.9372549, 1, 0, 1, 1,
	    -0.7918938, -0.05553446, -1.166415, 0.9333333, 1, 0, 1, 1,
	    -0.7845574, 0.1485611, -0.6848181, 0.9254902, 1, 0, 1, 1,
	    -0.7807397, 0.1970667, -0.9168099, 0.9215686, 1, 0, 1, 1,
	    -0.773112, -0.6765202, -2.873966, 0.9137255, 1, 0, 1, 1,
	    -0.7723824, 0.2148958, -0.6569834, 0.9098039, 1, 0, 1, 1,
	    -0.7720271, 0.6960204, 1.116547, 0.9019608, 1, 0, 1, 1,
	    -0.7702914, -1.017149, -1.025351, 0.8941177, 1, 0, 1, 1,
	    -0.7692175, 0.3225454, -0.5279848, 0.8901961, 1, 0, 1, 1,
	    -0.7692167, 0.1178737, -2.262358, 0.8823529, 1, 0, 1, 1,
	    -0.7633673, -0.5374758, -2.184233, 0.8784314, 1, 0, 1, 1,
	    -0.7600652, -0.6135046, -0.9990761, 0.8705882, 1, 0, 1, 1,
	    -0.7590914, 1.005812, 0.6560819, 0.8666667, 1, 0, 1, 1,
	    -0.7571398, 0.2669497, -1.779227, 0.8588235, 1, 0, 1, 1,
	    -0.7534277, -1.300633, -2.55425, 0.854902, 1, 0, 1, 1,
	    -0.746401, 0.9671679, -0.3548419, 0.8470588, 1, 0, 1, 1,
	    -0.7399771, 1.083189, -2.172747, 0.8431373, 1, 0, 1, 1,
	    -0.7378447, -0.6015003, -2.562219, 0.8352941, 1, 0, 1, 1,
	    -0.7292724, -1.768666, -2.287215, 0.8313726, 1, 0, 1, 1,
	    -0.7283937, 0.9216552, -1.130372, 0.8235294, 1, 0, 1, 1,
	    -0.7219724, -0.7795299, -2.520902, 0.8196079, 1, 0, 1, 1,
	    -0.7207498, -1.113274, -1.967158, 0.8117647, 1, 0, 1, 1,
	    -0.7187565, 1.472141, -1.299803, 0.8078431, 1, 0, 1, 1,
	    -0.7144001, 0.3179776, -2.145253, 0.8, 1, 0, 1, 1,
	    -0.698133, -1.594768, -4.333265, 0.7921569, 1, 0, 1, 1,
	    -0.6925234, -0.5931301, -0.4367567, 0.7882353, 1, 0, 1, 1,
	    -0.6881326, 0.7885892, -1.950298, 0.7803922, 1, 0, 1, 1,
	    -0.6774251, 1.093204, -1.18088, 0.7764706, 1, 0, 1, 1,
	    -0.6714011, -0.6395965, -1.193849, 0.7686275, 1, 0, 1, 1,
	    -0.6706638, 2.312945, -1.669243, 0.7647059, 1, 0, 1, 1,
	    -0.6704843, -1.459646, -2.46984, 0.7568628, 1, 0, 1, 1,
	    -0.6683666, 0.3225191, -0.2641588, 0.7529412, 1, 0, 1, 1,
	    -0.6663373, 0.1425802, -1.85336, 0.7450981, 1, 0, 1, 1,
	    -0.6633891, -0.5392434, -3.028617, 0.7411765, 1, 0, 1, 1,
	    -0.6608772, -1.168995, -2.651999, 0.7333333, 1, 0, 1, 1,
	    -0.6581141, -0.08257785, -1.905536, 0.7294118, 1, 0, 1, 1,
	    -0.6568323, 1.534663, 1.520873, 0.7215686, 1, 0, 1, 1,
	    -0.6503637, -2.063147, -2.144985, 0.7176471, 1, 0, 1, 1,
	    -0.6501253, -0.7646272, -2.667742, 0.7098039, 1, 0, 1, 1,
	    -0.6499103, 0.2876472, -2.293922, 0.7058824, 1, 0, 1, 1,
	    -0.6393084, -0.2631749, -2.032567, 0.6980392, 1, 0, 1, 1,
	    -0.6341143, -0.2899572, -1.287892, 0.6901961, 1, 0, 1, 1,
	    -0.6325483, 0.1316676, -2.527893, 0.6862745, 1, 0, 1, 1,
	    -0.6324074, 1.605149, 0.8613677, 0.6784314, 1, 0, 1, 1,
	    -0.6296275, -0.7818165, -3.349368, 0.6745098, 1, 0, 1, 1,
	    -0.6254754, -0.311826, -2.125525, 0.6666667, 1, 0, 1, 1,
	    -0.6250575, 0.8057449, -1.24985, 0.6627451, 1, 0, 1, 1,
	    -0.6234838, 0.410206, -1.474074, 0.654902, 1, 0, 1, 1,
	    -0.6201516, -0.9955272, -0.6796204, 0.6509804, 1, 0, 1, 1,
	    -0.6180312, -0.2337765, -2.067816, 0.6431373, 1, 0, 1, 1,
	    -0.6166437, -0.2005289, -1.678214, 0.6392157, 1, 0, 1, 1,
	    -0.6138217, 0.2034352, -1.249851, 0.6313726, 1, 0, 1, 1,
	    -0.6110006, 1.402202, -1.15887, 0.627451, 1, 0, 1, 1,
	    -0.6108452, -1.02281, -3.897901, 0.6196079, 1, 0, 1, 1,
	    -0.6081173, -0.3934186, -1.15633, 0.6156863, 1, 0, 1, 1,
	    -0.6078006, 0.1552292, 0.1578512, 0.6078432, 1, 0, 1, 1,
	    -0.604095, -0.2144339, -2.049018, 0.6039216, 1, 0, 1, 1,
	    -0.6037118, -1.442537, -2.77374, 0.5960785, 1, 0, 1, 1,
	    -0.6035097, 0.5289484, -0.4048283, 0.5882353, 1, 0, 1, 1,
	    -0.600808, -1.956989, -2.579975, 0.5843138, 1, 0, 1, 1,
	    -0.5990881, -0.4800493, -2.852541, 0.5764706, 1, 0, 1, 1,
	    -0.597191, 0.7598799, -1.60397, 0.572549, 1, 0, 1, 1,
	    -0.5966045, 0.6119961, -0.4447828, 0.5647059, 1, 0, 1, 1,
	    -0.5959867, -0.4076791, -1.910798, 0.5607843, 1, 0, 1, 1,
	    -0.5944453, 0.9104955, 0.05282759, 0.5529412, 1, 0, 1, 1,
	    -0.5941672, 0.9183374, 0.8773606, 0.5490196, 1, 0, 1, 1,
	    -0.5890618, -0.1920007, -3.165771, 0.5411765, 1, 0, 1, 1,
	    -0.5838025, -1.856761, -1.05959, 0.5372549, 1, 0, 1, 1,
	    -0.5808733, 0.4331484, -1.716445, 0.5294118, 1, 0, 1, 1,
	    -0.5805127, 2.141285, 0.126408, 0.5254902, 1, 0, 1, 1,
	    -0.5803594, 0.9050992, 1.498898, 0.5176471, 1, 0, 1, 1,
	    -0.5768038, -0.2484804, -1.961669, 0.5137255, 1, 0, 1, 1,
	    -0.5755417, -0.9629737, -3.25248, 0.5058824, 1, 0, 1, 1,
	    -0.57231, 0.7343075, -0.3094182, 0.5019608, 1, 0, 1, 1,
	    -0.5722368, -1.027968, -3.677606, 0.4941176, 1, 0, 1, 1,
	    -0.5676376, 0.7835763, 0.4413729, 0.4862745, 1, 0, 1, 1,
	    -0.5637824, 0.3480551, -0.6315777, 0.4823529, 1, 0, 1, 1,
	    -0.5630603, -0.8797238, -3.140658, 0.4745098, 1, 0, 1, 1,
	    -0.5624196, -2.505322, -0.4070503, 0.4705882, 1, 0, 1, 1,
	    -0.5595977, 0.8344491, -0.051674, 0.4627451, 1, 0, 1, 1,
	    -0.5588534, 0.4508642, -2.695847, 0.4588235, 1, 0, 1, 1,
	    -0.5562833, 0.1754092, -0.9679792, 0.4509804, 1, 0, 1, 1,
	    -0.556233, 1.973876, 1.226979, 0.4470588, 1, 0, 1, 1,
	    -0.5544715, -0.3478633, -1.486561, 0.4392157, 1, 0, 1, 1,
	    -0.5542025, 0.5521333, -0.9708505, 0.4352941, 1, 0, 1, 1,
	    -0.5534842, 0.4935877, 0.1988247, 0.427451, 1, 0, 1, 1,
	    -0.5505091, -2.71785, -3.262528, 0.4235294, 1, 0, 1, 1,
	    -0.5482972, -0.3088809, -2.189965, 0.4156863, 1, 0, 1, 1,
	    -0.5482841, 0.3156894, -2.417357, 0.4117647, 1, 0, 1, 1,
	    -0.5476352, -2.035521, -2.919295, 0.4039216, 1, 0, 1, 1,
	    -0.5433849, -0.8061776, -2.904838, 0.3960784, 1, 0, 1, 1,
	    -0.5407544, -0.3418379, -1.3983, 0.3921569, 1, 0, 1, 1,
	    -0.5407423, 1.875264, 0.1397846, 0.3843137, 1, 0, 1, 1,
	    -0.5386612, 0.0359333, -1.856493, 0.3803922, 1, 0, 1, 1,
	    -0.5365623, -0.8798941, -2.095544, 0.372549, 1, 0, 1, 1,
	    -0.5353712, -0.185546, -2.766385, 0.3686275, 1, 0, 1, 1,
	    -0.5329637, -0.7479315, -4.18485, 0.3607843, 1, 0, 1, 1,
	    -0.5327457, -0.4302462, -1.767011, 0.3568628, 1, 0, 1, 1,
	    -0.5277362, 1.995825, 1.078273, 0.3490196, 1, 0, 1, 1,
	    -0.5274831, -0.08972351, -1.623962, 0.345098, 1, 0, 1, 1,
	    -0.5239906, -2.080991, -1.643902, 0.3372549, 1, 0, 1, 1,
	    -0.5238396, -1.119969, -3.003465, 0.3333333, 1, 0, 1, 1,
	    -0.5221364, 1.233639, -0.0353597, 0.3254902, 1, 0, 1, 1,
	    -0.5203137, -2.533156, -3.13496, 0.3215686, 1, 0, 1, 1,
	    -0.5175972, 1.813367, -1.060525, 0.3137255, 1, 0, 1, 1,
	    -0.5174648, -0.6151349, -3.830195, 0.3098039, 1, 0, 1, 1,
	    -0.5167973, -1.096893, -3.772897, 0.3019608, 1, 0, 1, 1,
	    -0.5160482, -1.02983, -1.740719, 0.2941177, 1, 0, 1, 1,
	    -0.5149626, 1.206922, -0.1737793, 0.2901961, 1, 0, 1, 1,
	    -0.5107267, -1.568057, -1.600756, 0.282353, 1, 0, 1, 1,
	    -0.508549, 1.232373, -0.3814973, 0.2784314, 1, 0, 1, 1,
	    -0.5062495, -2.509341, -3.043851, 0.2705882, 1, 0, 1, 1,
	    -0.5058689, -1.41598, -0.3344893, 0.2666667, 1, 0, 1, 1,
	    -0.5056818, -0.9429926, -1.472941, 0.2588235, 1, 0, 1, 1,
	    -0.504693, -0.7804936, -1.870265, 0.254902, 1, 0, 1, 1,
	    -0.5022391, -0.7806193, -1.047498, 0.2470588, 1, 0, 1, 1,
	    -0.5022026, 0.1302363, -1.469969, 0.2431373, 1, 0, 1, 1,
	    -0.4972048, 0.1495005, -0.8163399, 0.2352941, 1, 0, 1, 1,
	    -0.4968185, 0.9255279, -1.278087, 0.2313726, 1, 0, 1, 1,
	    -0.4899775, 0.4339317, -0.0355177, 0.2235294, 1, 0, 1, 1,
	    -0.4821446, 1.210129, -1.051643, 0.2196078, 1, 0, 1, 1,
	    -0.4785571, -0.9228835, -2.204039, 0.2117647, 1, 0, 1, 1,
	    -0.4755331, -0.5838196, -2.591827, 0.2078431, 1, 0, 1, 1,
	    -0.4715798, 0.4418818, -0.8419792, 0.2, 1, 0, 1, 1,
	    -0.4678596, -0.8590072, -2.540234, 0.1921569, 1, 0, 1, 1,
	    -0.4658183, -0.9836263, -3.522256, 0.1882353, 1, 0, 1, 1,
	    -0.4655098, 0.2730663, -0.4474838, 0.1803922, 1, 0, 1, 1,
	    -0.4642281, -0.2957813, -3.42211, 0.1764706, 1, 0, 1, 1,
	    -0.4592587, -1.141325, -2.443703, 0.1686275, 1, 0, 1, 1,
	    -0.4585588, 1.111784, 1.493338, 0.1647059, 1, 0, 1, 1,
	    -0.4577912, 0.7822915, -0.6320353, 0.1568628, 1, 0, 1, 1,
	    -0.4374818, 0.4828807, -0.7506601, 0.1529412, 1, 0, 1, 1,
	    -0.4372454, -1.618357, -1.792162, 0.145098, 1, 0, 1, 1,
	    -0.4337441, -0.1100942, -1.306092, 0.1411765, 1, 0, 1, 1,
	    -0.4290987, 1.80997, -1.779823, 0.1333333, 1, 0, 1, 1,
	    -0.4282664, 0.4472926, -0.511809, 0.1294118, 1, 0, 1, 1,
	    -0.4272493, 0.3903974, -0.5387366, 0.1215686, 1, 0, 1, 1,
	    -0.4223464, -0.2574878, -2.805543, 0.1176471, 1, 0, 1, 1,
	    -0.4212975, -0.5984384, -2.017767, 0.1098039, 1, 0, 1, 1,
	    -0.4199424, -0.7147787, -2.581635, 0.1058824, 1, 0, 1, 1,
	    -0.4192354, 1.339764, -0.9549408, 0.09803922, 1, 0, 1, 1,
	    -0.4186761, 0.5152234, -2.928306, 0.09019608, 1, 0, 1, 1,
	    -0.4185404, 1.134547, -1.857512, 0.08627451, 1, 0, 1, 1,
	    -0.4110831, 1.5233, 1.201643, 0.07843138, 1, 0, 1, 1,
	    -0.4090314, -1.088871, -2.120044, 0.07450981, 1, 0, 1, 1,
	    -0.4081623, -0.3464304, -2.631243, 0.06666667, 1, 0, 1, 1,
	    -0.4073839, -0.2174345, 0.2535879, 0.0627451, 1, 0, 1, 1,
	    -0.40403, -0.3297348, -1.583895, 0.05490196, 1, 0, 1, 1,
	    -0.4037551, -1.002485, -2.307231, 0.05098039, 1, 0, 1, 1,
	    -0.4010081, 1.645148, 0.01662885, 0.04313726, 1, 0, 1, 1,
	    -0.3983037, -0.07565211, -3.252917, 0.03921569, 1, 0, 1, 1,
	    -0.3955089, -0.1296063, -1.610743, 0.03137255, 1, 0, 1, 1,
	    -0.3946153, -0.05112975, -1.068483, 0.02745098, 1, 0, 1, 1,
	    -0.3938779, 0.3542585, -0.3829606, 0.01960784, 1, 0, 1, 1,
	    -0.3901234, 0.5057293, -0.508234, 0.01568628, 1, 0, 1, 1,
	    -0.3895523, 1.928361, -0.6577095, 0.007843138, 1, 0, 1, 1,
	    -0.3883483, 0.1644049, -0.6534674, 0.003921569, 1, 0, 1, 1,
	    -0.3881361, 0.158911, -1.266313, 0, 1, 0.003921569, 1, 1,
	    -0.382921, -0.5437154, -3.201255, 0, 1, 0.01176471, 1, 1,
	    -0.3780563, 1.00523, 0.9527998, 0, 1, 0.01568628, 1, 1,
	    -0.3776144, 0.3596236, -0.3224455, 0, 1, 0.02352941, 1, 1,
	    -0.3744657, -0.4089455, -2.730864, 0, 1, 0.02745098, 1, 1,
	    -0.3691164, 0.3924235, -0.04163681, 0, 1, 0.03529412, 1, 1,
	    -0.3681612, 0.8484211, -0.4331209, 0, 1, 0.03921569, 1, 1,
	    -0.3658142, -0.1259927, -2.787268, 0, 1, 0.04705882, 1, 1,
	    -0.3656541, -1.769258, -3.264807, 0, 1, 0.05098039, 1, 1,
	    -0.3621577, 0.5186518, -1.26929, 0, 1, 0.05882353, 1, 1,
	    -0.3594102, 0.5993645, -0.2667509, 0, 1, 0.0627451, 1, 1,
	    -0.3585275, -0.466471, -2.217079, 0, 1, 0.07058824, 1, 1,
	    -0.355275, -0.9844773, -2.703272, 0, 1, 0.07450981, 1, 1,
	    -0.3527319, 1.359403, 0.5999845, 0, 1, 0.08235294, 1, 1,
	    -0.352475, -0.7707894, -2.402272, 0, 1, 0.08627451, 1, 1,
	    -0.3520515, 0.2696897, -0.6723036, 0, 1, 0.09411765, 1, 1,
	    -0.3492198, -0.7094553, -2.803467, 0, 1, 0.1019608, 1, 1,
	    -0.3480962, 1.624813, 0.07259585, 0, 1, 0.1058824, 1, 1,
	    -0.344635, -1.482004, -1.800469, 0, 1, 0.1137255, 1, 1,
	    -0.3442965, -0.3376086, -2.692225, 0, 1, 0.1176471, 1, 1,
	    -0.3441124, 0.8602437, 0.6817973, 0, 1, 0.1254902, 1, 1,
	    -0.3380788, -0.4874431, -4.421466, 0, 1, 0.1294118, 1, 1,
	    -0.3368179, 2.410093, -0.4199505, 0, 1, 0.1372549, 1, 1,
	    -0.3365316, 0.6248595, -2.435249, 0, 1, 0.1411765, 1, 1,
	    -0.3338947, -0.5421219, -2.431083, 0, 1, 0.1490196, 1, 1,
	    -0.333557, -0.3628028, -1.072562, 0, 1, 0.1529412, 1, 1,
	    -0.3317678, 0.9199321, -0.6055669, 0, 1, 0.1607843, 1, 1,
	    -0.330737, -1.978217, -2.582861, 0, 1, 0.1647059, 1, 1,
	    -0.3260545, 0.06898483, -0.333717, 0, 1, 0.172549, 1, 1,
	    -0.3215501, 1.083413, -0.171606, 0, 1, 0.1764706, 1, 1,
	    -0.313439, 0.8701847, -1.105385, 0, 1, 0.1843137, 1, 1,
	    -0.3124214, -0.04303386, -1.402502, 0, 1, 0.1882353, 1, 1,
	    -0.3110935, 1.142621, -1.690594, 0, 1, 0.1960784, 1, 1,
	    -0.3094802, -0.5113324, -2.595321, 0, 1, 0.2039216, 1, 1,
	    -0.3094503, 0.01566579, -2.37246, 0, 1, 0.2078431, 1, 1,
	    -0.3081426, 0.534472, 0.5742407, 0, 1, 0.2156863, 1, 1,
	    -0.3036126, -0.1781094, -1.348739, 0, 1, 0.2196078, 1, 1,
	    -0.3032993, -1.335325, -3.395204, 0, 1, 0.227451, 1, 1,
	    -0.3026674, 0.4504538, 0.2771848, 0, 1, 0.2313726, 1, 1,
	    -0.3020836, 0.3269546, -0.7411179, 0, 1, 0.2392157, 1, 1,
	    -0.3019416, 0.3453073, -1.854304, 0, 1, 0.2431373, 1, 1,
	    -0.2998228, -0.1004444, -2.320544, 0, 1, 0.2509804, 1, 1,
	    -0.2951051, -0.7609642, -2.653528, 0, 1, 0.254902, 1, 1,
	    -0.2829821, -1.527421, -3.078332, 0, 1, 0.2627451, 1, 1,
	    -0.2826391, -1.579932, -2.567279, 0, 1, 0.2666667, 1, 1,
	    -0.2782823, -1.49829, -3.481922, 0, 1, 0.2745098, 1, 1,
	    -0.2739094, -0.02716695, -1.061899, 0, 1, 0.2784314, 1, 1,
	    -0.273807, 1.293368, 0.6527152, 0, 1, 0.2862745, 1, 1,
	    -0.2701552, 1.12544, -0.3593934, 0, 1, 0.2901961, 1, 1,
	    -0.2697906, -0.4814015, -1.602767, 0, 1, 0.2980392, 1, 1,
	    -0.2687963, 0.3146024, -0.02789904, 0, 1, 0.3058824, 1, 1,
	    -0.2669718, -0.04393019, -0.305895, 0, 1, 0.3098039, 1, 1,
	    -0.2646875, 2.250575, 0.4976667, 0, 1, 0.3176471, 1, 1,
	    -0.2628971, -1.139807, -2.771086, 0, 1, 0.3215686, 1, 1,
	    -0.2616044, 0.8398768, -0.9705845, 0, 1, 0.3294118, 1, 1,
	    -0.2613579, -0.662352, -3.023235, 0, 1, 0.3333333, 1, 1,
	    -0.2589692, 1.269843, 1.784347, 0, 1, 0.3411765, 1, 1,
	    -0.2559773, -0.03987281, -1.531622, 0, 1, 0.345098, 1, 1,
	    -0.2540849, 1.077409, 0.7009481, 0, 1, 0.3529412, 1, 1,
	    -0.2519991, 0.5422587, -1.459898, 0, 1, 0.3568628, 1, 1,
	    -0.2518965, -1.451766, -1.316867, 0, 1, 0.3647059, 1, 1,
	    -0.2497863, -1.709049, -4.173556, 0, 1, 0.3686275, 1, 1,
	    -0.2494824, -0.01369181, -2.982078, 0, 1, 0.3764706, 1, 1,
	    -0.2489398, 1.074033, -0.1772438, 0, 1, 0.3803922, 1, 1,
	    -0.2464253, -0.4828018, -3.049135, 0, 1, 0.3882353, 1, 1,
	    -0.2449035, -0.4857075, -1.202632, 0, 1, 0.3921569, 1, 1,
	    -0.241074, -0.1957724, -1.091178, 0, 1, 0.4, 1, 1,
	    -0.2408574, 1.36362, 0.4192437, 0, 1, 0.4078431, 1, 1,
	    -0.2389979, 1.342056, -0.7444946, 0, 1, 0.4117647, 1, 1,
	    -0.2379653, -0.6410658, -3.232724, 0, 1, 0.4196078, 1, 1,
	    -0.2357378, 0.3535997, -2.397672, 0, 1, 0.4235294, 1, 1,
	    -0.2295292, -2.288062, -3.258923, 0, 1, 0.4313726, 1, 1,
	    -0.2275949, -1.644812, -3.401342, 0, 1, 0.4352941, 1, 1,
	    -0.2258574, 0.5265185, -2.456925, 0, 1, 0.4431373, 1, 1,
	    -0.21882, -0.1689301, -2.553904, 0, 1, 0.4470588, 1, 1,
	    -0.2181713, -1.539013, -2.828825, 0, 1, 0.454902, 1, 1,
	    -0.2173591, 0.7394462, 0.03918895, 0, 1, 0.4588235, 1, 1,
	    -0.2072974, -2.060975, -3.772219, 0, 1, 0.4666667, 1, 1,
	    -0.203924, 0.2766502, -0.2344728, 0, 1, 0.4705882, 1, 1,
	    -0.2013895, 0.8521972, -1.752884, 0, 1, 0.4784314, 1, 1,
	    -0.2011171, -0.7694003, -3.334274, 0, 1, 0.4823529, 1, 1,
	    -0.1997897, -0.1248894, -2.778023, 0, 1, 0.4901961, 1, 1,
	    -0.1967926, 1.772658, 1.957504, 0, 1, 0.4941176, 1, 1,
	    -0.1958932, 1.060793, 1.085092, 0, 1, 0.5019608, 1, 1,
	    -0.1946303, -0.9888282, -1.947513, 0, 1, 0.509804, 1, 1,
	    -0.1917287, 0.7360084, 0.1712901, 0, 1, 0.5137255, 1, 1,
	    -0.1911082, 0.7397816, -1.04648, 0, 1, 0.5215687, 1, 1,
	    -0.1874687, -0.2764769, -2.262976, 0, 1, 0.5254902, 1, 1,
	    -0.1873757, -1.039375, -2.843038, 0, 1, 0.5333334, 1, 1,
	    -0.1851625, -0.9291976, -2.030553, 0, 1, 0.5372549, 1, 1,
	    -0.1851138, 1.575213, 1.535333, 0, 1, 0.5450981, 1, 1,
	    -0.1821494, -1.692657, -2.737273, 0, 1, 0.5490196, 1, 1,
	    -0.1752969, 0.2940099, -2.626934, 0, 1, 0.5568628, 1, 1,
	    -0.1659382, -2.441261, -2.809585, 0, 1, 0.5607843, 1, 1,
	    -0.163654, -0.4527542, -1.356123, 0, 1, 0.5686275, 1, 1,
	    -0.1606634, 2.991073, 0.4782645, 0, 1, 0.572549, 1, 1,
	    -0.1576124, 0.3569745, 0.6303179, 0, 1, 0.5803922, 1, 1,
	    -0.1534395, -0.954977, -2.653033, 0, 1, 0.5843138, 1, 1,
	    -0.1522292, 0.7653247, 0.6416019, 0, 1, 0.5921569, 1, 1,
	    -0.1509453, -0.2816854, -4.479161, 0, 1, 0.5960785, 1, 1,
	    -0.1500672, -0.4382569, -3.302971, 0, 1, 0.6039216, 1, 1,
	    -0.1473517, -1.503978, -4.498125, 0, 1, 0.6117647, 1, 1,
	    -0.1461316, -0.1017964, -0.8142517, 0, 1, 0.6156863, 1, 1,
	    -0.1423407, -0.2740314, -3.848071, 0, 1, 0.6235294, 1, 1,
	    -0.1383621, 0.8806437, -0.4872388, 0, 1, 0.627451, 1, 1,
	    -0.1373772, 0.5814228, 0.7706033, 0, 1, 0.6352941, 1, 1,
	    -0.1325886, -1.971623, -4.304446, 0, 1, 0.6392157, 1, 1,
	    -0.1284147, -0.1718713, -2.090194, 0, 1, 0.6470588, 1, 1,
	    -0.1265674, -0.766098, -1.939488, 0, 1, 0.6509804, 1, 1,
	    -0.123748, -1.918078, -3.924432, 0, 1, 0.6588235, 1, 1,
	    -0.1233463, 0.1728626, -1.949802, 0, 1, 0.6627451, 1, 1,
	    -0.1209411, -2.005036, -2.855737, 0, 1, 0.6705883, 1, 1,
	    -0.1112446, -0.7321181, -1.39885, 0, 1, 0.6745098, 1, 1,
	    -0.1104278, 1.746379, -1.114783, 0, 1, 0.682353, 1, 1,
	    -0.1086822, 0.9327964, 0.5422625, 0, 1, 0.6862745, 1, 1,
	    -0.1030602, 0.4069289, 0.3550104, 0, 1, 0.6941177, 1, 1,
	    -0.1012124, 0.05825811, -1.153062, 0, 1, 0.7019608, 1, 1,
	    -0.1005178, 0.8863389, -1.146608, 0, 1, 0.7058824, 1, 1,
	    -0.09724838, -1.9825, -3.346423, 0, 1, 0.7137255, 1, 1,
	    -0.08620283, 0.01753785, -1.443287, 0, 1, 0.7176471, 1, 1,
	    -0.08267802, 1.633479, 0.5640126, 0, 1, 0.7254902, 1, 1,
	    -0.07644721, 0.1216177, -0.1611494, 0, 1, 0.7294118, 1, 1,
	    -0.07584929, -1.70791, -2.284637, 0, 1, 0.7372549, 1, 1,
	    -0.07544135, -0.549445, -4.993936, 0, 1, 0.7411765, 1, 1,
	    -0.07298101, 0.07622332, 0.2014921, 0, 1, 0.7490196, 1, 1,
	    -0.07160003, 1.466032, 1.216336, 0, 1, 0.7529412, 1, 1,
	    -0.06777745, 1.258644, -0.03803592, 0, 1, 0.7607843, 1, 1,
	    -0.06746908, 0.5495446, 0.4309206, 0, 1, 0.7647059, 1, 1,
	    -0.06438684, 0.3707801, -0.8757008, 0, 1, 0.772549, 1, 1,
	    -0.06041819, 0.2087022, 0.0986514, 0, 1, 0.7764706, 1, 1,
	    -0.05612661, -0.873939, -3.476143, 0, 1, 0.7843137, 1, 1,
	    -0.05105953, -0.187751, -2.939152, 0, 1, 0.7882353, 1, 1,
	    -0.05035799, 0.5416489, 1.336646, 0, 1, 0.7960784, 1, 1,
	    -0.04806987, -0.3484504, -3.66882, 0, 1, 0.8039216, 1, 1,
	    -0.04769731, 0.8468616, 1.061986, 0, 1, 0.8078431, 1, 1,
	    -0.03893302, 0.1241221, -1.220656, 0, 1, 0.8156863, 1, 1,
	    -0.03122259, 2.067839, -1.952612, 0, 1, 0.8196079, 1, 1,
	    -0.02643794, -0.07515208, -3.652461, 0, 1, 0.827451, 1, 1,
	    -0.02190245, -0.831677, -2.523222, 0, 1, 0.8313726, 1, 1,
	    -0.01904898, 1.002635, -0.06830373, 0, 1, 0.8392157, 1, 1,
	    -0.01882363, -0.1555776, -1.42546, 0, 1, 0.8431373, 1, 1,
	    -0.006162655, 0.1417896, 0.2246207, 0, 1, 0.8509804, 1, 1,
	    -0.001978099, -2.557477, -3.984644, 0, 1, 0.854902, 1, 1,
	    -0.0006411519, 0.2711741, 0.7407174, 0, 1, 0.8627451, 1, 1,
	    0.002684396, 0.1370125, -1.127363, 0, 1, 0.8666667, 1, 1,
	    0.00935031, -0.5888843, 2.357699, 0, 1, 0.8745098, 1, 1,
	    0.009396544, -0.7890562, 2.516465, 0, 1, 0.8784314, 1, 1,
	    0.01474558, 2.896137, -0.7479557, 0, 1, 0.8862745, 1, 1,
	    0.01885581, 0.6713749, -0.5047849, 0, 1, 0.8901961, 1, 1,
	    0.01977203, 1.377004, 1.196761, 0, 1, 0.8980392, 1, 1,
	    0.02135491, -0.7866012, 3.176321, 0, 1, 0.9058824, 1, 1,
	    0.0214231, -0.6427302, 2.64819, 0, 1, 0.9098039, 1, 1,
	    0.02344659, -0.2242682, 1.096097, 0, 1, 0.9176471, 1, 1,
	    0.02346797, 0.32885, -0.8329481, 0, 1, 0.9215686, 1, 1,
	    0.02433512, 1.59945, -0.3973347, 0, 1, 0.9294118, 1, 1,
	    0.02707356, 0.6718062, -0.575007, 0, 1, 0.9333333, 1, 1,
	    0.03152223, -0.3218891, 4.662323, 0, 1, 0.9411765, 1, 1,
	    0.03337971, 0.9726634, -1.983114, 0, 1, 0.945098, 1, 1,
	    0.03914932, -0.6249298, 3.6008, 0, 1, 0.9529412, 1, 1,
	    0.04798634, 0.5140319, -0.9879534, 0, 1, 0.9568627, 1, 1,
	    0.05140029, -0.9275215, 1.390923, 0, 1, 0.9647059, 1, 1,
	    0.05256736, 0.5828131, -0.404224, 0, 1, 0.9686275, 1, 1,
	    0.05495751, 0.5072066, -0.01825715, 0, 1, 0.9764706, 1, 1,
	    0.05665368, -0.6852865, 3.482718, 0, 1, 0.9803922, 1, 1,
	    0.05886716, -0.8506333, 3.191681, 0, 1, 0.9882353, 1, 1,
	    0.06048632, 0.6184825, -1.52217, 0, 1, 0.9921569, 1, 1,
	    0.06222105, -0.0799164, 3.586871, 0, 1, 1, 1, 1,
	    0.0634957, -0.5704287, 2.86347, 0, 0.9921569, 1, 1, 1,
	    0.06349958, 0.2222668, 0.193728, 0, 0.9882353, 1, 1, 1,
	    0.06402669, 0.4744164, -0.4145285, 0, 0.9803922, 1, 1, 1,
	    0.06409505, 1.274642, -0.3393115, 0, 0.9764706, 1, 1, 1,
	    0.06591512, 0.4189887, -0.02887672, 0, 0.9686275, 1, 1, 1,
	    0.0685517, 0.6649463, 0.3695101, 0, 0.9647059, 1, 1, 1,
	    0.07128706, 0.1070163, 1.734852, 0, 0.9568627, 1, 1, 1,
	    0.07447653, 1.856964, 0.09473345, 0, 0.9529412, 1, 1, 1,
	    0.08023864, 0.6392882, -0.3772219, 0, 0.945098, 1, 1, 1,
	    0.08412867, 0.4452681, -1.085224, 0, 0.9411765, 1, 1, 1,
	    0.08694188, 0.5101318, -0.7955398, 0, 0.9333333, 1, 1, 1,
	    0.09074077, -1.27671, 3.628413, 0, 0.9294118, 1, 1, 1,
	    0.09245414, -0.6900249, 2.948334, 0, 0.9215686, 1, 1, 1,
	    0.09577824, 1.073976, 0.5109665, 0, 0.9176471, 1, 1, 1,
	    0.09730859, 0.3109652, -0.7046658, 0, 0.9098039, 1, 1, 1,
	    0.0982546, 0.1197035, -0.3541018, 0, 0.9058824, 1, 1, 1,
	    0.0993626, -0.9081126, 1.06977, 0, 0.8980392, 1, 1, 1,
	    0.1005036, 0.5353631, 0.1420999, 0, 0.8901961, 1, 1, 1,
	    0.1012065, 1.47328, -0.4447297, 0, 0.8862745, 1, 1, 1,
	    0.1032722, 1.004504, 1.504925, 0, 0.8784314, 1, 1, 1,
	    0.1034893, 1.498178, 0.7697437, 0, 0.8745098, 1, 1, 1,
	    0.1044357, -0.2784082, 3.103603, 0, 0.8666667, 1, 1, 1,
	    0.105415, 0.7108139, 0.2170161, 0, 0.8627451, 1, 1, 1,
	    0.107469, -0.5850576, 3.659567, 0, 0.854902, 1, 1, 1,
	    0.1116026, 1.282963, 1.808349, 0, 0.8509804, 1, 1, 1,
	    0.1125453, 0.3673598, -0.9544663, 0, 0.8431373, 1, 1, 1,
	    0.1133731, -1.094368, 3.151435, 0, 0.8392157, 1, 1, 1,
	    0.1148459, 1.141966, 0.2851668, 0, 0.8313726, 1, 1, 1,
	    0.1176106, -0.5946906, 2.500228, 0, 0.827451, 1, 1, 1,
	    0.118661, 1.451137, -2.322983, 0, 0.8196079, 1, 1, 1,
	    0.1187194, 0.07597494, 1.549424, 0, 0.8156863, 1, 1, 1,
	    0.1225646, 1.531009, 0.7805818, 0, 0.8078431, 1, 1, 1,
	    0.1243377, -1.369806, 2.910433, 0, 0.8039216, 1, 1, 1,
	    0.125139, 0.8553287, -0.3385821, 0, 0.7960784, 1, 1, 1,
	    0.1254386, -0.6305328, 1.625099, 0, 0.7882353, 1, 1, 1,
	    0.1256115, -1.009791, 2.371844, 0, 0.7843137, 1, 1, 1,
	    0.1258418, 0.9434718, -0.385615, 0, 0.7764706, 1, 1, 1,
	    0.125853, -1.167187, 3.932257, 0, 0.772549, 1, 1, 1,
	    0.1264993, -0.293355, 3.010561, 0, 0.7647059, 1, 1, 1,
	    0.1293208, -0.5124702, 2.4108, 0, 0.7607843, 1, 1, 1,
	    0.1313214, -0.6908646, 2.52695, 0, 0.7529412, 1, 1, 1,
	    0.1354275, -2.7516, 1.693548, 0, 0.7490196, 1, 1, 1,
	    0.1355987, 0.3206594, -0.5697745, 0, 0.7411765, 1, 1, 1,
	    0.1380239, 1.754038, 0.4384715, 0, 0.7372549, 1, 1, 1,
	    0.1395342, 0.5835829, 0.2471558, 0, 0.7294118, 1, 1, 1,
	    0.1399661, 0.4019357, 0.8019391, 0, 0.7254902, 1, 1, 1,
	    0.1407616, 0.9559378, -0.2629389, 0, 0.7176471, 1, 1, 1,
	    0.1439307, -0.2662892, 3.144247, 0, 0.7137255, 1, 1, 1,
	    0.146526, -2.537008, 2.503724, 0, 0.7058824, 1, 1, 1,
	    0.1469316, 0.9570519, -0.2963376, 0, 0.6980392, 1, 1, 1,
	    0.1473735, -0.9420941, 4.09257, 0, 0.6941177, 1, 1, 1,
	    0.1481417, 0.2935501, -0.1525341, 0, 0.6862745, 1, 1, 1,
	    0.1486187, 0.3841851, 1.014743, 0, 0.682353, 1, 1, 1,
	    0.1536954, -1.290505, 2.820574, 0, 0.6745098, 1, 1, 1,
	    0.1555094, -0.7562548, 3.898089, 0, 0.6705883, 1, 1, 1,
	    0.16009, -2.708222, 1.647093, 0, 0.6627451, 1, 1, 1,
	    0.1606313, -0.7100607, 2.052514, 0, 0.6588235, 1, 1, 1,
	    0.1666282, 0.3647953, 0.3666989, 0, 0.6509804, 1, 1, 1,
	    0.166877, 0.2573224, -0.4591549, 0, 0.6470588, 1, 1, 1,
	    0.167406, 1.373063, -1.216478, 0, 0.6392157, 1, 1, 1,
	    0.1702802, 1.371428, -0.3858452, 0, 0.6352941, 1, 1, 1,
	    0.1707474, -1.017647, 5.718602, 0, 0.627451, 1, 1, 1,
	    0.1725616, -0.001920941, 0.9047709, 0, 0.6235294, 1, 1, 1,
	    0.1753329, -1.53859, 2.901831, 0, 0.6156863, 1, 1, 1,
	    0.1772309, 0.818899, 1.414529, 0, 0.6117647, 1, 1, 1,
	    0.1786804, -0.3169611, 2.822109, 0, 0.6039216, 1, 1, 1,
	    0.1794468, -0.3928617, 3.187996, 0, 0.5960785, 1, 1, 1,
	    0.1806585, -1.129774, 2.487241, 0, 0.5921569, 1, 1, 1,
	    0.1808756, -1.255633, 2.522364, 0, 0.5843138, 1, 1, 1,
	    0.1838257, -0.3787614, 3.417221, 0, 0.5803922, 1, 1, 1,
	    0.1897637, 0.200388, -0.5155947, 0, 0.572549, 1, 1, 1,
	    0.1915605, 0.3316032, 0.4352494, 0, 0.5686275, 1, 1, 1,
	    0.1964126, 0.566957, 1.115001, 0, 0.5607843, 1, 1, 1,
	    0.1978389, -0.3241129, 3.74856, 0, 0.5568628, 1, 1, 1,
	    0.2038694, -0.7294331, 4.209773, 0, 0.5490196, 1, 1, 1,
	    0.2053389, 0.03464797, 1.968973, 0, 0.5450981, 1, 1, 1,
	    0.2087746, 0.2992425, -0.6335405, 0, 0.5372549, 1, 1, 1,
	    0.21006, 1.056659, 1.625406, 0, 0.5333334, 1, 1, 1,
	    0.2152234, -0.1068738, 1.512295, 0, 0.5254902, 1, 1, 1,
	    0.2206562, 0.2900375, 2.667315, 0, 0.5215687, 1, 1, 1,
	    0.222873, 0.2832681, 2.580414, 0, 0.5137255, 1, 1, 1,
	    0.2241171, 0.6728143, 1.152559, 0, 0.509804, 1, 1, 1,
	    0.2337841, -0.6258735, 1.944358, 0, 0.5019608, 1, 1, 1,
	    0.2350513, -0.2238835, 1.462101, 0, 0.4941176, 1, 1, 1,
	    0.2353569, -0.7212906, 3.638924, 0, 0.4901961, 1, 1, 1,
	    0.2362264, 0.4493604, -0.7887953, 0, 0.4823529, 1, 1, 1,
	    0.2400368, -0.5366085, 1.630091, 0, 0.4784314, 1, 1, 1,
	    0.2415229, -0.6661571, 3.207326, 0, 0.4705882, 1, 1, 1,
	    0.2470043, 0.6204684, 0.8344347, 0, 0.4666667, 1, 1, 1,
	    0.2502289, 0.03066066, 1.106964, 0, 0.4588235, 1, 1, 1,
	    0.2503278, -0.5963367, 4.730369, 0, 0.454902, 1, 1, 1,
	    0.2529045, 0.3236012, 0.8712507, 0, 0.4470588, 1, 1, 1,
	    0.2673806, -0.641915, 3.408188, 0, 0.4431373, 1, 1, 1,
	    0.2680331, -0.6969092, 1.481344, 0, 0.4352941, 1, 1, 1,
	    0.2733271, 0.1415346, 1.534087, 0, 0.4313726, 1, 1, 1,
	    0.2742741, 0.5975989, 0.1822245, 0, 0.4235294, 1, 1, 1,
	    0.2745458, 0.2266603, 2.766766, 0, 0.4196078, 1, 1, 1,
	    0.2763074, -0.09337679, 3.451499, 0, 0.4117647, 1, 1, 1,
	    0.2776593, 0.07490617, 1.550838, 0, 0.4078431, 1, 1, 1,
	    0.2788401, -0.647515, 1.644519, 0, 0.4, 1, 1, 1,
	    0.2826343, 0.4544829, -0.1152595, 0, 0.3921569, 1, 1, 1,
	    0.2863498, 1.123861, 0.98369, 0, 0.3882353, 1, 1, 1,
	    0.2868577, -0.1546116, 1.968632, 0, 0.3803922, 1, 1, 1,
	    0.287193, 0.2008495, -0.9137121, 0, 0.3764706, 1, 1, 1,
	    0.2878579, -0.5630318, 2.776659, 0, 0.3686275, 1, 1, 1,
	    0.2885242, 0.6333605, 1.018503, 0, 0.3647059, 1, 1, 1,
	    0.2893872, -0.2502802, 2.886539, 0, 0.3568628, 1, 1, 1,
	    0.2921582, -0.6572485, 3.066561, 0, 0.3529412, 1, 1, 1,
	    0.2952619, -0.7912555, 1.342153, 0, 0.345098, 1, 1, 1,
	    0.2964316, 0.7277011, 0.2915743, 0, 0.3411765, 1, 1, 1,
	    0.2996753, 0.329513, 0.3086734, 0, 0.3333333, 1, 1, 1,
	    0.2999119, -0.9614558, 2.864053, 0, 0.3294118, 1, 1, 1,
	    0.3058871, -0.6120535, 1.885973, 0, 0.3215686, 1, 1, 1,
	    0.3064969, 0.2713085, 1.55763, 0, 0.3176471, 1, 1, 1,
	    0.3095053, -1.149585, 2.258307, 0, 0.3098039, 1, 1, 1,
	    0.3103172, -1.504749, 3.158721, 0, 0.3058824, 1, 1, 1,
	    0.310455, 0.1565094, 3.633473, 0, 0.2980392, 1, 1, 1,
	    0.3113659, 0.07286981, 0.7706331, 0, 0.2901961, 1, 1, 1,
	    0.3127033, -0.4787644, 3.014737, 0, 0.2862745, 1, 1, 1,
	    0.3127133, -1.719565, 2.770733, 0, 0.2784314, 1, 1, 1,
	    0.3127345, 0.6350339, -0.345854, 0, 0.2745098, 1, 1, 1,
	    0.3129807, -1.088139, 1.926424, 0, 0.2666667, 1, 1, 1,
	    0.3152396, 0.2383602, 0.6925154, 0, 0.2627451, 1, 1, 1,
	    0.3158601, -1.250354, 3.198709, 0, 0.254902, 1, 1, 1,
	    0.3164833, -0.4806198, 3.040296, 0, 0.2509804, 1, 1, 1,
	    0.3166527, 0.4771256, -0.1935689, 0, 0.2431373, 1, 1, 1,
	    0.3179831, -0.8430509, 3.588178, 0, 0.2392157, 1, 1, 1,
	    0.3184476, -0.2047973, 2.406387, 0, 0.2313726, 1, 1, 1,
	    0.3192748, 1.288043, 1.656519, 0, 0.227451, 1, 1, 1,
	    0.3256402, 0.9503942, 1.366579, 0, 0.2196078, 1, 1, 1,
	    0.3282624, 1.160226, -0.164822, 0, 0.2156863, 1, 1, 1,
	    0.3295287, -0.01250615, 1.192147, 0, 0.2078431, 1, 1, 1,
	    0.3339483, 0.5935233, -0.01067705, 0, 0.2039216, 1, 1, 1,
	    0.3353907, 0.4329312, 1.303046, 0, 0.1960784, 1, 1, 1,
	    0.3384637, 0.5633002, 0.9922484, 0, 0.1882353, 1, 1, 1,
	    0.3504854, -0.7400095, 2.459779, 0, 0.1843137, 1, 1, 1,
	    0.3600509, -0.5285054, 4.044986, 0, 0.1764706, 1, 1, 1,
	    0.360457, 0.5171832, -0.5819032, 0, 0.172549, 1, 1, 1,
	    0.3709561, 0.3568837, 1.018982, 0, 0.1647059, 1, 1, 1,
	    0.3718033, 0.3394521, 1.776997, 0, 0.1607843, 1, 1, 1,
	    0.3737286, 0.6014382, -0.2051698, 0, 0.1529412, 1, 1, 1,
	    0.3749932, -1.013703, 1.718812, 0, 0.1490196, 1, 1, 1,
	    0.3767531, -1.309373, 1.826223, 0, 0.1411765, 1, 1, 1,
	    0.377688, -0.01668403, 1.331275, 0, 0.1372549, 1, 1, 1,
	    0.3779905, 2.550335, -2.370061, 0, 0.1294118, 1, 1, 1,
	    0.3784848, -0.59738, 0.05074979, 0, 0.1254902, 1, 1, 1,
	    0.3786251, 0.3468566, -0.2157864, 0, 0.1176471, 1, 1, 1,
	    0.3790829, -0.4314109, 1.942715, 0, 0.1137255, 1, 1, 1,
	    0.3853398, -0.8672554, 1.754472, 0, 0.1058824, 1, 1, 1,
	    0.3885857, 0.7235286, 0.09149545, 0, 0.09803922, 1, 1, 1,
	    0.3889861, 0.8168375, 1.811493, 0, 0.09411765, 1, 1, 1,
	    0.3917461, -0.3357968, 3.677267, 0, 0.08627451, 1, 1, 1,
	    0.3959354, 0.3375202, 0.716698, 0, 0.08235294, 1, 1, 1,
	    0.3961742, 1.124228, -0.6594911, 0, 0.07450981, 1, 1, 1,
	    0.4051493, 1.357452, -1.070944, 0, 0.07058824, 1, 1, 1,
	    0.4052444, 1.308945, -0.5024581, 0, 0.0627451, 1, 1, 1,
	    0.4073742, 0.5133456, 0.3368632, 0, 0.05882353, 1, 1, 1,
	    0.4111703, 0.2843893, 0.6177497, 0, 0.05098039, 1, 1, 1,
	    0.4122218, 0.8189287, 1.182502, 0, 0.04705882, 1, 1, 1,
	    0.4178078, 2.344186, -1.44777, 0, 0.03921569, 1, 1, 1,
	    0.4189467, 1.937613, 1.87601, 0, 0.03529412, 1, 1, 1,
	    0.4231388, 0.8195015, 2.094129, 0, 0.02745098, 1, 1, 1,
	    0.424119, -0.2472915, 3.406912, 0, 0.02352941, 1, 1, 1,
	    0.424559, -0.01286793, 1.270934, 0, 0.01568628, 1, 1, 1,
	    0.4297599, -0.1773188, 2.052016, 0, 0.01176471, 1, 1, 1,
	    0.4355095, -0.3620487, 3.598024, 0, 0.003921569, 1, 1, 1,
	    0.4362352, -0.3402111, 3.896871, 0.003921569, 0, 1, 1, 1,
	    0.4370445, -1.411741, 3.143247, 0.007843138, 0, 1, 1, 1,
	    0.4385339, 0.5355537, 0.1318852, 0.01568628, 0, 1, 1, 1,
	    0.4441085, 0.1519492, 0.9680952, 0.01960784, 0, 1, 1, 1,
	    0.4465165, -0.2041376, 1.542393, 0.02745098, 0, 1, 1, 1,
	    0.4506291, -0.3376233, 2.113893, 0.03137255, 0, 1, 1, 1,
	    0.4577557, -0.654692, 2.833218, 0.03921569, 0, 1, 1, 1,
	    0.4630362, 0.4783258, -0.3530323, 0.04313726, 0, 1, 1, 1,
	    0.4648041, 1.301685, -0.4534476, 0.05098039, 0, 1, 1, 1,
	    0.4648103, -0.3191301, 2.690529, 0.05490196, 0, 1, 1, 1,
	    0.4680496, 0.5784166, 0.4704468, 0.0627451, 0, 1, 1, 1,
	    0.4681277, 1.645844, -2.054503, 0.06666667, 0, 1, 1, 1,
	    0.4690839, -0.8468521, 1.890677, 0.07450981, 0, 1, 1, 1,
	    0.4692178, -1.46034, 3.7861, 0.07843138, 0, 1, 1, 1,
	    0.4692325, 0.8287479, -0.8283293, 0.08627451, 0, 1, 1, 1,
	    0.47423, -1.595465, 5.066729, 0.09019608, 0, 1, 1, 1,
	    0.4772587, 0.5986832, 1.042695, 0.09803922, 0, 1, 1, 1,
	    0.4775211, 0.3226559, 1.203215, 0.1058824, 0, 1, 1, 1,
	    0.4790347, 0.2628274, 0.9842513, 0.1098039, 0, 1, 1, 1,
	    0.4840285, -0.1509168, 0.2731763, 0.1176471, 0, 1, 1, 1,
	    0.4930865, -0.4009362, 3.3385, 0.1215686, 0, 1, 1, 1,
	    0.4944445, 0.009459609, 0.2673546, 0.1294118, 0, 1, 1, 1,
	    0.4946137, -1.982834, 3.829047, 0.1333333, 0, 1, 1, 1,
	    0.4955674, -0.6076651, 1.763301, 0.1411765, 0, 1, 1, 1,
	    0.5015975, 1.844471, -0.1648325, 0.145098, 0, 1, 1, 1,
	    0.5019742, 0.1729139, 0.7634119, 0.1529412, 0, 1, 1, 1,
	    0.5051354, -0.8912881, 3.734654, 0.1568628, 0, 1, 1, 1,
	    0.5059608, -1.483151, 3.79015, 0.1647059, 0, 1, 1, 1,
	    0.5075394, 1.403084, 0.7990239, 0.1686275, 0, 1, 1, 1,
	    0.5078124, 0.4391624, 0.4277813, 0.1764706, 0, 1, 1, 1,
	    0.5078365, 1.169796, 1.365504, 0.1803922, 0, 1, 1, 1,
	    0.5080156, 2.365582, -1.017207, 0.1882353, 0, 1, 1, 1,
	    0.508217, 0.5804699, -0.4207647, 0.1921569, 0, 1, 1, 1,
	    0.5092373, -0.07793348, 2.067893, 0.2, 0, 1, 1, 1,
	    0.5133563, 1.3546, 0.4864367, 0.2078431, 0, 1, 1, 1,
	    0.5164346, -0.5344878, 2.094717, 0.2117647, 0, 1, 1, 1,
	    0.5168071, 1.851359, -0.6211376, 0.2196078, 0, 1, 1, 1,
	    0.5185365, 0.9798785, 1.284529, 0.2235294, 0, 1, 1, 1,
	    0.5263866, -0.1607367, 3.192534, 0.2313726, 0, 1, 1, 1,
	    0.5285566, -0.9426065, 2.132537, 0.2352941, 0, 1, 1, 1,
	    0.5301027, -0.6175036, 2.467767, 0.2431373, 0, 1, 1, 1,
	    0.5316739, 0.53807, 0.6514472, 0.2470588, 0, 1, 1, 1,
	    0.5403644, -1.372862, 2.108675, 0.254902, 0, 1, 1, 1,
	    0.5435418, -0.1697531, 3.91099, 0.2588235, 0, 1, 1, 1,
	    0.5439378, -0.2674078, 2.930976, 0.2666667, 0, 1, 1, 1,
	    0.5455008, -0.1041558, 2.191085, 0.2705882, 0, 1, 1, 1,
	    0.5455562, 0.3414442, 0.401659, 0.2784314, 0, 1, 1, 1,
	    0.5521696, 0.01178346, 0.1282329, 0.282353, 0, 1, 1, 1,
	    0.5530366, 1.175297, -0.2270663, 0.2901961, 0, 1, 1, 1,
	    0.5546782, -2.00732, 2.594937, 0.2941177, 0, 1, 1, 1,
	    0.5604799, -0.7717065, 1.758717, 0.3019608, 0, 1, 1, 1,
	    0.5755231, -1.162724, 1.973908, 0.3098039, 0, 1, 1, 1,
	    0.5768685, 1.574613, 0.3121182, 0.3137255, 0, 1, 1, 1,
	    0.5822859, 0.166344, 1.110792, 0.3215686, 0, 1, 1, 1,
	    0.5835156, -0.06148805, 0.8465514, 0.3254902, 0, 1, 1, 1,
	    0.5838928, 0.4525444, 1.160229, 0.3333333, 0, 1, 1, 1,
	    0.5887665, 1.267171, 2.065183, 0.3372549, 0, 1, 1, 1,
	    0.5923067, -1.156116, 2.975227, 0.345098, 0, 1, 1, 1,
	    0.5938713, 2.369488, 0.5750431, 0.3490196, 0, 1, 1, 1,
	    0.5958854, 0.1390521, 1.987572, 0.3568628, 0, 1, 1, 1,
	    0.5979035, 1.114606, -0.4315263, 0.3607843, 0, 1, 1, 1,
	    0.5983557, 0.2855224, 0.5912557, 0.3686275, 0, 1, 1, 1,
	    0.6013268, 0.682777, 1.704886, 0.372549, 0, 1, 1, 1,
	    0.6037338, 1.938635, 1.314758, 0.3803922, 0, 1, 1, 1,
	    0.6039606, 0.2926959, 2.645162, 0.3843137, 0, 1, 1, 1,
	    0.6065504, 0.6940221, 0.2052581, 0.3921569, 0, 1, 1, 1,
	    0.6073797, 0.9195783, 1.186874, 0.3960784, 0, 1, 1, 1,
	    0.6086635, -2.253681, 3.659407, 0.4039216, 0, 1, 1, 1,
	    0.6114404, 0.8994322, 1.801719, 0.4117647, 0, 1, 1, 1,
	    0.6120171, -0.4578825, 1.700825, 0.4156863, 0, 1, 1, 1,
	    0.6122719, -0.2376282, 2.752255, 0.4235294, 0, 1, 1, 1,
	    0.6156099, -0.7070799, 3.056303, 0.427451, 0, 1, 1, 1,
	    0.6204832, -0.3464236, 1.88808, 0.4352941, 0, 1, 1, 1,
	    0.6213993, -0.3168385, 0.7439248, 0.4392157, 0, 1, 1, 1,
	    0.6310688, 0.3974715, 1.057217, 0.4470588, 0, 1, 1, 1,
	    0.6318771, 1.018566, 1.646153, 0.4509804, 0, 1, 1, 1,
	    0.638922, 0.1728967, 2.847359, 0.4588235, 0, 1, 1, 1,
	    0.640323, 2.773763, 0.03879196, 0.4627451, 0, 1, 1, 1,
	    0.6430998, 0.3774596, -0.6272722, 0.4705882, 0, 1, 1, 1,
	    0.6452182, -0.8332902, 2.95344, 0.4745098, 0, 1, 1, 1,
	    0.6456206, 1.298289, 1.311611, 0.4823529, 0, 1, 1, 1,
	    0.6477954, 0.1362213, 1.387507, 0.4862745, 0, 1, 1, 1,
	    0.6478414, 0.5027589, -0.3064246, 0.4941176, 0, 1, 1, 1,
	    0.6479371, -0.004471456, 1.893931, 0.5019608, 0, 1, 1, 1,
	    0.6485153, -0.004714838, 1.556458, 0.5058824, 0, 1, 1, 1,
	    0.6519047, 1.39284, 0.5699655, 0.5137255, 0, 1, 1, 1,
	    0.6520029, 0.04145228, 0.9511154, 0.5176471, 0, 1, 1, 1,
	    0.6534989, 0.3105746, 0.5142825, 0.5254902, 0, 1, 1, 1,
	    0.6610491, 1.784158, -1.168962, 0.5294118, 0, 1, 1, 1,
	    0.6627481, 1.340337, 0.9985649, 0.5372549, 0, 1, 1, 1,
	    0.6676952, 1.448129, 0.824648, 0.5411765, 0, 1, 1, 1,
	    0.6685105, -1.790322, 2.292793, 0.5490196, 0, 1, 1, 1,
	    0.6785948, -0.1113487, 1.916962, 0.5529412, 0, 1, 1, 1,
	    0.6807631, -0.2955543, 2.212612, 0.5607843, 0, 1, 1, 1,
	    0.681661, 0.9562439, 1.947829, 0.5647059, 0, 1, 1, 1,
	    0.6843649, 0.8793927, 0.5710255, 0.572549, 0, 1, 1, 1,
	    0.6902907, 2.5316, -1.539994, 0.5764706, 0, 1, 1, 1,
	    0.6941721, -1.048027, 2.350192, 0.5843138, 0, 1, 1, 1,
	    0.6942482, -0.7264248, 2.49225, 0.5882353, 0, 1, 1, 1,
	    0.694833, -0.06180171, 1.988382, 0.5960785, 0, 1, 1, 1,
	    0.6953302, 0.1295384, 1.50262, 0.6039216, 0, 1, 1, 1,
	    0.7190703, 0.8315722, 1.283214, 0.6078432, 0, 1, 1, 1,
	    0.7217805, 2.622222, 0.7049426, 0.6156863, 0, 1, 1, 1,
	    0.725623, -0.0389486, -0.6787316, 0.6196079, 0, 1, 1, 1,
	    0.7272677, -0.09712353, 0.6823136, 0.627451, 0, 1, 1, 1,
	    0.7274969, -0.312641, 1.612684, 0.6313726, 0, 1, 1, 1,
	    0.73785, -1.009135, 1.716006, 0.6392157, 0, 1, 1, 1,
	    0.7387775, -2.336682, 4.086193, 0.6431373, 0, 1, 1, 1,
	    0.7396144, -0.9859756, 2.101536, 0.6509804, 0, 1, 1, 1,
	    0.7428803, 0.7452335, -0.4439097, 0.654902, 0, 1, 1, 1,
	    0.7433899, -0.7591785, 3.231249, 0.6627451, 0, 1, 1, 1,
	    0.7499155, -1.605444, 2.445455, 0.6666667, 0, 1, 1, 1,
	    0.7501723, 0.3341838, -0.9824942, 0.6745098, 0, 1, 1, 1,
	    0.7601088, 2.143367, 0.2082712, 0.6784314, 0, 1, 1, 1,
	    0.7652365, -1.002614, -0.2779996, 0.6862745, 0, 1, 1, 1,
	    0.7664897, 0.2496175, -0.03956432, 0.6901961, 0, 1, 1, 1,
	    0.7732115, -0.08386909, 0.5430204, 0.6980392, 0, 1, 1, 1,
	    0.7748011, 0.3260491, 1.491047, 0.7058824, 0, 1, 1, 1,
	    0.7769456, -0.4447787, 3.717192, 0.7098039, 0, 1, 1, 1,
	    0.787522, 0.5992452, -1.289758, 0.7176471, 0, 1, 1, 1,
	    0.7889779, 0.4720393, 0.2867572, 0.7215686, 0, 1, 1, 1,
	    0.792628, -0.6905006, 0.8791177, 0.7294118, 0, 1, 1, 1,
	    0.7976006, 0.1075131, 3.449054, 0.7333333, 0, 1, 1, 1,
	    0.8007438, -1.601552, 1.998169, 0.7411765, 0, 1, 1, 1,
	    0.8016021, -0.7931526, 2.21756, 0.7450981, 0, 1, 1, 1,
	    0.8101354, -0.3093846, 1.605937, 0.7529412, 0, 1, 1, 1,
	    0.8125038, 1.072278, 1.517502, 0.7568628, 0, 1, 1, 1,
	    0.826582, 2.209174, -0.259897, 0.7647059, 0, 1, 1, 1,
	    0.8271821, -0.6014103, 2.314642, 0.7686275, 0, 1, 1, 1,
	    0.8353666, -0.06918259, 1.129655, 0.7764706, 0, 1, 1, 1,
	    0.8374588, 0.06811921, 1.147045, 0.7803922, 0, 1, 1, 1,
	    0.8375767, -0.04555457, 1.75113, 0.7882353, 0, 1, 1, 1,
	    0.837849, -0.2221144, 2.633168, 0.7921569, 0, 1, 1, 1,
	    0.8460992, -0.5628378, -0.1360557, 0.8, 0, 1, 1, 1,
	    0.8504699, -1.931817, 1.570592, 0.8078431, 0, 1, 1, 1,
	    0.8623884, 1.140056, -0.4078649, 0.8117647, 0, 1, 1, 1,
	    0.8627581, -0.04085077, 1.579054, 0.8196079, 0, 1, 1, 1,
	    0.8667508, -1.962013, 0.6971025, 0.8235294, 0, 1, 1, 1,
	    0.8687572, -1.277658, 2.81137, 0.8313726, 0, 1, 1, 1,
	    0.8714008, 0.8517668, -0.06373629, 0.8352941, 0, 1, 1, 1,
	    0.8741592, -0.1153671, 1.325661, 0.8431373, 0, 1, 1, 1,
	    0.8756596, 1.284101, 1.957639, 0.8470588, 0, 1, 1, 1,
	    0.8843211, -0.7752438, 2.659948, 0.854902, 0, 1, 1, 1,
	    0.8855385, -1.483864, 2.859005, 0.8588235, 0, 1, 1, 1,
	    0.8867202, -0.4801338, 3.127076, 0.8666667, 0, 1, 1, 1,
	    0.8938996, 0.4740783, 1.14304, 0.8705882, 0, 1, 1, 1,
	    0.8965645, -0.6103691, 1.770161, 0.8784314, 0, 1, 1, 1,
	    0.8968723, 0.6226607, -0.2028, 0.8823529, 0, 1, 1, 1,
	    0.8988951, -0.08538505, 1.713929, 0.8901961, 0, 1, 1, 1,
	    0.9055098, 0.7400884, 2.279521, 0.8941177, 0, 1, 1, 1,
	    0.9060996, 0.2607701, 2.156221, 0.9019608, 0, 1, 1, 1,
	    0.9097569, -0.08277316, -0.1043864, 0.9098039, 0, 1, 1, 1,
	    0.9160265, -0.8365319, 2.728422, 0.9137255, 0, 1, 1, 1,
	    0.9251277, 0.7882298, 1.303153, 0.9215686, 0, 1, 1, 1,
	    0.9280995, -0.09468097, 2.154608, 0.9254902, 0, 1, 1, 1,
	    0.9310142, 0.2395939, 0.9817521, 0.9333333, 0, 1, 1, 1,
	    0.9356867, -0.1357828, 1.734215, 0.9372549, 0, 1, 1, 1,
	    0.9365985, -0.5257858, 1.517778, 0.945098, 0, 1, 1, 1,
	    0.9493333, -1.561121, 1.810254, 0.9490196, 0, 1, 1, 1,
	    0.9517287, -0.6542698, 1.093119, 0.9568627, 0, 1, 1, 1,
	    0.9572201, 1.366893, -0.7396281, 0.9607843, 0, 1, 1, 1,
	    0.9638126, 0.9320511, 0.5294102, 0.9686275, 0, 1, 1, 1,
	    0.9725414, -0.9015846, 1.956841, 0.972549, 0, 1, 1, 1,
	    0.9821439, 0.09662455, 2.804223, 0.9803922, 0, 1, 1, 1,
	    0.9862073, 0.7613046, 2.347761, 0.9843137, 0, 1, 1, 1,
	    0.9867401, -1.148309, 2.288214, 0.9921569, 0, 1, 1, 1,
	    0.9882893, -0.9152396, 0.6054804, 0.9960784, 0, 1, 1, 1,
	    0.9950202, -1.477745, 2.869324, 1, 0, 0.9960784, 1, 1,
	    0.9964955, -0.7937958, 3.213031, 1, 0, 0.9882353, 1, 1,
	    1.000531, 2.1332, -0.2739459, 1, 0, 0.9843137, 1, 1,
	    1.008279, -0.2315226, 2.485331, 1, 0, 0.9764706, 1, 1,
	    1.009855, -0.9199529, 2.057423, 1, 0, 0.972549, 1, 1,
	    1.016603, -0.6893322, 1.693819, 1, 0, 0.9647059, 1, 1,
	    1.018343, 0.5728964, 0.540145, 1, 0, 0.9607843, 1, 1,
	    1.024095, -1.955043, 1.722651, 1, 0, 0.9529412, 1, 1,
	    1.024819, 0.4422519, 1.049975, 1, 0, 0.9490196, 1, 1,
	    1.034142, -0.3043166, 0.9580348, 1, 0, 0.9411765, 1, 1,
	    1.038236, -1.227473, 2.062155, 1, 0, 0.9372549, 1, 1,
	    1.051944, -1.803084, 3.005392, 1, 0, 0.9294118, 1, 1,
	    1.054081, 0.01105669, 1.80238, 1, 0, 0.9254902, 1, 1,
	    1.059752, 0.9086977, 2.426208, 1, 0, 0.9176471, 1, 1,
	    1.060176, -0.2564352, 3.436311, 1, 0, 0.9137255, 1, 1,
	    1.060711, 0.07077448, 0.3935172, 1, 0, 0.9058824, 1, 1,
	    1.061058, -0.1944629, 0.5922515, 1, 0, 0.9019608, 1, 1,
	    1.071582, -0.7431626, 0.9990129, 1, 0, 0.8941177, 1, 1,
	    1.073924, 1.036125, 1.522193, 1, 0, 0.8862745, 1, 1,
	    1.075867, -1.791269, 2.387355, 1, 0, 0.8823529, 1, 1,
	    1.080241, -0.7931419, 2.796765, 1, 0, 0.8745098, 1, 1,
	    1.080966, -0.7061115, 2.858695, 1, 0, 0.8705882, 1, 1,
	    1.082265, -0.03964492, 2.932709, 1, 0, 0.8627451, 1, 1,
	    1.08742, -1.595135, 2.607711, 1, 0, 0.8588235, 1, 1,
	    1.091573, -1.599946, 1.766868, 1, 0, 0.8509804, 1, 1,
	    1.1028, 0.593362, 1.549091, 1, 0, 0.8470588, 1, 1,
	    1.103794, -0.819862, 1.634014, 1, 0, 0.8392157, 1, 1,
	    1.10524, -0.2074208, 2.065174, 1, 0, 0.8352941, 1, 1,
	    1.110625, -1.373495, 2.258403, 1, 0, 0.827451, 1, 1,
	    1.116401, 0.846606, 0.7733734, 1, 0, 0.8235294, 1, 1,
	    1.119795, 0.3900791, 0.484147, 1, 0, 0.8156863, 1, 1,
	    1.131699, 0.02466753, 2.598433, 1, 0, 0.8117647, 1, 1,
	    1.132014, -0.04533409, 1.391584, 1, 0, 0.8039216, 1, 1,
	    1.143113, 0.2336769, -1.020012, 1, 0, 0.7960784, 1, 1,
	    1.156638, 0.5858724, 0.3945679, 1, 0, 0.7921569, 1, 1,
	    1.158904, 0.4880187, 2.0684, 1, 0, 0.7843137, 1, 1,
	    1.167832, -1.214781, 1.77507, 1, 0, 0.7803922, 1, 1,
	    1.175219, 2.101604, 0.6897209, 1, 0, 0.772549, 1, 1,
	    1.179159, -0.7180746, 0.5825458, 1, 0, 0.7686275, 1, 1,
	    1.183303, -1.673002, 2.361055, 1, 0, 0.7607843, 1, 1,
	    1.184484, -0.1199609, 0.3239202, 1, 0, 0.7568628, 1, 1,
	    1.188897, -0.5861961, 2.938979, 1, 0, 0.7490196, 1, 1,
	    1.189827, 0.6820375, -0.7326043, 1, 0, 0.7450981, 1, 1,
	    1.190257, 1.591504, 0.4412784, 1, 0, 0.7372549, 1, 1,
	    1.194333, -1.765281, 1.896887, 1, 0, 0.7333333, 1, 1,
	    1.200773, 0.6499419, 0.2036399, 1, 0, 0.7254902, 1, 1,
	    1.201631, 0.8263245, 0.991703, 1, 0, 0.7215686, 1, 1,
	    1.202116, -2.033519, 1.936447, 1, 0, 0.7137255, 1, 1,
	    1.204326, -0.5549725, 2.541893, 1, 0, 0.7098039, 1, 1,
	    1.208849, 0.1479044, -0.7894999, 1, 0, 0.7019608, 1, 1,
	    1.22137, -1.281606, 3.787686, 1, 0, 0.6941177, 1, 1,
	    1.230487, 0.4422073, 2.579968, 1, 0, 0.6901961, 1, 1,
	    1.235646, 0.56871, 1.331515, 1, 0, 0.682353, 1, 1,
	    1.239227, 0.9188312, 0.8454653, 1, 0, 0.6784314, 1, 1,
	    1.245261, -0.01321147, 2.1169, 1, 0, 0.6705883, 1, 1,
	    1.246321, -0.9496019, 2.603627, 1, 0, 0.6666667, 1, 1,
	    1.246895, -1.072777, 1.406541, 1, 0, 0.6588235, 1, 1,
	    1.248757, -0.4546725, 3.191783, 1, 0, 0.654902, 1, 1,
	    1.256582, 0.4807982, 1.052114, 1, 0, 0.6470588, 1, 1,
	    1.256814, -0.1697946, 2.367696, 1, 0, 0.6431373, 1, 1,
	    1.256879, 0.8143222, 1.449809, 1, 0, 0.6352941, 1, 1,
	    1.262077, 0.9882463, 1.308349, 1, 0, 0.6313726, 1, 1,
	    1.267987, -1.248905, 2.435786, 1, 0, 0.6235294, 1, 1,
	    1.277969, 0.09018766, 0.9848953, 1, 0, 0.6196079, 1, 1,
	    1.289945, -0.9799273, 4.047998, 1, 0, 0.6117647, 1, 1,
	    1.291815, 0.850948, 0.498627, 1, 0, 0.6078432, 1, 1,
	    1.29209, 0.1784073, 2.492302, 1, 0, 0.6, 1, 1,
	    1.292473, -0.5521322, 1.283763, 1, 0, 0.5921569, 1, 1,
	    1.311343, -1.38302, 1.589138, 1, 0, 0.5882353, 1, 1,
	    1.318792, -0.6556621, 2.169801, 1, 0, 0.5803922, 1, 1,
	    1.320203, 0.1665176, 1.774064, 1, 0, 0.5764706, 1, 1,
	    1.321605, -0.323479, 1.374414, 1, 0, 0.5686275, 1, 1,
	    1.324607, -0.6409555, 2.733998, 1, 0, 0.5647059, 1, 1,
	    1.32598, 1.049309, 2.081657, 1, 0, 0.5568628, 1, 1,
	    1.326814, -0.4822658, 0.5541289, 1, 0, 0.5529412, 1, 1,
	    1.339795, 1.02894, 1.963595, 1, 0, 0.5450981, 1, 1,
	    1.344106, -0.05315825, 2.982058, 1, 0, 0.5411765, 1, 1,
	    1.346783, -0.9339223, 2.79074, 1, 0, 0.5333334, 1, 1,
	    1.347755, -0.8573796, 0.6307061, 1, 0, 0.5294118, 1, 1,
	    1.349744, -0.2892578, 1.73359, 1, 0, 0.5215687, 1, 1,
	    1.349985, -0.9957334, 2.566382, 1, 0, 0.5176471, 1, 1,
	    1.351793, -0.143324, 0.9851077, 1, 0, 0.509804, 1, 1,
	    1.358242, 0.2625671, 1.510299, 1, 0, 0.5058824, 1, 1,
	    1.373103, 0.4622475, 1.102607, 1, 0, 0.4980392, 1, 1,
	    1.381251, 1.46814, 1.278561, 1, 0, 0.4901961, 1, 1,
	    1.394921, -0.4929661, 2.446249, 1, 0, 0.4862745, 1, 1,
	    1.405178, -2.319766, 1.399064, 1, 0, 0.4784314, 1, 1,
	    1.40589, 1.003013, 1.320962, 1, 0, 0.4745098, 1, 1,
	    1.419621, -2.968235, 1.372425, 1, 0, 0.4666667, 1, 1,
	    1.42117, -1.938501, 0.916844, 1, 0, 0.4627451, 1, 1,
	    1.42367, -0.2537395, 1.293811, 1, 0, 0.454902, 1, 1,
	    1.429692, -0.761341, 2.941511, 1, 0, 0.4509804, 1, 1,
	    1.436889, 0.1712336, 1.80433, 1, 0, 0.4431373, 1, 1,
	    1.437946, -0.6036823, 1.347931, 1, 0, 0.4392157, 1, 1,
	    1.444032, 0.2173782, -0.07424051, 1, 0, 0.4313726, 1, 1,
	    1.447426, 0.8817448, 1.392437, 1, 0, 0.427451, 1, 1,
	    1.448833, 0.3255174, 2.778056, 1, 0, 0.4196078, 1, 1,
	    1.451724, 0.938863, 1.694402, 1, 0, 0.4156863, 1, 1,
	    1.462773, -0.01681317, 0.8286696, 1, 0, 0.4078431, 1, 1,
	    1.470532, -1.169971, 2.363846, 1, 0, 0.4039216, 1, 1,
	    1.471923, -0.348942, 2.450176, 1, 0, 0.3960784, 1, 1,
	    1.476831, -1.026544, 3.322249, 1, 0, 0.3882353, 1, 1,
	    1.481035, -1.235481, 2.208685, 1, 0, 0.3843137, 1, 1,
	    1.483847, -1.980526, 3.922301, 1, 0, 0.3764706, 1, 1,
	    1.489608, -0.7843097, 1.096418, 1, 0, 0.372549, 1, 1,
	    1.495365, -0.08978285, 1.06749, 1, 0, 0.3647059, 1, 1,
	    1.502201, -1.000314, 3.495071, 1, 0, 0.3607843, 1, 1,
	    1.502646, -1.873896, 1.13789, 1, 0, 0.3529412, 1, 1,
	    1.502841, -0.2225535, 2.706798, 1, 0, 0.3490196, 1, 1,
	    1.506433, -0.04315935, 1.201199, 1, 0, 0.3411765, 1, 1,
	    1.533617, 0.7769177, -0.1311385, 1, 0, 0.3372549, 1, 1,
	    1.536033, -0.4165966, 2.615766, 1, 0, 0.3294118, 1, 1,
	    1.54627, 0.9607139, -0.1578142, 1, 0, 0.3254902, 1, 1,
	    1.564387, -0.6589846, 1.144906, 1, 0, 0.3176471, 1, 1,
	    1.575632, 0.1439209, 1.396465, 1, 0, 0.3137255, 1, 1,
	    1.581509, 0.04512141, 1.417093, 1, 0, 0.3058824, 1, 1,
	    1.591857, -1.192806, 3.089855, 1, 0, 0.2980392, 1, 1,
	    1.618286, -1.445339, 2.241405, 1, 0, 0.2941177, 1, 1,
	    1.621152, -0.5797392, 2.340838, 1, 0, 0.2862745, 1, 1,
	    1.625574, -0.2609198, 1.831234, 1, 0, 0.282353, 1, 1,
	    1.642526, 0.2440425, 3.490282, 1, 0, 0.2745098, 1, 1,
	    1.647565, -0.7557116, 1.574484, 1, 0, 0.2705882, 1, 1,
	    1.648618, -0.5282515, 1.766431, 1, 0, 0.2627451, 1, 1,
	    1.656555, -0.7691211, 1.590301, 1, 0, 0.2588235, 1, 1,
	    1.657638, 0.3460461, 0.6540934, 1, 0, 0.2509804, 1, 1,
	    1.664934, 0.908543, 0.7452061, 1, 0, 0.2470588, 1, 1,
	    1.673134, 1.152812, -0.1570411, 1, 0, 0.2392157, 1, 1,
	    1.685897, -1.068833, 2.590945, 1, 0, 0.2352941, 1, 1,
	    1.706377, -0.1809381, 3.079979, 1, 0, 0.227451, 1, 1,
	    1.707123, -0.6366596, 2.919613, 1, 0, 0.2235294, 1, 1,
	    1.723335, -0.9886241, 3.096928, 1, 0, 0.2156863, 1, 1,
	    1.740802, 1.460422, 1.605032, 1, 0, 0.2117647, 1, 1,
	    1.753712, 1.154549, -0.4935765, 1, 0, 0.2039216, 1, 1,
	    1.758245, -0.8311335, 1.999848, 1, 0, 0.1960784, 1, 1,
	    1.782057, -1.011752, 0.8522137, 1, 0, 0.1921569, 1, 1,
	    1.784419, 2.308835, -0.5229552, 1, 0, 0.1843137, 1, 1,
	    1.795141, 0.7408503, 0.4378289, 1, 0, 0.1803922, 1, 1,
	    1.802331, 0.5519655, 0.0465347, 1, 0, 0.172549, 1, 1,
	    1.810428, 0.1506012, 1.270409, 1, 0, 0.1686275, 1, 1,
	    1.815549, -0.6341668, 3.364062, 1, 0, 0.1607843, 1, 1,
	    1.816261, -0.2268587, -0.3492798, 1, 0, 0.1568628, 1, 1,
	    1.817325, 1.911896, 0.02770647, 1, 0, 0.1490196, 1, 1,
	    1.826421, -0.7667181, 3.312913, 1, 0, 0.145098, 1, 1,
	    1.83525, 0.3374636, 0.170308, 1, 0, 0.1372549, 1, 1,
	    1.862124, -0.1968413, 1.050991, 1, 0, 0.1333333, 1, 1,
	    1.892428, 0.4639156, 3.091737, 1, 0, 0.1254902, 1, 1,
	    1.908017, 1.298384, 1.20424, 1, 0, 0.1215686, 1, 1,
	    1.909095, 0.08150677, 1.188115, 1, 0, 0.1137255, 1, 1,
	    1.919446, -0.6533684, 1.220637, 1, 0, 0.1098039, 1, 1,
	    1.930657, 1.396768, 1.130304, 1, 0, 0.1019608, 1, 1,
	    1.961479, -0.0152872, 1.748603, 1, 0, 0.09411765, 1, 1,
	    1.981595, 1.141245, 0.6661756, 1, 0, 0.09019608, 1, 1,
	    1.997316, -1.006013, 3.154423, 1, 0, 0.08235294, 1, 1,
	    2.022787, 0.1929931, 0.874485, 1, 0, 0.07843138, 1, 1,
	    2.034021, 0.6707531, 2.203459, 1, 0, 0.07058824, 1, 1,
	    2.069897, -0.7277015, 0.9936925, 1, 0, 0.06666667, 1, 1,
	    2.119831, 0.3045081, 1.940907, 1, 0, 0.05882353, 1, 1,
	    2.121357, 0.08749314, 1.43993, 1, 0, 0.05490196, 1, 1,
	    2.199703, 0.8771846, -0.4442711, 1, 0, 0.04705882, 1, 1,
	    2.214262, -0.3995659, 1.360927, 1, 0, 0.04313726, 1, 1,
	    2.311405, 1.51049, -0.7325897, 1, 0, 0.03529412, 1, 1,
	    2.343624, -0.7479159, 1.342487, 1, 0, 0.03137255, 1, 1,
	    2.414212, 1.666164, 1.195174, 1, 0, 0.02352941, 1, 1,
	    2.486379, 1.270544, 1.837873, 1, 0, 0.01960784, 1, 1,
	    2.656876, -0.720034, 1.518874, 1, 0, 0.01176471, 1, 1,
	    2.753708, -0.2648011, 1.251784, 1, 0, 0.007843138, 1, 1
	   ]);
	   var values22 = v;
	   var posLoc22 = gl.getAttribLocation(prog22, "aPos");
	   var colLoc22 = gl.getAttribLocation(prog22, "aCol");
	   var normLoc22 = gl.getAttribLocation(prog22, "aNorm");
	   var mvMatLoc22 = gl.getUniformLocation(prog22,"mvMatrix");
	   var prMatLoc22 = gl.getUniformLocation(prog22,"prMatrix");
	   var normMatLoc22 = gl.getUniformLocation(prog22,"normMatrix");
	   gl.enable(gl.DEPTH_TEST);
	   gl.depthFunc(gl.LEQUAL);
	   gl.clearDepth(1.0);
	   gl.clearColor(1, 1, 1, 1);
	   var xOffs = yOffs = 0,  drag  = 0;
	   drawScene();
	   function drawScene(){
	     gl.depthMask(true);
	     gl.disable(gl.BLEND);
	     var radius = 9.32374;
	     var s = sin(fov*PI/360);
	     var t = tan(fov*PI/360);
	     var distance = radius/s;
	     var near = distance - radius;
	     var far = distance + radius;
	     var hlen = t*near;
	     var aspect = width/height;
	     prMatrix.makeIdentity();
	     if (aspect > 1)
	       prMatrix.frustum(-hlen*aspect*zoom, hlen*aspect*zoom, 
	                        -hlen*zoom, hlen*zoom, near, far);
	     else  
	       prMatrix.frustum(-hlen*zoom, hlen*zoom, 
	                        -hlen*zoom/aspect, hlen*zoom/aspect, 
	                        near, far);
	     mvMatrix.makeIdentity();
	     mvMatrix.translate( 0.196599, -0.01141882, -0.3623331 );
	     mvMatrix.scale( 1, 1, 1 );   
	     mvMatrix.multRight( userMatrix );  
	     mvMatrix.translate(0, 0, -distance);
	     normMatrix.makeIdentity();
	     normMatrix.scale( 1, 1, 1 );   
	     normMatrix.multRight( userMatrix );
	     gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
	     // ****** spheres object 22 *******
	     gl.useProgram(prog22);
	     gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
	     gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
	     gl.uniformMatrix4fv( prMatLoc22, false, new Float32Array(prMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( mvMatLoc22, false, new Float32Array(mvMatrix.getAsArray()) );
	     gl.uniformMatrix4fv( normMatLoc22, false, new Float32Array(normMatrix.getAsArray()) );
	     gl.enableVertexAttribArray( posLoc22 );
	     gl.vertexAttribPointer(posLoc22,  3, gl.FLOAT, false, 12,  0);
	     gl.enableVertexAttribArray(normLoc22 );
	     gl.vertexAttribPointer(normLoc22,  3, gl.FLOAT, false, 12,  0);
	     gl.disableVertexAttribArray( colLoc22 );
	     var sphereNorm = new CanvasMatrix4();
	     sphereNorm.scale(1, 1, 1);
	     sphereNorm.multRight(normMatrix);
	     gl.uniformMatrix4fv( normMatLoc22, false, new Float32Array(sphereNorm.getAsArray()) );
	     for (var i = 0; i < 1000; i++) {
	       var sphereMV = new CanvasMatrix4();
	       var baseofs = i*8
	       var ofs = baseofs + 7;	       
	       var scale = values22[ofs];
	       sphereMV.scale(1*scale, 1*scale, 1*scale);
	       sphereMV.translate(values22[baseofs], 
	       			  values22[baseofs+1], 
	       			  values22[baseofs+2]);
	       sphereMV.multRight(mvMatrix);
	       gl.uniformMatrix4fv( mvMatLoc22, false, new Float32Array(sphereMV.getAsArray()) );
	       ofs = baseofs + 3;       
	       gl.vertexAttrib4f( colLoc22, values22[ofs], 
	       				    values22[ofs+1], 
	       				    values22[ofs+2],
	       				    values22[ofs+3] );
	       gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
	     }
	     gl.flush ();
	   }
	   var vlen = function(v) {
	     return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
	   }
	   var xprod = function(a, b) {
	     return [a[1]*b[2] - a[2]*b[1],
	             a[2]*b[0] - a[0]*b[2],
	             a[0]*b[1] - a[1]*b[0]];
	   }
	   var screenToVector = function(x, y) {
	     var radius = max(width, height)/2.0;
	     var cx = width/2.0;
	     var cy = height/2.0;
	     var px = (x-cx)/radius;
	     var py = (y-cy)/radius;
	     var plen = sqrt(px*px+py*py);
	     if (plen > 1.e-6) { 
	       px = px/plen;
	       py = py/plen;
	     }
	     var angle = (SQRT2 - plen)/SQRT2*PI/2;
	     var z = sin(angle);
	     var zlen = sqrt(1.0 - z*z);
	     px = px * zlen;
	     py = py * zlen;
	     return [px, py, z];
	   }
	   var rotBase;
	   var trackballdown = function(x,y) {
	     rotBase = screenToVector(x, y);
	     saveMat.load(userMatrix);
	   }
	   var trackballmove = function(x,y) {
	     var rotCurrent = screenToVector(x,y);
	     var dot = rotBase[0]*rotCurrent[0] + 
	   	       rotBase[1]*rotCurrent[1] + 
	   	       rotBase[2]*rotCurrent[2];
	     var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
	     var axis = xprod(rotBase, rotCurrent);
	     userMatrix.load(saveMat);
	     userMatrix.rotate(angle, axis[0], axis[1], axis[2]);
	     drawScene();
	   }
	   var y0zoom = 0;
	   var zoom0 = 1;
	   var zoomdown = function(x, y) {
	     y0zoom = y;
	     zoom0 = log(zoom);
	   }
	   var zoommove = function(x, y) {
	     zoom = exp(zoom0 + (y-y0zoom)/height);
	     drawScene();
	   }
	   var y0fov = 0;
	   var fov0 = 1;
	   var fovdown = function(x, y) {
	     y0fov = y;
	     fov0 = fov;
	   }
	   var fovmove = function(x, y) {
	     fov = max(1, min(179, fov0 + 180*(y-y0fov)/height));
	     drawScene();
	   }
	   var mousedown = [trackballdown, zoomdown, fovdown];
	   var mousemove = [trackballmove, zoommove, fovmove];
	   function relMouseCoords(event){
	     var totalOffsetX = 0;
	     var totalOffsetY = 0;
	     var currentElement = canvas;
	     do{
	       totalOffsetX += currentElement.offsetLeft;
	       totalOffsetY += currentElement.offsetTop;
	     }
	     while(currentElement = currentElement.offsetParent)
	     var canvasX = event.pageX - totalOffsetX;
	     var canvasY = event.pageY - totalOffsetY;
	     return {x:canvasX, y:canvasY}
	   }
	   canvas.onmousedown = function ( ev ){
	     if (!ev.which) // Use w3c defns in preference to MS
	       switch (ev.button) {
	       case 0: ev.which = 1; break;
	       case 1: 
	       case 4: ev.which = 2; break;
	       case 2: ev.which = 3;
	     }
	     drag = ev.which;
	     var f = mousedown[drag-1];
	     if (f) {
	       var coords = relMouseCoords(ev);
	       f(coords.x, height-coords.y); 
	       ev.preventDefault();
	     }
	   }    
	   canvas.onmouseup = function ( ev ){	
	     drag = 0;
	   }
	   canvas.onmouseout = canvas.onmouseup;
	   canvas.onmousemove = function ( ev ){
	     if ( drag == 0 ) return;
	     var f = mousemove[drag-1];
	     if (f) {
	       var coords = relMouseCoords(ev);
	       f(coords.x, height-coords.y);
	     }
	   }
	   var wheelHandler = function(ev) {
	     var del = 1.1;
	     if (ev.shiftKey) del = 1.01;
	     var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
	     zoom *= ds;
	     drawScene();
	     ev.preventDefault();
	   };
	   canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
	   canvas.addEventListener("mousewheel", wheelHandler, false);
	}
</script>
<canvas id="_2d_3d_spherescanvas" width="1" height="1"></canvas> 
<p id="_2d_3d_spheresdebug">
<img src="_2d_3d_spheressnapshot.png" alt="_2d_3d_spheressnapshot" width=505/><br>
	You must enable Javascript to view this page properly.</p>
<script>_2d_3d_sphereswebGLStart();</script>


Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 27 10:54:38 PM
Last Modified: 2013 Apr 01 08:43:48 AM


# Cars example #
from [statmethods.net](http://www.statmethods.net/advgraphs/ggplot2.html)


```r
# ggplot2 examples
library(ggplot2)

# rm any local mtcars
rm(mtcars)
```

```
## Warning: object 'mtcars' not found
```

```r

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
Last Modified: 2013 Mar 28 03:33:35 PM


# Map plots #

## USA Arrests ##

```r
library(ggplot2)
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

![plot of chunk maps_arrests](figure/maps_arrests1.png) 

```r
last_plot() + coord_map()
```

![plot of chunk maps_arrests](figure/maps_arrests2.png) 

```r
ggplot(crimesm, aes(map_id = state)) + geom_map(aes(fill = value), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat) + facet_wrap(~variable)
```

![plot of chunk maps_arrests](figure/maps_arrests3.png) 

### Use fig.show='hold' ###
These are the same plots with fig.show='hold' in the options

```r
ggplot(crimes, aes(map_id = state)) + geom_map(aes(fill = Murder), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat)
last_plot() + coord_map()
ggplot(crimesm, aes(map_id = state)) + geom_map(aes(fill = value), map = states_map) + 
    expand_limits(x = states_map$long, y = states_map$lat) + facet_wrap(~variable)
```

![plot of chunk maps_figshow](figure/maps_figshow1.png) ![plot of chunk maps_figshow](figure/maps_figshow2.png) ![plot of chunk maps_figshow](figure/maps_figshow3.png) 

Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 28 02:44:48 PM
Last Modified: 2013 Mar 28 03:33:39 PM


# Math expressions #
[MathJax](http://www.mathjax.org/demos/tex-samples) examples

## simple
\[\alpha+\beta=\gamma\]

## The Lorenz Equations ##
\[\begin{aligned}
\dot{x} &amp; = \sigma(y-x) \\
\dot{y} &amp; = \rho x - y - xz \\
\dot{z} &amp; = -\beta z + xy
\end{aligned} \]

## Coins ##
The probability of getting \(k\) heads when flipping \(n\) coins is
\[P(E)   = {n \choose k} p^k (1-p)^{ n-k} \]

## An Identity of Ramanujan ##
\[ \frac{1}{\Bigl(\sqrt{\phi \sqrt{5}}-\phi\Bigr) e^{\frac25 \pi}} =
1+\frac{e^{-2\pi}} {1+\frac{e^{-4\pi}} {1+\frac{e^{-6\pi}}
{1+\frac{e^{-8\pi}} {1+\ldots} } } } \]


Author: [Jim Hester](http://jimhester.com)
Created: 2013 Mar 28 03:22:28 PM
Last Modified: 2013 Apr 01 02:36:15 PM
