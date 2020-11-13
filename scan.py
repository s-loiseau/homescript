#!/usr/bin/env python3

import sys
import os
from random import randint
from pathlib import Path


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
doctypes = ["pdf", "txt", "md"]
codetypes = ["py", "sh"]

p = listfiles(varpath, ptypes)
v = listfiles(varpath, vtypes)
d = listfiles(varpath, doctypes)
c = listfiles(varpath, codetypes)

print("%-15s %3s" % ("PICTURES:", len(p)))
print("%-15s %3s" % ("VIDEOS:", len(v)))
print("%-15s %3s" % ("DOCS:", len(d)))
print("%-15s %3s" % ("CODES:", len(c)))
