---
title: "How to Self-Host"
description: "How to self-host the Cactus Comments backend"
lead: "How to self-host the Cactus Comments backend."
date: 2020-10-06T08:49:31+00:00
lastmod: 2020-10-06T08:49:31+00:00
draft: false
images: []
menu:
  docs:
    parent: "selfhost"
weight: 550
toc: true
---


## Prerequisites

To self-host Cactus Comments you need to be administrator of a Matrix
homeserver.


## Configuration


### Synapse

Application services are programs that runs next to your Matrix homeserver to
augment its capabilities. Create the file `cactus.yaml` that Synapse can read.
Use this file as a template and be sure to change the tokens:

```yaml
# A unique, user-defined ID of the application service which will never change.
id: "Cactus Comments"

# Where the cactus-appservice is hosted:
url: "http://cactus:5000"

# Unique tokens used to authenticate requests between our service and the
# homeserver (and the other way). Use the sha256 hashes of something random.
# CHANGE THESE VALUES.
as_token: "a2d7789eedb3c5076af0864f4af7bef77b1f250ac4e454c373c806876e939cca"
hs_token: "b3b05236568ab46f0d98a978936c514eac93d8f90e6d5cd3895b3db5bb8d788b"

# User associated with our service. In this case "@cactusbot:example.com"
sender_localpart: "cactusbot"

namespaces:
  aliases:
    - exclusive: true
      regex: "#comments_.*"
```

Then you should add the file path to your Synapse `homeserver.yaml`:

``` yaml
app_service_config_files:
  - "/path/to/cactus.yaml"
```

Additionally, you should set `allow_guest_access: true` in `homeserver.yaml` to
allow visitors to read comments without logging in.


### cactus-appservice

The application service is entirely configured with environment variables. For
all options, refer to the reference. There are four required environment
variables and they should match those defined in the appservice registration
file above:

```
CACTUS_HS_TOKEN="b3b05236568ab46f0d98a978936c514eac93d8f90e6d5cd3895b3db5bb8d788b"
CACTUS_AS_TOKEN="a2d7789eedb3c5076af0864f4af7bef77b1f250ac4e454c373c806876e939cca"
CACTUS_HOMESERVER_URL="http://synapse:8008"
CACTUS_USER_ID="@cactusbot:example.com"
```


## Running cactus-appservice

Currently, `cactus-appservice` is only [distributed as a docker
image](https://hub.docker.com/r/cactuscomments/cactus-appservice).

If the environment variables above were defined in `cactus.env`, you could
start the application service directly with docker like:

```bash
$ docker run --env-file cactus.env --name cactus cactuscomments/cactus-appservice:latest
```

In `docker-compose`, this service might look like:

```yaml
services:
  cactus:
    image: cactuscomments/cactus-appservice:latest
    env_file: "cactus.env"
```

The application service is stateless.
