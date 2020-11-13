#!/usr/bin/env python
import sys
import os
import subprocess
import random



def runit(command):
    """ Return a list."""
    data = subprocess.check_output(command.split())
    return data.decode('utf-8').splitlines()


def getwindow_xywh():
    data = runit('xdotool getwindowfocus getwindowgeometry')
    wpos = data[1].replace(',', ' ').split()
    wx = int(wpos[1])
    wy = int(wpos[2])
    wgeo = data[2].replace('x', ' ').split()
    ww = int(wgeo[1])
    wh = int(wgeo[2])
    return wx,wy,ww,wh


def getdisplaywh():
    screendim = runit('xdotool getdisplaygeometry')
    W, H = screendim[0].split()
    W = int(W)
    H = int(H)
    return W, H


def resize(w, h):
    winw = w - xborder * 2
    winh = h - yborder * 2
    runit('xdotool windowsize %s %s %s' % (windowid, winw, winh))


def move(pos):
    x = pos[0]
    y = pos[1]
    runit('xdotool windowmove %s %s %s' % (windowid, x, y))


def resizeandcenter():
    resize()
    center()


def almostfull():
    resize(W, H)
    topleft()


def big():
    resize(1280, 1080)


def center():
    move(positions['C'])


def topleft():
    move(positions['TL'])


def topright():
    move(positions['TR'])


def bottomleft():
    move(positions['BL'])


def bottomright():
    move(positions['BR'])





windowid = runit('xdotool getactivewindow')[0]
xborder = 10
yborder = 10
W, H = getdisplaywh()


#resize(1280, 1080)
x, y , winw, winh = getwindow_xywh()

positions = {'TL': (xborder, yborder),
             'TR': (W - winw - xborder, yborder),
             'BL': (xborder, H - winh - yborder),
             'BR': (W - winw - xborder, H - winh - yborder),
             'C': ((W - winw) // 2, (H - winh) // 2 ),
             }

actionlist = [big, almostfull, bottomleft, center, topright]

# random action
random.choice(actionlist)()
