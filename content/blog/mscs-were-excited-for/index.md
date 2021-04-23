---
title: "MSCs We're Excited For"
description: "MSCs We're Excited For"
lead: "Some upcoming Matrix Spec Changes will have a big impact on Cactus Comments."
date: 2021-04-23T12:41:27
lastmod: 2021-04-23T12:41:27
draft: false
weight: 30
contributors: ["Asbjørn Olling", "Carl Bordum Hansen"]
commentSectionId: mscs-were-excited-for
---

If you're reading this, you probably already know that Cactus Comments is built on [Matrix](https://matrix.org). We love Matrix and have had a great experience building on it. Using Matrix gives us a bunch of advantages: easy interoperability, extensibility and transparency, among other things.

Matrix is an [open specification](https://spec.matrix.org) with [a process for proposing changes to the spec](https://spec.matrix.org/unstable/proposals/). Matrix specification changes are known as MSCs and there are still many on the way to make Matrix an even better protocol for decentralized communication.

There is a lot of cool work being done in the Matrix ecosystem. In this blog post, we'll talk about the MSCs that we're keeping an eye on to improve Cactus Comments.🌵


## MSC2444 and MSC2753: Peeking

These MSCs propose a new mechanism for reading events from rooms, without joining them.

As of now, there are essentially two ways to read events from a room:

You can [join](https://spec.matrix.org/unstable/client-server-api/#joining-rooms)
the room, which posts a membership event to existing participants,
and adds the room to future responses of the `/sync` endpoint.

Or you can [preview](https://matrix.org/docs/spec/client_server/r0.6.1#id116) a room,
which doesn't send a membership event to other uses,
and doesn't add anything to future `/sync` responses.
Instead, you read can silently read events from a single public room, using a special endpoint.

We prefer previewing to joining, as long as the user is just viewing comments.
Previewing means not spamming the room with unnecessary membership events, and it means that existing Matrix users
aren't followed by notifications they didn't ask for - so it's extremely useful for read-only situations.

*However,* previewing does not currently work over federation.
A user has to be on a server that already has the room, for previewing to work.
Because of this, the client only previews rooms
when it is being used with a guest account.
Guest accounts are always made on the homeserver that creates the rooms,
so we can guarantee that the room is on that server.

When somebody logs in with their Matrix account,
the client only talks to their chosen homeserver from that point forward.
The client then has to join the room, just to read the comments.
It can be annoying if you open a bunch of posts on the same blog that uses Cactus Comments,
because you'll end up having joined a bunch of rooms, that you might not care about.

[MSC2444: Peeking over federation via /peek](https://github.com/matrix-org/matrix-doc/pull/2444) fixes this.
Once it is merged, the client can preview the room even when logged in.
It would also allow you to use two different homeservers
for guest registration and [the appservice](https://gitlab.com/cactus-comments/cactus-appservice).
I'm not quite sure what the use-case for that would be, but it feels good to decouple things.
¯\\_(ツ)_/¯


[MSC2444](https://github.com/matrix-org/matrix-doc/pull/2444)
depends on 
[MSC2753: Peeking via sync](https://github.com/matrix-org/matrix-doc/pull/2753),
which introduces peeking, a new API for previewing rooms.
It lets us preview events via the standard `/sync` endpoint,
so we can move away from some of the [deprecated endpoints](https://matrix.org/docs/spec/client_server/r0.6.1#deprecated-get-matrix-client-r0-rooms-roomid-initialsync) that we use for previewing.
The `/sync` endpoint endpoint also has some features that we're excited to use with peeking,
notably the `timeout` parameter, which lets us issue long-lived HTTP requests to listen for new events.


## MSC1772: Spaces

As the rest of the community, we are very excited about [MSC1772: Spaces](https://github.com/matrix-org/matrix-doc/pull/1772)! 
Spaces is a way of grouping rooms (*using a room* 🤯), which allows for a discord/slack/rocketchat-style experience.

Cactus Comments could use Spaces to group the comment section rooms that belong to a site, which could be really handy.
Perhaps spaces could even replace the notion of room alias namespacing that we use now - we'll see 🌵

The Cactus Comments application service (backend) essentially only does two things: it creates comment section rooms on-demand and it replicates power levels of moderators and bans. After Spaces, [MSC2962: Managing power levels via Spaces](https://github.com/matrix-org/matrix-doc/pull/2962) could make our backend a very small project - which is great!

In the future, [MSC3083: Restricting room membership based on space membership](https://github.com/matrix-org/matrix-doc/pull/3083) would make Cactus Comments suitable for private intranets which is very exciting.

Overall, the work done around Spaces (which is also what motivates peeking-over-federation) is very helpful for Cactus Comments. Plus, it excites us a regular Matrix users. 🎉


## MSC2674: Event relationships

[MSC2674: Event relationships](https://github.com/matrix-org/matrix-doc/pull/2674)
proposes a new structue for defining event relationships. This is to be used for emoji reactions, threading, and edits - among other things.

It would be nice to have a hackernews/reddit-style tree threading view in the Cactus Comments client to help bring some structure to large comment sections.
So naturally, we're very interested in event relationships.

It's useful to use the same structure for different types of event relationships,
and MSC2674 defines the generalized structure for some very common and useful used event relationships; including those described in MSC2677 and MSC2676, which we're especially looking forward to.


## MSC2677 and MSC2676: Common but unmerged MSCs

If you use Matrix, you probably see and send emoji reactions every day. They are cute, useful and can convey a lot of information. Sadly, [MSC2677: Emoji reactions](https://github.com/matrix-org/matrix-doc/pull/2677) have never been merged to the Matrix spec. The story is the same for [MSC2676: Message editing](https://github.com/matrix-org/matrix-doc/pull/2676), another unmerged MSC with widespread usage in the Matrix network.

A key feature of Cactus Comments is that it adheres to an open standard. 
We want Cactus Comments to be compliant with the Matrix standard, and not just *Element-compatible*. 
This is why we've decided to hold off on implementing these MSCs until they've been standardized in the official spec.
Luckily, it looks like that could be any day now.

*cut the matrix team some slack here, be nice* 🤗

What do you think? What MSCs are you excited for?
