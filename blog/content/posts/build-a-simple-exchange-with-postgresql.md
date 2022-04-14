---
title: "Build a Simple Exchange Platform With Only PostgreSQL"
date: 2022-03-06T14:23:52+08:00
draft: false
tags: []
author: "sekun"
showToc: true
TocOpen: true
hidemeta: false
comments: false
disableShare: false
hideSummary: false
cover:
    image: "posts/p2-cover.jpg"
    alt: "REPLACE ME"
    caption: ""
    relative: false
---

# Introduction

If you're wondering how one could further deepen one's knowledge of PostgreSQL,
beyond using it as a dumb store, while building something potentially useful,
this may be of use to you. I'll go over how you could build a full-fledged
JSON API with just PostgreSQL.

In this post, I'll go over some of the things I learned from my studying, and
answers to some of the burning questions I had before I started cracking this
open.

> **Disclaimer:** I've only started studying PostgreSQL beyond using it as a
> dumb store for over a week. Additionally, query statements in the examples 
> may not be the most well-optimized. As usual, like with opinions, take this
> with a grain of salt. You have been warned!

PostgreSQL is a popular OSS database management system with a tagline: _The
World's Most Advanced Open Source Relational Database_.

> "_Most Advanced_ database? What's so advanced about a persistent data storage?"
> -- sekun, the dumbass, around 2 weeks ago

For the longest time I've only really used it as a "dumb" store where I process
the data in some application server and then persist it in the database.
Nothing really wrong with that, but that wasn't really doing PostgreSQL any
justice. Perhaps it's more than that?

So I sought out to deepen my knowledge in this subject a bit past the beginner
stage by doing the thing I do best: building a project.

# The Project

## What are we building?

The project used for this post is called GNAWEX ([website](https://gnawex.com),
[gitHub](https://github.com/gnawex/gnawex)). It's a simple exchange platform for
an old (and classic) video game I've been playing for nearly 12 years called
[MouseHunt](https://mousehuntgame.com). I'm not going to go too much into what
this game is, but if you like passive games then this might be your kind of
game. In the game you can trade items with other people, or you could
make a listing in the in-game marketplace and it'll match orders for you. In
the game, any transaction that involves gold (the main currency) gets taxed 10%
each, which is huge! So the more serious traders would usually go for F\*cebook
groups or Disc\*rd servers that act as a flea market. Unfortunately for me, I
do not wish to use those platforms. I deleted my FB account so many years ago,
and I try to abstain from Discord. (Slowly, I'll be free from this social media
curse.)

So to make the experience less painful, the app will do the following:

1. Allow people to trade with other people
2. Allow people to create buy/sell listings for tradable items. (Think eBay
   listings)
3. Automatically transact listings with a matched listing (or more). So if
   you have a BUY listing for an item that costs 200SB (think of SB as a
   unit of currency, but it's more like a common item used in barters) with a
   quantity of 20 pieces, then it would look for a SELL listing that costs
   200SB. Whether or not there are 20 listings with a quantity of 1 each, or 1
   listing with a quantity of 20, it shouldn't matter. It should match it.

If the matching fails, it should clean up any of the previous queries in the
transaction to preserve data integrity.

## Tech Stack

- Business logic and data structures in PostgreSQL only
- PostgREST to glue authentication and creation of the JSON API
- Anything goes for the web client

_Obviously_ this is just a fun set of constraints to have for the sake of
cornering myself to learn Postgres. If you, dear Reader, don't want to write
your business logic in the DB for reasons like preference, or that it's too
complex, then don't! It is entirely up to your judgement.

# Development Environment

WIP

# Project Structure

WIP

# Schema Migrations

WIP

# Table Definitions

WIP

# Implementing Business Logic

WIP

# Authorization (Who can do what?)

WIP

# Separating Public API From Private Tables

WIP

# Authentication (Who are you?)

WIP

# Unit Tests

WIP

# Benchmarking

WIP

# Deployment 🚀

WIP

# Conflusion

WIP

[^1]: https://www.postgresql.org

