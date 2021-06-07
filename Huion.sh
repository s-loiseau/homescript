#!/usr/bin/env bash
#pacs xsetwacom

#xsetwacom --list parameters
#xsetwacom --list modifiers

# eraser
#xsetwacom --set "HUION Huion Tablet_Q620M Pad pad" Button 8 "key e" 
# brush size
#setwacom --set "HUION Huion Tablet_Q620M Pad pad" Button 9 "key Shift_L" 
# zoom
#xsetwacom --set "HUION Huion Tablet_Q620M Pad pad" Button 10 "key Control_L" 
# undo
#xsetwacom --set "HUION Huion Tablet_Q620M Pad pad" Button 12 "key Control_L z" 

xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 1 "key +ctrl +z -z -ctrl"
xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 2 "key e"
xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 3 "key p"
xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 8 "button +5"
xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 9 "button +4"
xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 10 "key ["
xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 11 "key ]"
xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 12 "key m"
xsetwacom --set 'HUION Huion Tablet_Q620M Pad pad' Button 12 "key v"
