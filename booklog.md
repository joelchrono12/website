---
title: Bookshelf
header: Bookshelf
description: A log of the books I've read divided by year. Mostly filled with Science Fiction.
redirect_from: /more/booklog/
redirect_from: /reading/
redirect_from: /booklog/
permalink: /bookshelf/
layout: default
---

You can also find me on the following reading websites:

- [Bookrastinating](https://bookrastinating.com/user/joel)
- [The Storygraph](https://app.thestorygraph.com/profile/joelchrono)

{% comment %} <table> <thead> <tr> <th>Title</th> <th>Started</th> <th>Finished</th> </tr> </thead> <tbody> {% for item in site.books %} <tr> <td><i>{{ item.title }}</i> by {{ item.author }}</td> <td>{{ item.start }}</td> {% if item.end == "In progress" %} <label for="file">Downloading progress:</label> <progress id="file" value="8" max="100">8%</progress> {% else %} <td>{{ item.end }}</td> {% endif %} </tr> {% endfor %} </tbody> </table> {% endcomment %}

<style > .responsive-grid { display: flex; flex-wrap: wrap; justify-content: start; margin-bottom: 1.5rem; gap: 1rem; } .media-container{ border: none; padding: 0; flex: 1 1 15%; flex-direction: row; } .media-summary { display: flex; flex-direction: column; align-items: center; background-color: inherit; gap: 0.8rem; } .media-art{ background-size: cover; background-position: center; /*border-radius: 12px;*/ overflow: hidden; position: relative; text-align: center; height: 220px; min-width: 130px; } .media-art img { background-size: cover; background-position: center; /*border-radius: 12px;*/ overflow: hidden; position: relative; text-align: center; height: 220px; width: 110px; min-width: 130px; } .book-content { display: flex; flex-grow: 1; padding: 0 0.8rem; align-items: center; word-break: break-word; text-align: center; justify-content: center; } .title { font-weight: bold; line-height: 1.2; } .artist { font-size: small; } .dates { font-size: small; white-space: pre-line; margin: 0; overflow: visible; } .info { display: grid; line-height: 1.5; } details[open] summary, details summary { list-style: none; font-weight: inherit; margin-bottom: 0; } .book-summary { text-align: left; } details { transition: none; background: none; margin: 0; } details[open] { display: flex; flex: 1 1 100%; max-width: 100%; } details[open] > .media-art { height: 100%; min-width: 130px; } details[open] > div img { height: 100%; min-width: 130px; } details[open] div.book-content{ display: none; } details[open] > .media-summary{ display: flex; flex-direction: row; background-color: inherit; border: none; } details[open] summary div.book-content { justify-content: left; text-align: left; } details[open] > .info { padding-top: 1rem; padding-right: 1rem; padding-left: 1rem; text-align: center; border: solid 2px var(--accent); margin-left: 1rem; background: var(--code-bg) } @media screen and (max-width: 600px) { details[open] { display: flex; flex: 1 1 100%; max-width: 100%; align-items: center; flex-direction: column; gap: 1rem; } details[open] > .info { border: solid 2px var(--accent); margin: 0; background: var(--code-bg) } .book-content { flex-grow: 1; min-height: 0; align-items: right; } .dates { display: inline-block; } } progress::-moz-progress-bar { background: var(--border); } progress::-webkit-progress-value { background: var(--border); } progress { height: 12px; width: 100%; border: solid 2px var(--border); accent-color: var(--border); background-color: var(--bg); margin-bottom: 0; } </style>


{% if site.books %}
  {% assign books_by_year = site.books | sort: 'end' | group_by_exp: "item", "item.end | date: '%Y'" %}
  {% for year_group in books_by_year reversed %}
  <h3>{{ year_group.name }}</h3>
  <div class="responsive-grid">
  {% for item in year_group.items reversed %}
  <details class="media-container">
    <summary class="media-summary">
    <div class="media-art"><img alt="{{ item.title }}" src="{{ item.cover }}"></div>
    <div class="book-content">
        <div class="info">
            <span class="title"><i>{{ item.title }}</i></span>
            <span class="artist">by <b>{{ item.author }}</b></span>
            <span class="dates">Start: {{ item.start }}</span>
            {% if item.progress < 100 %}
            <p class="dates"><label for="file">Progress: {{ item.progress }}%</label><progress id="file" value="{{ item.progress }}" max="100"/></p>
            {% else %}
            <span class="dates">Finish: {{ item.end }}</span>
        {% endif %}
      </div>
      </div>
    </summary>
      <div class="info">
            <div class="book-metadata">
                <span class="title"><i>{{ item.title }}</i></span>
                <span class="artist">by <b>{{ item.author }}</b></span>
                <br>
                <span class="dates">Start: {{ item.start }}</span>
                {% if item.progress < 100 %}
                <p class="dates"><label for="file">Progress: {{ item.progress }}%</label><progress id="file" value="{{ item.progress }}" max="100"/></p>
                {% else %}
                <span class="dates">Finish: {{ item.end }}</span>
                {% endif %}
            </div>
            <p class="book-summary">{{ item.summary }}</p>
      </div>
  </details>
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
