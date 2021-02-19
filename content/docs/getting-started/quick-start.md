---
title: "Quick Start"
description: "One page summary of how to embed Cactus Comments on your site."
lead: "This guide shows the easiest way to embed Cactus Comments on your website."
date: 2020-11-16T13:59:39+01:00
lastmod: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "getting-started"
weight: 110
toc: true
---

The setup described here will use the public cactus.chat servers. If you want
to host your own server, see [self-hosting](../../self-hosting/introduction).


## Prerequisites

To start using Cactus Comments, you need a [Matrix](https://matrix.org)
account. This account may be on any homeserver. If you don't have one, you can
[register here](https://app.element.io).

Additionally, you need a website where you want to embed comment sections.


## Register Your Site

The first thing you need to do is to register your site with Cactus Comments.
To do this, start a [new chat with
@cactusbot:cactus.chat](https://matrix.to/#/@cactusbot:cactus.chat) and type:

```
register <YOUR-SITE-NAME>
```

Where `<YOUR-SITE-NAME>` is a unique identifier you choose. It does *not* have
to match your domain.


## Embed Cactus Comments

To embed the Cactus Comments frontend, you need to include the following JS and
CSS:

**TODO: use the rolling release links here.**

```
<script type="text/javascript" src="https://gateway.pinata.cloud/ipfs/QmVQYzRzcXS3hvYxL7dpWdT8YRbb4AfZzmtMsMmaWpS9Wo/v0.3.1/cactus.js"></script>
<link rel="stylesheet" href="https://gateway.pinata.cloud/ipfs/QmVQYzRzcXS3hvYxL7dpWdT8YRbb4AfZzmtMsMmaWpS9Wo/v0.3.1/style.css" type="text/css">
```

Then insert a `<div>` where you want the comment section to appear:

```
<div id="comment-section"></div>
```

Finally, you need to initialize the comment section:

```
<script>
initComments({
  node: document.getElementById("comment-section"),
  defaultHomeserverUrl: "https://cactus.chat",
  siteName: "<YOUR-SITE-NAME>",
  commentSectionId: "section1",
  serverName: "cactus.chat"
})
</script>
```

The `commentSectionId` can be changed to insert different comment sections.
