---
title: "Hugo"
description: "Integrating Cactus Comments with Hugo."
lead: "Integrating Cactus Comments with Hugo."
date: 2021-08-26T15:21:01+02:00
draft: false
images: []
menu: 
  docs:
    parent: "integrations"
weight: 130
toc: true
---

Please first complete the "Prerequisites" and "Register Your Site" sections on the [quickstart page](../quick-start).

### Add Shortcode

HUGO, has an option to use *shortcodes* that provide a nice interface to hide some HTML, CSS and JavaScript.

The shortcode `chat.html` must be added to `layouts/shortcodes/` and looks like this

```
<script type="text/javascript" src="https://latest.cactus.chat/cactus.js"></script>
<link rel="stylesheet" href="https://latest.cactus.chat/style.css" type="text/css">
<div id="comment-section"></div>
<script>
initComments({
  node: document.getElementById("comment-section"),
  defaultHomeserverUrl: "https://matrix.cactus.chat:8448",
  serverName: "cactus.chat",
  siteName: "<YOUR-SITE-NAME>",
  commentSectionId: "{{ index .Params 0 }}"
})
</script>
```
"You can see all configuration options [here](https://cactus.chat/docs/reference/web-client/#configuration)

# Add chat to post

Adding the chat ot a post is now as simple as adding

```
{{</* chat cactus-comments */>}}
```
to your post, where `cactus-comments` is the name of the chatroom. You can decide if you want to create a new one for each post (change the name to somthing like the post title)  or if you want to use only one (keep the same name).
