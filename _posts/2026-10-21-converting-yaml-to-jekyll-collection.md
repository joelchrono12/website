---
title: Converting YAML to Jekyll collection
header: Converting YAML to Jekyll collection
description: I made a simple script to automatically convert a YAML file into a bunch of markdown files for a Jekyll collection
tags: jekyll coding
permalink: /blog/converting-yaml-to-jekyll-collection/
layout: post
date: 2026-10-21 21:36:01 -0600
host: fosstodon.org
username: joel
com_id: 117482668130598307
---

I was reading a blogpost by AetherAnne where she spent some time manually [turning a YAML file into a Jekyll collection.](https://aetheranne.ca/tumblelog/2026/i-could-have-used-ai/) Doing things by hand is a wonderful thing, but well, sometimes a bash script works too!

I don't know why I hadn't done this myself already for [my books](/bookshelf/). Especially because I already had [used Jekyll collections for my origami](/blog/using-jekyll-collections-to-share-origami/) before. Check that out in case anything here is unfamiliar to you. I am assuming a bunch of terms that only make sense if you use Jekyll or YAML or parsing and such.

In any case, my YAML file looked like this:

```yml
- title: "Dune Messiah"
  author: "Frank Herbert"
  cover: "/assets/img/books/dune-messiah.jpg"
  start: "2026-10-20"
  end: "2026-10-20"
  progress: 15
  summary: "a summary"
```

Like AetherAnne, I also considered using some LLM tool to do this, it would have taken a single prompt and would probably work just fine, and few people would have judged me too harshly for it. But again, why not actually try and do it myself, and maybe [learn something?](https://tracydurnell.com/2026/09/26/learning-scripting-by-scraping-my-own-website/)

First I had to figure out how to read a yaml file with bash. I could have done some stuff with the usual `echo` and `cut` or `awk`, but I looked it up and discovered that `yq` would do the trick rather cleanly. This only took some basic online research!

*I probably could have done an equivalent function but again, not the point*

Afterwards I needed to remember how to do a for loop in bash. Thankfully I found [this tutorial from W3Schools](https://www.w3schools.com/bash/bash_loops.php)

So I tried this little script to see if I got the logic right: 

```bash
title=$(yq '.[].title' books.yml)
for i in $title; do
    echo $i
done
```
*...It didn't work.*

The output ended up looking like this:

```
"Dune
Messiah"
"The
Left
Hand
of
Darkness"
```

I guess it was taking the whole string of characters and... not doing what I wanted! 

But hey, that's how coding works, the computer is doing as it is told, I am the one who misunderstands here.

I figured I would do a bit of a cheat code after seeing the examples in the article I linked, and use a range for the loop to go through. I knew I had a total of 57 books logged, so I did the obvious from there.

```bash
for i in {0..56}; do
	title=$(yq '.['$i'].title' books.yml)
	echo $title
done
```

This worked as expected! Now the output was:

```
"Dune Messiah"
"The Left Hand of Darkness"
```

It was a bit slow but I didn't mind one bit. Some smarter people would do a line count to see how many files there are and such, but hey, this works.

Since I got the main thing going, I revisited some of my older scripts where I do some similar stuff and applied it.

I needed to figure out how to make a filename. This wasn't different from what I already do to generate my permalinks from the title of my posts. Excuse the ugly variable:

```bash
filen=$(echo $title | tr " ,.!" "-"| awk '{print tolower($0)}')
```

Check my article about [my rofi script to generate my posts](/blog/rofi-automated-blog/) in case you are curious about that.

In any case, now everything is done. Here is the whole script:

```bash
for i in {0..56}; do
	title=$(yq '.['$i'].title' books.yml)
	filen=$(echo $title | tr " ,.!" "-"| awk '{print tolower($0)}')
	author=$(yq '.['$i'].author' books.yml)
	cover=$(yq '.['$i'].cover' books.yml)
	start=$(yq '.['$i'].start' books.yml)
	ending=$(yq '.['$i'].end' books.yml)
	desc=$(yq '.['$i'].summary' books.yml)
	echo $filen.md
	echo -e "---\nlayout: book\ntitle: $title\nauthor: $author\ncover: $cover\nstart: $start\nend: $ending\ndescription: $desc\n---" >> ./test/$filen.md
done
```

This is not a script that will work with any format or for any edgecases, in fact, it doesn't even do things as I expected: all the filenames ended up as `"name-of-book".md`

So those extra quote marks were rather ugly, but by this point I just used the built-in [Bulk Rename](https://docs.xfce.org/xfce/thunar/bulk-renamer/start) tool in Thunar file manager and called it a day.

It is my script, it got me where I needed, and I worked from there. I created the `_books` folder in my website root directory, I did a super quick modification to the liquid syntax to generate my booklog, enabled the `"books"` collection on `_config.yml`, and called it a day.

Now I kind of have to do this with my videogames...

This is day 56 of [#100DaysToOffload](https://100daystooffload.com)
