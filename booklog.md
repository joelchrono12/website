---
title: Bookshelf
header: Bookshelf
description: A log of the books I've read divided by year. Mostly filled with Science Fiction.
redirect_from: /more/booklog/
redirect_from: /reading/
redirect_from: /booklog/
redirect_from: /books/
permalink: /bookshelf/
layout: default
---

You can also find me on the following reading websites:

- [Bookrastinating](https://bookrastinating.com/user/joel)
- [The Storygraph](https://app.thestorygraph.com/profile/joelchrono)


{% if site.books %}
  {% assign books_by_year = site.books | sort: 'end' | group_by_exp: "item", "item.end | date: '%Y'" %}
  {% for year_group in books_by_year reversed %}
<h2>{{ year_group.name }}</h2>
  <div class="responsive-grid">
  {% for item in year_group.items reversed %}
  <div class="media-container">
    <a href="{{ item.url }}">
    <div class="media-art">
    <img alt="{{ item.title }}" src="{{ item.cover }}">
    {% if item.progress < 100 %}
    <progress id="file" value="{{ item.progress }}" max="100" style="width: 130px; height: 10px; position: relative; bottom:27px; border: none; background-color: var(--accent-bg);"/>
    {% endif %}
    </div></a>
    <div class="book-content">
        <div class="info">
            {% if item.progress < 100 %}
            <span class="dates">{{ item.progress }}%</span>
            {% else %}
            <span class="dates">{{ item.end }}</span>
            {% endif %}
      </div>
      </div>
  </div>
  {% endfor %}
  </div>
  {% endfor %}
{% endif %}

## More books I read at some point

I have not read a ton of books, but up until now, I didn't keep track of dates or anything, so these are books that I read at some point between 2010 and 2021 (or maybe earlier).

- 20,000 Leagues Under the Sea by Jules Verne
- The Mysterious Island by Jules Verne
- Journey to the Center of the Earth by Jules Verne
- From the Earth to the Moon by Jules Verne
- Halo: Contact Harvest by Joseph Staten
- Halo: The Fall of Reach by Eric S. Nylund
- Halo: The Flood by William C. Dietz
- Halo: First Strike by Eric. S. Nylund
- Ready Player One by Ernest Cline
- Star Wars: The Force Unleashed by Sean Williams
- The War of The Worlds by H.G. Wells
- The Invisible Man by H.G. Wells
- The Time Machine by H.G. Wells
- Chronicles of Narnia: The Lion, the Witch and the Wardrobe by C.S. Lewis
- The Pilgrim's Progress by John Bunyan
- The 6 Most Important Decisions You'll Ever Make by Sean Covey
- El Profesor Ziper y la Fabulosa Guitarra Electrica by Juan Villoro
