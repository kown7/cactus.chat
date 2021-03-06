---
title: "Web Client"
description: "Reference for the Cactus Comments Web Client"
lead: "Reference for the Cactus Comments Web Client"
date: 2020-10-06T08:49:31+00:00
lastmod: 2021-05-07T17:19:00+00:00
draft: false
images: []
menu:
  docs:
    parent: "reference"
weight: 430
toc: true
---

The web client is the interface that presents comments to users, and lets log in and post comments.
It is run in the browser, and should be embedded into each page that you want a comment section on.

## Tech

The Cactus Comments web client is implemented in [Elm](https://elm-lang.org/).
It is is a proper Matrix client, and as such implements the [Client-Server API](https://matrix.org/docs/spec/client_server/r0.6.1).
You can read and
[contribute](../../community/contribute/) to the entire source code
[here](https://gitlab.com/cactus-comments/cactus-appservice).


## Guest Users

The Matrix protocol requires an account to fetch messages from a room.
To allow anonymous access despite this, the web client registers a guest account with the default homeserver when it loads for the first time.
Using this guest account, the client can fetch comments without the user having to sign in.

The access token for this guest account is stored in HTML5 localStorage, so it can be re-used across pages.

The default homeserver needs to allow guest registrations, for the client to initialize properly.
See the [self-hosting](../../self-hosting/howto) section for details on how to set up Synapse for use with Cactus Comments.


## Styling

The client is styled with plain CSS.
The stylesheet is deliberately minimal, in order to maintain a consistent look with the surrounding webpage.

If you want to customize the look and feel of the web client, the best option is to get [the default stylesheet](https://gitlab.com/cactus-comments/cactus-client/-/blob/main/src/style.css) and modify it to your needs.

If you do change the stylesheet, please consider using a [version-specific link to the web client javascript](https://gitlab.com/cactus-comments/cactus-client/-/releases), to avoid breaking changes that might occur on [latest.cactus.chat](https://latest.cactus.chat).


## Configuration

The web client exposes only one javascript function: `initComments`.
This function should be called somewhere in the embedding webpage, with one argument: an object with the configuration parameters described below:

| Name                      | Required?   | Description                                                                                                                                                                      |
| ------------------------- | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `node`                    | Yes         | A DOM node, which the comment section will be rendered inside. If you pass a string, `document.querySelector` is used to find a DOM node (from v0.9.0).                          |
| `defaultHomeserverUrl`    | Yes         | The full URL of a Matrix homeserver. This homeserver needs to have an instance of the Cactus appservice running, and have guest registrations enabled.                           |
| `serverName`              | Yes         | The server name of the same Matrix homeserver as above. This is usually just the domain part of the  homeserver url.
| `siteName`                | Yes         | The `siteName` which you have registered via the appservice's chatbot interface.
| `commentSectionId`        | Yes         | A string identifying the comment section used. If two client instances have the same string here, they will show the same comment section. Cannot contain underscores.
| `pageSize`                | No          | An integer number of comments to show "per page". This is both the number of comments loaded initially, and the number of additional comments loaded when "View More" is pressed.
| `loginEnabled`            | No          | Whether users can log in using Matrix without leaving the page. If false, the Login button becomes a Matrix.to link. Defaults to true. Introduced in v0.7.0.
| `guestPostingEnabled`     | No          | Whether users can post without logging in with their Matrix user. If false, the textarea is disabled when the client is authenticated as a guest. Defaults to true. Introduced in v0.7.0.
| `updateInterval`          | No          | How often to fetch new comments. If zero or negative, updates are never fetched. Defaults to zero. Introduced in v0.8.0.

For example usage, see the [quick-start guide](../../getting-started/quick-start).

### Configuration using data attributes

You can also initialize a comment section by setting [data attributes](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes)
on a script tag that imports the web client.
This can be useful if using a [Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP) that doesn't allow `unsafe-inline`.

When using data attributes, the `node` parameter becomes optional. It defaults to replacing the `script` element itself with a comment section.

The data attribute parameters use are all prefixed with `data-` and use [kebab-casing](https://en.wikipedia.org/wiki/Letter_case#Special_case_styles), where `initComments` would use [camelCasing](https://en.wikipedia.org/wiki/Letter_case#Special_case_styles).

Here's a minimal working example using data attributes:

```html
<script type="text/javascript" src="https://latest.cactus.chat/cactus.js"
        data-default-homeserver-url="https://matrix.cactus.chat:8448"
        data-server-name="cactus.chat"
        data-site-name="my-blog"
        data-comment-section-id="example-page"></script>
```


## Releases

If you want to include the newest release of Cactus Comments on your website,
you should use the `latest` links:

```
<script type="text/javascript" src="https://latest.cactus.chat/cactus.js"></script>
<link rel="stylesheet" href="https://latest.cactus.chat/style.css" type="text/css">
```

If you want to pin it to a specific version, check out [the Gitlab releases
page](https://gitlab.com/cactus-comments/cactus-client/-/releases).
