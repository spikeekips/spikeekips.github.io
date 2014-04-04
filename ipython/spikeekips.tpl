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
    margin-top: 1em;
}

footer
{
    font-family: monospace;
    text-align: right;
    border-style: solid;
    border-color: #d0d0d0;
    border-width: 1px 0 0 0;
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
    <a href='http://spikeekips.github.io/'><h2>Spike^ekipS</h2></a> work for me
  </header>
{{ super() }}


<!-- START: Livefyre Embed -->
<div id='comment'>
<div id="livefyre-comments"></div>
</div>
<script type="text/javascript" src="//zor.livefyre.com/wjs/v3.0/javascripts/livefyre.js"></script>
<script type="text/javascript">
(function () {
    var articleId = fyre.conv.load.makeArticleId(null);
    fyre.conv.load({}, [{
        el: 'livefyre-comments',
        network: "livefyre.com",
        siteId: "356593",
        articleId: articleId,
        signed: false,
        collectionMeta: {
            articleId: articleId,
            url: fyre.conv.load.makeCollectionUrl(),
        }
    }], function() {});
}());
</script>
<!-- END: Livefyre Embed -->

  <pre><a href='http://spikeekips.github.io/'>Home</a> / Written By <a href='http://github.com/spikeekips'>Spike^ekipS</a></pre>
  </footer>
    </div>
  </div>
</body>
{%- endblock body %}

{% block footer %}
</html>
{% endblock footer %}
