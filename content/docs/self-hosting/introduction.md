---
title: "Why Self-Host?"
description: "Introduction to self-hosting to Cactus Comments backend"
lead: "Why you may want to self-host the Cactus Comments backend."
date: 2020-10-06T08:49:31+00:00
lastmod: 2020-10-06T08:49:31+00:00
draft: false
images: []
menu:
  docs:
    parent: "selfhost"
weight: 530
toc: true
---


## Why?

If you follow the [Quick Start](../../getting-started/quick-start) guide, you
will be using the public infrastructure provided by us. It may be desirable to
host these programs yourself to avoid any dependence on a third party (in this
case, us).


## Infrastructure

The infrastructure is made up of a Matrix homeserver (`Synapse`) and the Cactus
Comments backend service `cactus-appservice`.

`cactus-appservice` is an [application
service](https://www.matrix.org/docs/guides/application-services) that is
reponsible for managing comment section rooms in collaboration with the
homeserver. Its primary responsibility is to create rooms on-demand and to make
sure the right users are moderators in the appropriate rooms.
