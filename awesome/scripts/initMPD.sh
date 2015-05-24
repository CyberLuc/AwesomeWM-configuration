#!/usr/bin/bash
#-*- coding: utf-8 -*-
# Filename: initMPD.sh

mpc random on
mpc repeat on
mpc listall | mpc add
