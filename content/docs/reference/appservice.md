---
title: "Application Service"
description: "Reference for the Cactus Comments Application Service (backend)"
lead: "Reference for the Cactus Comments backend Application Service."
date: 2020-10-06T08:49:31+00:00
lastmod: 2020-10-06T08:49:31+00:00
draft: false
images: []
menu:
  docs:
    parent: "reference"
weight: 450
toc: true
---

## Responsibility

[Application
services](https://www.matrix.org/docs/guides/application-services/) are
programs that run next to homeservers to augment their capabilities.

The purpose of the Cactus Comments application service is to manage comment
section rooms in collaboration with the homeserver. For a given site, the
application service is responsible for creating rooms on-demand for new comment
sections and to manage moderation roles across all of the comment sections on
the site.

Additionally, the application service provides a chatbot-like interface for
users to register their site through.


## Tech

The Cactus Comments application service implements the [Application Service
API](https://matrix.org/docs/spec/application_service/r0.1.2). This means we
have to expose an HTTP web server. We implemented our web server in the [flask
microframework](https://flask.palletsprojects.com/) and the entire application
in [Python](https://www.python.org/) 3.9. We interact with the Matrix
homeserver with pure HTTP calls and not through an SDK using the
[requests](https://requests.readthedocs.io/) HTTP library. The application is
containerized with [docker](https://www.docker.com/). You can read and
[contribute](../../community/contribute/) to the entire source code
[here](https://gitlab.com/cactus-comments/cactus-appservice).


## Chatbot Interface

The application service provides a chatbot interface for site administrators.
You can access the interface by [inviting @cactusbot:cactus.chat to a
chat](https://matrix.to/#/@cactusbot:cactus.chat). When `cactusbot` has joined
your room, type `help` to get the up-to-date documentation for the chatbot
interface.


## Configuration

The Cactus Comment application service is entirely configured with environment
variables. You only need to configure the appservice if you are [self-hosting
Cactus Comments](../../self-hosting/introduction) and not when using the public
[@cactusbot:cactus.chat](https://matrix.to/#/@cactusbot:cactus.chat).

| Name                    | Required? | Description                                                                                                                                                                    |
|-------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CACTUS_HS_TOKEN         | Yes       | The token used to authenticate the homeserver. This should match `hs_token` in the registration YAML file.                                                                     |
| CACTUS_AS_TOKEN         | Yes       | The token used to authenticate the application service to the homeserver. This should match  `as_token` in the registration YAML file.                                         |
| CACTUS_HOMESERVER_URL   | Yes       | The complete URL of the homeserver that the application service is registered with.                                                                                            |
| CACTUS_USER_ID          | Yes       | The user id for the chatbot interface. This should be based on `sender_localpart` from the registration YAML file. Example: `@cactusbot:example.com`.                          |
| CACTUS_NAMESPACE_REGEX  | No        | The regex for room aliases that the application service controls. This should match the regex in the registration YAML file. Example: `#_comments2_.*`.                        |
| CACTUS_NAMESPACE_PREFIX | No        | The prefix of room aliases that the application service controls. This should only be set if `CACTUS_NAMESPACE_REGEX` is set and it should match that. Example: `_comments_2`. |

`CACTUS_NAMESPACE_REGEX` and `CACTUS_NAMESPACE_PREFIX` exists in case you want
to change the room alias regex that the application service controls. This is
useful if you want to run multiple Cactus Comments deployments on the same
homeserver.
