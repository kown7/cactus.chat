---
title: "Hello, Cactus Comments! 👋🌵"
description: "Introducing Cactus Comments, a federated comment system that you can embed anywhere. It respects your privacy, and puts you in control."
lead: "Today, Asbjørn and I are very excited to announce Cactus Comments! 🎉"
date: 2021-03-01T16:26:29
lastmod: 2021-03-01T16:26:29
draft: false
weight: 50
contributors: ["Asbjørn Olling", "Carl Bordum Hansen"]
commentSectionId: blogpost-hello-cactus
---

Cactus Comments is a federated, web-embeddable comment system. We federate by
building on Matrix - an open standard for decentralized communication. We
believe that Matrix will become the de facto standard for the next
generation of open web systems!

On the frontend - your website - we embed a Matrix client written in Elm that
renders Matrix rooms as comment sections. The client is designed to be
especially easy to embed on static sites. Once you log in to the client,
it will only communicate directly with your Matrix server of choice.

On the backend, an application service is used to create rooms on-demand and
help with moderation. It is built with Python and is completely stateless. It
does this by modelling all state in native Matrix objects without any custom
events -- pretty neat indeed!

The entire thing is free and open source software, so feel free to
[contribute](../../docs/community/contribute). We host a public instance to
make it very [easy to get started](../../docs/getting-started/quick-start).
Thanks for reading and we hope you will enjoy Cactus Comments!
