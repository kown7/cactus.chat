---
title: "Jekyll"
description: "Integrating Cactus Comments with Jekyll"
lead: "Integrating Cactus Comments with the Jekyll static-site generator."
date: 2021-09-02T20:49:35+02:00
lastmod: 2021-09-02T20:49:35+02:00
draft: false
images: []
menu:
  docs:
    parent: "integrations"
weight: 130
toc: true
---

This integration describes how to use Jekyll with cactus.chat on github's 
static pages as a comment function. As Jekyll already supports comments
through disqus, we can use this to our advantage.

The short version is given in [this commit](https://github.com/kown7/rmtoo/commit/ca74264f066389fbd95665843467e29ee7db0273).

### _config.yml

We need to enable the disqus feature as follows. The `shortname` will be used
for the Matrix rooms.

```
# Disqus Comments
disqus:
    # Leave shortname blank to disable comments site-wide.
    # Disable comments for any post by adding `comments: false` to that post's YAML Front Matter.
    shortname: sltoo.github.io 
```


### _includes

Include the required Javascript files from the cactus server. It can 
also be self-hosted. Add or modify `custom-head.html`.

```
<script type="text/javascript" src="https://latest.cactus.chat/cactus.js"></script>
<link rel="stylesheet" href="https://latest.cactus.chat/style.css" type="text/css">
```

Replace the default disqus comment section with a cactus section in `disqus_comments.html`.
The `site.disqus.shortname` can also be left out in the configuration and hard-coded here.

```
{%- if page.comments != false -%}

  <div id="comment-section"></div>
  <script>
  initComments({
    node: document.getElementById("comment-section"),
    defaultHomeserverUrl: "https://matrix.cactus.chat:8448",
    serverName: "cactus.chat",
    siteName: "{{ site.disqus.shortname }}",
    commentSectionId: "{{ page.url }}"
  })
  </script>
  <noscript>Please enable JavaScript to view the <a href="https://cactus.chat" rel="nofollow">comments powered by matrix.org.</a></noscript>

{%- endif -%}
```

The `custom-head.html` needs to be included if you're using a version < 3.0. Please
see the [this commit](https://github.com/kown7/rmtoo/commit/ca74264f066389fbd95665843467e29ee7db0273)
in this case.