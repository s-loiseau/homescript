#!/usr/bin/env python
"""
OPEN A ROFI MENU WITH A LIST OF MOVIES
"""

import os
import sys
import re
from subprocess import run, PIPE, Popen


def find_movies(folder, types):
    """
    Find movies in folder
    """
    result = {}
    for root, dirs, files  in os.walk(folder):
        for f in files:
            for movie_type in types:
                if str(f).endswith(movie_type):
                    result[f] = root
    return result


def filter_movies(pattern, liste):
    """
    Filter and sort movies list
    """
    result = []
    for x in liste:
        if re.findall(pattern, x, re.I):
            result.append(x)
    result.sort()
    #result.sort(key=1)
    return result


def convert_byte(liste):
    """
    convert a liste into a byte string to feed rofi
    """
    result = b''
    for x in liste:
        result = result + x.encode() + b'\n'
    return result


def spawn_mpv(movie_name, movie_dir):
    target = os.path.join(movie_dir, movie_name)
    Popen(['mpv', '--really-quiet', '--geometry=99%:1%', '--autofit=400x270', target, '&> /dev/null &'])

if __name__ == '__main__':
    # ARGUMENTS
    try:
        pattern = sys.argv[1]
    except:
        pattern = '.'


    home = os.path.expanduser('~')
    root_dir = os.path.join(home, 'Videos')
    types = ['.mkv', '.mp4', 'avi']

    # GET MOVIES
    movie_dict = find_movies(root_dir, types)

    # IF EMPTY QUIT
    if len(movie_dict) == 0:
        exit()

    # FILTER AND SORT
    filter_list = filter_movies(pattern, movie_dict.keys())

    # MENU
    # CONVERT AND RUN ROFI
    rofi_list = convert_byte(filter_list)
    rofi_opts = ['rofi', '-dmenu', '-i', '-p', 'Movies:']
    rofi         = run( rofi_opts, stdout=PIPE, input=rofi_list )

    # SHOW SELECTION
    if rofi.returncode == 0 :
        movie_name = rofi.stdout.decode().strip()
        movie_dir = movie_dict[movie_name]
        spawn_mpv(movie_name, movie_dir)
