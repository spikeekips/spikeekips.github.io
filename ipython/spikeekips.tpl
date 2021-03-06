{%- extends 'basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}


{%- block header -%}
<!DOCTYPE html>
<html>
<head>

<meta charset='utf-8' />
<title>{{resources['metadata']['name']}}</title>

<link type='application/atom+xml' rel='alternate' href='http://spikeekips.github.io/atom' />
<script src='//cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>

{% for css in resources.inlining.css -%}
    <style type='text/css'>
    {{ css }}
    </style>
{% endfor %}

<style type='text/css'>
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

<link href='//fonts.googleapis.com/css?family=Ubuntu:300italic,300,400italic,400,500italic,500,700italic,700' rel='stylesheet' type='text/css'>

<style type='text/css'>

body
{
    font-family: Ubuntu, 'Helvetica Neue',Helvetica,Arial,sans-serif;
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

.rendered_html > pre
{
    margin: 1em 0;
}

.rendered_html > pre > code
{
    border: 1px solid #dfdfdf;
    border-radius: 5px;
    padding: 5px;
}

</style>

</head>
{%- endblock header -%}

{% block body %}
<body>
  <div tabindex='-1' id='notebook' class='border-box-sizing'>
    <div class='container' id='notebook-container'>
  <header>
    <a href='/'><h2>By Spike ekipS</h2></a> work for me
  </header>
{{ super() }}

<script src='//apis.google.com/js/plusone.js'></script>
<div class='g-comments'
    data-href='http://spikeekips.github.io/'
    data-first_party_property='BLOGGER'>
</div>

  <footer>
  <pre><a style='display: none;' href='//plus.google.com/101452362887920966223?rel=author'>Google</a><a href='/'>Home</a> / Written By <a href='http://github.com/spikeekips'>Spike^ekipS</a>.
Powered by
    * <a href='http://ipython.org/notebook.html'>IPython Notebook</a>
    * <a href='http://github.com'>github</a>
    * and with various kind of open source projects.</pre>
  
  </footer>
    </div>
  </div>

<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
if (window.location.protocol == 'https:')
{
    ga('create', 'UA-49939831-1', 'spikeekips.github.io'); ga('send', 'pageview');
} else {
    ga('create', 'UA-49927925-1', 'spikeekips.github.io'); ga('send', 'pageview');
}
</script>

</body>
{%- endblock body %}

{% block footer %}
</html>
{% endblock footer %}
