---
title: "Glossary"
description: "Glossary for Cactus Comments"
lead: "Glossary for Cactus Comments"
date: 2020-10-06T08:49:31+00:00
lastmod: 2020-10-06T08:49:31+00:00
draft: false
images: []
menu:
  docs:
    parent: "reference"
weight: 460
toc: true
---


## Moderation Room

When you first register a site with
[@cactusbot:cactus.chat](https://matrix.to/#/@cactusbot:cactus.chat), you will
be invited to a room. This room is what we refer to as the moderation room and
it is a room in Matrix terminology. If you need more moderators across all
comment sections on your site, you can invite them to this room and change
their power level appropriately. [The application service](../appservice) will
make sure to replicate the power levels across your comment sections.


## Comment Section Room

Comment section rooms represent individual comment sections on a site. They are
created automatically and on-demand by [the application
service](../appservice). If you ban a user in a comment section room, they will
get banned automatically in all comment sections rooms for your site.
