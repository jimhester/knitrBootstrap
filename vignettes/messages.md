<!--
%\VignetteEngine{knitr}
%\VignetteIndexEntry{Messages}
-->
<div class="chunk" id="messages_print"><div class="rcode"><div class="source"><pre class="knitr r">print('this is a print')
</pre></div>
<div class="output"><pre class="knitr r">## [1] "this is a print"
</pre></div>
</div></div>

<div class="chunk" id="messages_cat"><div class="rcode"><div class="source"><pre class="knitr r">cat('this is a cat\n')
</pre></div>
<div class="output"><pre class="knitr r">## this is a cat
</pre></div>
</div></div>

<div class="chunk" id="messages_message"><div class="rcode"><div class="source"><pre class="knitr r">message('this is a message')
</pre></div>
<div class="message"><pre class="knitr r">## this is a message
</pre></div>
</div></div>

<div class="chunk" id="messages_error"><div class="rcode"><div class="source"><pre class="knitr r">stop('this is an error')
</pre></div>
<div class="error"><pre class="knitr r">## Error: this is an error
</pre></div>
</div></div>

<div class="chunk" id="messages_all"><div class="rcode"><div class="source"><pre class="knitr r">print('this is a print')
</pre></div>
<div class="output"><pre class="knitr r">## [1] "this is a print"
</pre></div>
<div class="source"><pre class="knitr r">cat('this is a cat\n')
</pre></div>
<div class="output"><pre class="knitr r">## this is a cat
</pre></div>
<div class="source"><pre class="knitr r">message('this is a message')
</pre></div>
<div class="message"><pre class="knitr r">## this is a message
</pre></div>
<div class="source"><pre class="knitr r">stop('this is an error')
</pre></div>
<div class="error"><pre class="knitr r">## Error: this is an error
</pre></div>
</div></div>

