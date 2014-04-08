{%- extends 'basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}


{%- block header -%}
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>{{resources['metadata']['name']}}</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<style type="text/css">
/* Overrides of notebook CSS for static HTML export */
body {
  overflow: visible;
  padding: 8px;
}

div#notebook {
  overflow: visible;
  border-top: none;
}

@media print {
  div.cell {
    display: block;
    page-break-inside: avoid;
  } 
  div.output_wrapper { 
    display: block;
    page-break-inside: avoid; 
  }
  div.output { 
    display: block;
    page-break-inside: avoid; 
  }
}
</style>

<!-- Loading mathjax macro -->
{{ mathjax() }}

<link href="//fonts.googleapis.com/css?family=Ubuntu:300italic,300,400italic,400,500italic,500,700italic,700" rel="stylesheet" type="text/css">

<style type="text/css">

body
{
    font-family: Ubuntu, "Helvetica Neue",Helvetica,Arial,sans-serif;
}

header
{
    text-align: right;
}

header,
header > a,
header > h2
{
    font-family: monospace;
    color: #111;
    opacity: 0.5;
}

header > a > h2
{
    display: inline-block;
}

div.prompt
{
    display: none;
}

.rendered_html div
{
    max-height: 10000000px !important;
    max-width: 10000000px !important;
    overflow: auto !important;
}

#comment
{
    border-style: solid;
    border-color: #d0d0d0;
    border-width: 1px 0 0 0;
    margin: 1em 0;
    padding: 1em 0;
}

footer
{
    font-family: monospace;
    text-align: right;
    /*
    border-style: solid;
    border-color: #d0d0d0;
    border-width: 1px 0 0 0;
    */
    margin-top: 1em;
}

footer pre
{
    border: 0;
    background-color: inherit;
}
</style>

</head>
{%- endblock header -%}

{% block body %}
<body>
  <div tabindex="-1" id="notebook" class="border-box-sizing">
    <div class="container" id="notebook-container">
  <header>
    <a href='/'><h2>By Spike ekipS</h2></a> work for me
  </header>
{{ super() }}

<script src="https://apis.google.com/js/plusone.js"></script>
<div class="g-comments"
    data-href="http://spikeekips.github.io/"
    data-first_party_property="BLOGGER">
</div>

  <footer>
  <pre><a href='/'>Home</a> / Written By <a href='http://github.com/spikeekips'>Spike^ekipS</a> | <a href="https://plus.google.com/101452362887920966223?rel=author">Google</a></pre>
  
  </footer>
    </div>
  </div>
</body>
{%- endblock body %}

{% block footer %}
</html>
{% endblock footer %}
