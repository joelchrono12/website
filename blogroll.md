---
title: Blogroll
header: Blogroll
description: A list of blogs and digital gardens I enjoy reading on my free time.
permalink: /blogroll/
redirect_from: /more/blogroll/
layout: default
---

<article markdown="1">
I follow a lot of websites via RSS, so I decided to do a quick list of the personal blogs and digital gardens I enjoy reading whenever they appear on my feed.

I plan to grow this list in the future, but this is quite a bit already. I'll also check if the websites still post actively, if not, I'll rotate with others I've discovered that are more active!

You can also [download an OPML file](/blogroll.opml) to add all of these to your RSS reader in one fell swoop!

__Last updated: August 17th,2025__ 

## Featured buttons

<article markdown="1">

These blogs and personal websites have cool buttons, so I added them. Send me your button and I'll add it too!

{% include badges_blogroll.html %}

Feel free to add one of my buttons to your site (do not [hotlink](https://simple.wikipedia.org/wiki/Hotlinking) them though).

<ul class="badge-list">
<li><a href="{{ site.url }}" target="_blank"><img class= "badge" alt="joelchrono's blog" src="/assets/img/badges/joelchrono.png" /></a></li>
<li><a href="{{ site.url }}" target="_blank"><img src="/assets/img/badges/joelchronopfp.png" class="badge" alt="joelchrono's blog" /></a></li>
</ul>
</article>
</article>

## My blogroll

{% assign sorted_blogroll = site.data.blogroll | sort: 'name' %}

<div class="flex-container">
{% for blogger in sorted_blogroll %}
<article>
<h3 class="post" style="align-items: normal;">
<a class="post-title" href="{{ blogger.link }}">{{ blogger.name }}</a>
<a class="post-title" href="{{ blogger.rss }}">RSS</a>
</h3> 
<div class="blog-description">{{ blogger.desc | newline_to_br }}</div>
</article>
{% endfor %}
</div>
