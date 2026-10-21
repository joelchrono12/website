---
title: Joel's Homepage
header: Welcome to my website!
description: Ramblings and thoughts about tech, free software, and hobbies of my life, shared bit by bit.
permalink: /
layout: default
---
<article class="h-card" markdown=1>
## Enjoy your stay here!
<p class="p-note">Hey! I'm <a href="{{ site.url }}" rel="me" class="u-url u-uid p-name">Joel</a> (a.k.a <code class="p-nickname">joelchrono</code>). A random guy from <span class="p-country-name">México</span> lindo y querido! I am a <span class="p-category">hobby collector</span>, fake fan of many things, <span class="p-category">foss enthusiast</span>, gamer, <span class="p-category">mechatronics engineer</span>, and of course, a <span class="p-category">blogger</span></p>

<div class=bio>
<img class="u-photo" src="/assets/img/pfp_isometric.png">
<div markdown=1>

You are visiting my personal website. Here you can see some of my **thoughts** and **ramblings** about **tech**, **gaming** and **other hobbies**, my favorite of which is [origami](/origami). I hope you enjoy your visit!
Take your time and explore as much as you want, there's [plenty of sections](/more/) to dive into!

<p id="latest-listen">
I'm really into music, this text will be overwritten by the latest song I listened to if you enable Javascript, maybe something by Miki Matsubara or Daft Punk.
</p>

</div>
</div>
</article>
<article markdown="1">
## Latest blogs
<div class="flex-container">
{% for post in site.posts limit:5 %}
<article>
  <h3 class="post">
  <a href="{{ post.url }}">{{ post.title }}</a>
{% if post.tags contains "book" %}
<a href="/tags/book">📖</a>
{% endif %}
{% if post.tags contains "response" %}
<a href="/tags/response">💬</a>
{% endif %}
{% if post.tags contains "game" %}
<a href="/tags/game">🕹</a>
{% endif %}
  </h3>
  <div class="blog-description">{{ post.description | strip_html | strip_newlines }}</div>
  <span class="post-date"><time datetime="{{ post.date }}">{{ post.date | date: "%B %d, %Y" }}</time></span>
</article>
{% endfor %} 
</div>
</article>

<article markdown="1">
## This week in other years

{% assign current_week = site.time | date: "%V" %}
{% assign current_week_year = site.time | date: "%G" %}

<div class="flex-container">
{% for post in site.posts %}
  {% assign post_week = post.date | date: "%V" %}
  {% assign post_week_year = post.date | date: "%G" %}

  {% if post_week == current_week and post_week_year != current_week_year %}
  <article>
    <h3 class="post"><a href="{{ post.url }}">{{ post.title }}</a>
{% if post.tags contains "book" %}
<a href="/tags/book">📖</a>
{% endif %}
{% if post.tags contains "response" %}
<a href="/tags/response">💬</a>
{% endif %}
{% if post.tags contains "game" %}
<a href="/tags/game">🕹</a>
{% endif %}
</h3>
    <div class="blog-description">{{ post.description | strip_html | strip_newlines }}</div>
    <span class="post-date"><time datetime="{{ post.date }}">{{ post.date | date: "%B %d, %Y" }}</time></span>
  </article>
  {% endif %}
{% endfor %}
</div>
</article>

<article markdown="1" >
## Support me
You can support me in many ways, either via [PayPal](https://www.paypal.com/donate/?hosted_button_id=NAD2DMRXY22EW), [Liberapay](https://liberapay.com/joelchrono12/donate) or [Ko-fi](https://ko-fi.com/joelchrono)

I don't use crypto personally, but if you want to give me some, there is the option too. My domain provider actually lets me renew it with that! So it doesn't go to waste :P

<details>
<summary>Monero</summary>
I only use <b>Monero</b> since at least its something anonymous and privacy respecting!
<pre>
45Y7FRc1SfrB8YsoJKnoWqTxRaLdFRghaB5EvVaLhs3BMmr3mT5jsooKVVefyF6m4Hg3CyM24q7Ck6TrnbhWmmEMLVJmc1e
</pre>
<div style="display: flex;justify-content: center">
<img alt="45Y7FRc1SfrB8YsoJKnoWqTxRaLdFRghaB5EvVaLhs3BMmr3mT5jsooKVVefyF6m4Hg3CyM24q7Ck6TrnbhWmmEMLVJmc1e" src="./assets/img/test.png"/>
</div>
</details>
</article>
<script src="/assets/js/latest-track.js"></script>
