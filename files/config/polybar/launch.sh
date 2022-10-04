#!/usr/bin/env bash

pkill polybar

polybar main 2>&1 | tee -a /tmp/polybar.log & disown

