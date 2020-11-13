#!/usr/bin/env python3

# ###############################################################################
# ###############################################################################
#
#         .d8888b.  888 d8b 888             888       .d8888b
#        d88P  Y88b 888 Y8P 888             888      d88P  Y88b
#        888    888 888     888             888           .d88P
#        888        888 888 888888  .d8888b 88888b.      8888"  888d888
#        888  88888 888 888 888    d88P"    888 "88b      "Y8b. 888P"
#        888    888 888 888 888    888      888  888 888    888 888
#        Y88b  d88P 888 888 Y88b.  Y88b.    888  888 Y88b  d88P 888
#         "Y8888P88 888 888  "Y888  "Y8888P 888  888  "Y8888P"  888
#
# ###############################################################################
# ###############################################################################
# glitcher $(fzf)
import sys
import os
import subprocess
from random import randint
from pathlib import Path


def runit(command):
    """ Return a list."""
    data = subprocess.check_output(command.split())
    return data.decode('utf-8').splitlines()


def listfiles(mypath, mytype):
    """ Return list of files recursively."""
    result = []
    # Match Extension.
    for foundfile in Path(mypath).glob("**/*.*"):
        filetype = str(foundfile).split(".")[-1]
        if filetype in mytype:
            # Force string type was Posix(path)
            result.append(str(foundfile))
    return result


def vidz(videos):
    """ Pop multiple mpv instances."""
    for video in videos:
        x = randint(0, w - ww)
        y = randint(0, h - wh)
        command = "mpv"
        command += " --autofit=%sx%s" % (wh, ww)
        command += " --geometry=%s:%s" % (x, y)
        command += " \'%s\' >/dev/null 2>&1 &" % (video)
        os.system(command)
        # os.system("mpv --autofit=%sx%s --geometry=%s:%s \'%s\' >/dev/null 2>&1 &" % (wh, ww, x, y, video))


def pixz(pixz):
    """ Pop multiple feh instances."""
    for pix in pixz:
        x = randint(0, w - ww)
        y = randint(0, h - wh)
        # command = "feh"
        # command += "--zoom fill -."
        # commmand += "--no-screen-clip"
        # commmand += "--geometry %sx%s+%s+%s"
        os.system("feh --zoom fill -. --no-screen-clip  --geometry %sx%s+%s+%s \'%s\' >/dev/null 2>&1 &" %
                  (ww, wh, x, y, pix))
screendim = runit('xdotool getdisplaygeometry')
w, h = screendim[0].split()

w = int(w)
h = int(h)


ww = 640
wh = 480


# GET PATH
if len(sys.argv) > 1:
    varpath = sys.argv[1]
else:
    varpath = "."

ptypes = ["jpg", "png", "jpeg"]
vtypes = ["mpeg", "mkv", "mp4"]

# READ ALL
ptypes = ["JPG", "jpg", "png", "jpeg"]
vtypes = ["mpeg", "mkv", "mp4"]

p = listfiles(varpath, ptypes)
pixz(p[:10])
#v = listfiles(varpath, vtypes)
#vidz(v[:10])
