# Dotfile

## Introduction

This is how I start to setup a new unix-type machine:

1. clone this repo once git is installed
1. make a symlink from my homedir to the things here
1. find out what I forgot, and add it to the repo
1. GOTO 1

## Other ideas

This is a pretty simple idea, but "why don't you just..."

- use docker images?
- use chef?
- use puppet?
- use XYZZY Configuratron?

They're too complex to do with a minimal OpenBSD system. KISS, and use those
abstraction layers when you're building a deployable application. I want to be
up and running in 5 minutes flat, and be able to do it from a USB device on a
tiny embedded system with no network access.

## TODO

1. write a Makefile and whatever tools make it easy to get a system online QUICKLY.
