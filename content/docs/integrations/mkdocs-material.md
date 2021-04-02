---
title: "Mkdocs Material"
description: "Integrating Cactus Comments with your website solution."
lead: "Cactus Comments is built to be integrated in any website solution."
date: 2020-10-13T15:21:01+02:00
lastmod: 2020-10-13T15:21:01+02:00
draft: false
images: []
menu: 
  docs:
    parent: "integrations"
weight: 130
toc: true
---

Please first complete the "Prerequisites" and "Register Your Site" sections on the [quickstart page](../quick-start).

### Add Custom Directory
If you do not have one already, you will need a `custom_dir`, set under `theme` in `mkdocs.yml`. 
This allows to [extending or overriding parts of the theme](https://squidfunk.github.io/mkdocs-material/customization/#extending-the-theme).
```
theme:
  name: material
  custom_dir: overrides
```

## Add main.html for overrides
In the `custom_dir`, create a file called `main.html`. 
This allows [overriding a block](https://squidfunk.github.io/mkdocs-material/customization/#overriding-blocks), the comments block specifically in this case.

## Override disqus block
Set the contents of `main.html` to [override the disqus block](https://squidfunk.github.io/mkdocs-material/setup/adding-a-comment-system/#other-comment-systems).

Make sure to change the `siteName` in the `initComments` section, and if needed, change the `serverName` and the `defaultHomeserverUrl`. 
See the [quickstart](../quick-start/#embed-cactus-comments) for more information.

```
{% block disqus %}

<script type="text/javascript" src="https://latest.cactus.chat/cactus.js"></script>
<link rel="stylesheet" href="https://latest.cactus.chat/style.css" type="text/css">

<div id="comment-section">Loading Comments...</div>

<script>
try {
    var docCommentSectionId = document.getElementById('comments-section-id').innerHTML
} catch {
    var docCommentSectionId = "catch-all"
}
if (docCommentSectionId == null ){
    docCommentSectionId = "catch-all"
}

initComments({
  node: document.getElementById("comment-section"),
  defaultHomeserverUrl: "https://cactus.chat",
  siteName: "<YOUR-SITE-NAME>",
  commentSectionId: docCommentSectionId,
  serverName: "cactus.chat"
})
</script>

{% endblock %}
```

### Set page identifiers
In every markdown file for your site, put a hidden paragraph that contains an unique identifier for the comments section to use.
Generally, these go at the top of the markdown file, but that is not required.

Note that a `commentSectionId` cannot include underscores.

```
<p hidden id="comments-section-id">put-unique-id-for-each-page-here</p>
```
