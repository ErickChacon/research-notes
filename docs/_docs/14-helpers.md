---
title: "Helpers"
permalink: /docs/helpers/
excerpt: "Jekyll `_includes` and other helpers to use as shortcuts for creating archives, galleries, table of contents, and more."
gallery:
  - url: /assets/images/unsplash-gallery-image-1.jpg
    image_path: /assets/images/unsplash-gallery-image-1-th.jpg
    alt: "placeholder image 1"
    title: "Image 1 title caption"
  - url: /assets/images/unsplash-gallery-image-2.jpg
    image_path: /assets/images/unsplash-gallery-image-2-th.jpg
    alt: "placeholder image 2"
    title: "Image 2 title caption"
  - url: /assets/images/unsplash-gallery-image-3.jpg
    image_path: /assets/images/unsplash-gallery-image-3-th.jpg
    alt: "placeholder image 3"
    title: "Image 3 title caption"
feature_row:
  - image_path: /assets/images/unsplash-gallery-image-1-th.jpg
    alt: "placeholder image 1"
    title: "Placeholder 1"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
  - image_path: /assets/images/unsplash-gallery-image-2-th.jpg
    alt: "placeholder image 2"
    title: "Placeholder 2"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
    url: "#test-link"
    btn_label: "Read More"
    btn_class: "btn--inverse"
  - image_path: /assets/images/unsplash-gallery-image-3-th.jpg
    title: "Placeholder 3"
    excerpt: "This is some sample content that goes here with **Markdown** formatting."
modified: 2016-11-15T12:11:48-05:00
---

{% include toc icon="gears" title="Helpers" %}

You can think of these Jekyll helpers as little shortcuts. Since GitHub Pages doesn't allow most plugins --- [custom tags](https://jekyllrb.com/docs/plugins/#tags) are out. Instead the theme leverages [**includes**](https://jekyllrb.com/docs/templates/#includes) to do something similar.

## Base Path

**Deprecated**. Use `absolute_url` filter instead.

Instead of repeating `{% raw %}{{ site.url }}{{ site.baseurl }}{% endraw %}` over and over again to create absolute URLs, you can use `{% raw %}{{ base_path }}{% endraw %}` instead. Simply add `{% raw %}{% include base_path %}{% endraw %}` to layouts, posts, pages, collections, or other includes and you're good to go.

**ProTip:** It's a good practice to use absolute URL paths for assets (especially post images) so they correctly resolve in the site's XML feeds. Example: `{% raw %}{{ "/assets/images/filename.jpg" | absolute_url }}{% endraw %}` ~> `https://yourdoamin.com/assets/images/filename.jpg`
{: .notice--info}

## Group by Array

[Jekyll Group-By-Array](https://github.com/mushishi78/jekyll-group-by-array) by Max White.

  A liquid include file for Jekyll that allows an object to be grouped by an array.

The Liquid based taxonomy archives found amongst the demo pages rely on this helper.

| Description                   |                          |                             |
| -----------                   | ------------------------ | --------------------------- |
| All posts grouped by category | [Source][category-array] | [Demo][category-array-demo] |
| All posts grouped by tags     | [Source][tag-array]      | [Demo][tag-array-demo]      |
