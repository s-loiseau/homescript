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


def cyclesize():
    if winw == W - 2 * xborder and winh == H - 2 * yborder:
        big()
        topleft()
    else:
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



def getpositions():
    positions = {'TL': (xborder,            yborder),
                 'BL': (xborder,            H - winh - yborder),
                 'BR': (W - winw - xborder, H - winh - yborder),
                 'C':  ((W - winw) // 2,    (H - winh) // 2 ),
                 'TR': (W - winw - xborder, yborder),
                 }
    return positions


def shuffle():
    x, y , winw, winh = getwindow_xywh()
    pos = random.choice(["BR", "TL", "TR", "C", "BL"])
    move(positions[pos])
    nx, ny , winw, winh = getwindow_xywh()
    print(nx, x, ny, y)
    if nx == x and ny == y:
        shuffle()

xborder = 10
yborder = 10
# screen geometry
W, H = getdisplaywh()
# window geometry
windowid = runit('xdotool getactivewindow')[0]
x, y , winw, winh = getwindow_xywh()

positions = getpositions()


if len(sys.argv) > 1 and sys.argv[1] == 'size':
    cyclesize()
if len(sys.argv) > 1 and sys.argv[1] == 'move':
    shuffle()

