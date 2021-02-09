---
title: "Getting Started"
description: "Cactus Comments is a federated comments system for the web, powered by the Matrix protocol."
lead: "Cactus Comments is a federated comments system for the web, powered by the Matrix protocol."
date: 2020-10-06T08:48:57+00:00
lastmod: 2020-10-06T08:48:57+00:00
draft: false
images: []
menu:
  docs:
    parent: "getting-started"
weight: 100
toc: true
---

This guide will show you how to set up Cactus Comments on your website, using the public cactus.chat server.
If you want to host your own server, you can refer to the self-hosting section.

## Register a Site With the Cactusbot

Cactus Comments uses a Matrix application service to manage comment sections.
In order for this to work, you need to register a site with the application service.

To register a site called "mywebsite", use your favorite Matrix client to send this message to
[@cactusbot:cactus.chat](https://matrix.to/#/@cactusbot:cactus.chat):

`register mywebsite`

You should soon be invited to a new moderation room, created for the site.
Power level changes made in this room will be applied to all comment section rooms.

## Add Web Client to Your Page

You can find links for the latest JavaScript and CSS files on the
[Gitlab releases page](https://gitlab.com/cactus-comments/cactus-client/-/releases).
Include those in your webpage.

Add a `<div id="cactus-comments"></div>`, and a `<script>` tag to initialize it like this:

```html
<script>
  initComments({
    node: document.getElementById("cactus-comments"),
    defaultHomeserverUrl: "https://cactus.chat:8448",
    serverName: "cactus.chat",
    siteName: "mywebsite",
    commentSectionId: "MyBlogPost"
  })
</script>
```
